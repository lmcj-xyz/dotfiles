return {
    { 'folke/which-key.nvim', opts = {} },
    { 'lukas-reineke/indent-blankline.nvim', main = "ibl", opts = {} },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        options = { theme = 'rose-pine' },
        config = function()
            require('lualine').setup({})
        end
    }
    --{ '3rd/image.nvim', },
}
