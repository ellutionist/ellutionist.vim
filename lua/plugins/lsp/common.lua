local progress_buf, progress_win, progress_timer, ready_shown

local function show_progress(msg)
  if ready_shown then
    return
  end
  if progress_timer then
    vim.uv.timer_stop(progress_timer)
  end
  if progress_win and vim.api.nvim_win_is_valid(progress_win) then
    vim.api.nvim_buf_set_lines(progress_buf, 0, -1, false, { msg })
  else
    progress_buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(progress_buf, 0, -1, false, { msg })
    progress_win = vim.api.nvim_open_win(progress_buf, false, {
      relative = "editor",
      width = 60,
      height = 1,
      row = vim.o.lines - 2,
      col = vim.o.columns - 62,
      style = "minimal",
      border = "rounded",
      focusable = false,
    })
    vim.api.nvim_win_set_option(progress_win, "winhighlight", "Normal:Normal")
  end
end

local function hide_progress()
  ready_shown = false
  if progress_win and vim.api.nvim_win_is_valid(progress_win) then
    vim.api.nvim_win_close(progress_win, true)
    progress_win = nil
    progress_buf = nil
  end
  if progress_timer then
    vim.uv.timer_stop(progress_timer)
    progress_timer = nil
  end
end

local function show_ready(name)
  ready_shown = true
  if progress_timer then
    vim.uv.timer_stop(progress_timer)
  end
  if progress_win and vim.api.nvim_win_is_valid(progress_win) then
    vim.api.nvim_buf_set_lines(progress_buf, 0, -1, false, { name .. " ready" })
  else
    progress_buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(progress_buf, 0, -1, false, { name .. " ready" })
    progress_win = vim.api.nvim_open_win(progress_buf, false, {
      relative = "editor",
      width = 60,
      height = 1,
      row = vim.o.lines - 2,
      col = vim.o.columns - 62,
      style = "minimal",
      border = "rounded",
      focusable = false,
    })
    vim.api.nvim_win_set_option(progress_win, "winhighlight", "Normal:Normal")
  end
  progress_timer = vim.uv.new_timer()
  progress_timer:start(2000, 0, vim.schedule_wrap(function()
    hide_progress()
  end))
end

vim.lsp.handlers["$/progress"] = function(_, result, ctx)
  if result.value and result.value.kind then
    if result.value.kind == "end" then
      show_ready(ctx.client_id and vim.lsp.get_client_by_id(ctx.client_id).name or "LSP")
    elseif result.value.message then
      show_progress(result.value.kind .. ": " .. result.value.message)
    else
      show_progress(result.value.kind)
    end
  end
end

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    vim.keymap.set("n", "gr", "<cmd>Trouble lsp_references focus=true<cr>")
    vim.keymap.set("n", "gd", "<cmd>Trouble lsp_definitions focus=true<cr>")
    vim.keymap.set("n", "rn", vim.lsp.buf.rename)

    local function file_references()
      local bufnr = vim.api.nvim_get_current_buf()
      local fname = vim.api.nvim_buf_get_name(bufnr)
      local clients = vim.lsp.get_clients({ bufnr = bufnr })
      for _, client in ipairs(clients) do
        if client.supports_method('textDocument/references') then
          local params = vim.lsp.util.make_position_params(0, client.offset_encoding)
          client.request('textDocument/references', params, function(err, result)
            if err or not result or vim.tbl_isempty(result) then return end
            local items = {}
            for _, loc in ipairs(result) do
              if loc.uri and vim.uri_to_fname(loc.uri) == fname then
                local lnum = loc.range.start.line + 1
                local text = (vim.api.nvim_buf_get_lines(bufnr, lnum - 1, lnum, false)[1] or ''):gsub('^%s+', '')
                table.insert(items, {
                  filename = fname,
                  lnum = lnum,
                  col = loc.range.start.character + 1,
                  text = text,
                })
              end
            end
            if #items == 0 then
              vim.notify('No references found in current file', vim.log.levels.INFO)
              return
            end
            vim.fn.setqflist({}, 'r', { title = 'Ref: ' .. vim.fn.fnamemodify(fname, ':t'), items = items })
            vim.cmd('copen')
          end)
          return
        end
      end
      vim.notify('No LSP client supports references', vim.log.levels.WARN)
    end
    vim.keymap.set("n", "gF", file_references, { desc = "References in file" })


    -- require "plugins.lsp.inlay-hint".on_attach(client, bufnr)
    -- require "plugins.lsp.signature".on_attach(client, bufnr)

    local keymap_grp = require "core.keymaps.group"
    local grp = keymap_grp.new_or_get("LanguageServer", "l")
        :add_entry("Diagnostics", "d", "Toggle Diagnostics",
            "Trouble diagnostics toggle")
        :add_entry("Symbols", "s", "Toggle Symbols",
            "Trouble symbols focus=true")
        :add_entry("References", "r", "Go to references",
            "Trouble lsp_references focus=true", { "gr" })
        :add_entry("References in file", "F", "References in current file",
            file_references, { "gF" })
        :add_entry("References", "tr", "toggle lsp references",
            "Trouble lsp_references toggle", { "gr" })
        :add_entry("IncomingCalls", "I", "Incoming calls",
            "Telescope lsp_incoming_calls")
        :add_entry("Implementations", "i", "Implementations",
            "Trouble lsp_implementations")
        :add_entry("TypeDefinition", "T", "Type definition",
            "Trouble lsp_type_definitions focus=true")
        :add_entry("Rename", "R", "Rename", vim.lsp.buf.rename)
        :add_entry("CodeAction", "a", "CodeAction", require("actions-preview").code_actions)
        :add_entry("DiagnosticNext", "n", "DiagnosticNext",
            function()
                vim.diagnostic.goto_next({
                    severity = {
                        min = vim.diagnostic.severity.WARN
                    }
                })
            end)
        :add_entry("DiagnosticNextError", "N", "DiagnosticNextError",
            function()
                vim.diagnostic.goto_next({
                    severity = {
                        min = vim.diagnostic.severity.ERROR
                    }
                })
            end)
        :add_entry("DiagnosticPrev", "p", "DiagnosticPrev",
            function()
                vim.diagnostic.goto_prev({
                    severity = {
                        min = vim.diagnostic.severity.WARN
                    }
                })
            end)
        :add_entry("DiagnosticPrev", "wn", "Workspace DiagnosticNext",
            function()
                require("trouble").next({ mode = "diagnostics", skip_groups = true, jump = true })
            end)
        :add_entry("DiagnosticPrev", "wp", "Workspace DiagnosticPrev",
            function()
                require("trouble").previous({ mode = "diagnostics", skip_groups = true, jump = true })
            end)
        :add_entry("Hover", "h", "Hover", vim.lsp.buf.hover)
        :add_entry("Format", "f", "Format", vim.lsp.buf.format)
        :add_entry("Signature", "s", "Signature", vim.lsp.buf.signature_help)
        :add_entry("LspInfo", "l", "Lsp Info", "LspInfo")

    -- local ok = pcall(vim.lsp.inlay_hint, bufnr, true)
    -- if ok then
    --     grp:add_entry("InlayHintsToggle", "i", "InlayHintsToggle", function() vim.lsp.inlay_hint(bufnr, nil) end)
    -- end
    grp:bind()
end

local flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

return {
    on_attach = on_attach,
    flags = flags,
}
