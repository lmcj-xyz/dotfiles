return {
    { 'folke/which-key.nvim',                opts = {} },
    { 'lukas-reineke/indent-blankline.nvim', main = "ibl", opts = {} },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        options = { theme = 'rose-pine' },
        config = function()
            require('lualine').setup({})
        end
    },
    --{ '3rd/image.nvim', },
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "m4xshen/hardtime.nvim",
        lazy = false,
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {},
    },
}
