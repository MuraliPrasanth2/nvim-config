vim.api.nvim_create_autocmd('BufEnter', {
    callback = function(args)
        vim.lsp.start({
            name = 'clangd',
            cmd = {'/home/muralishal/clangd/clangd_17.0.3/bin/clangd'},
            root_dir = vim.fn.getcwd(),
        })
    end,
})
