-- set tabulation = 2 spaces for htmls and others files...
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "yaml" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

-- syntax for .tpp files (same as .cpp)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.tpp",
    callback = function()
        vim.bo.filetype = "cpp"
    end,
})
