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
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    -- { '3rd/image.nvim', },
    -- {
    --     "m4xshen/hardtime.nvim",
    --     lazy = false,
    --     dependencies = { "MunifTanjim/nui.nvim" },
    --     opts = {},
    -- },
}
