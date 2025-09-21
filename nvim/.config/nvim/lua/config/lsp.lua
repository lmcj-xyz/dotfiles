local pyright_override = {
    settings = {
        pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                ignore = { '*' },
            },
        },
    },
}

local eng_dict = {}
for word in io.open(vim.fn.stdpath("config") .. "/spell/en.utf-8.add", "r"):lines() do
    table.insert(eng_dict, word)
end
local ltex_override = {
    filetypes = { "latex", "tex", "bib", },
    settings = {
        ltex = {
            enabled = {'bib', 'context', 'latex', 'plaintex', 'tex'},
            language = 'en-GB',
            dictionary = {
                ["en-GB"] = eng_dict,
            },
        }
    }
}

-- Using mason now
vim.lsp.config('pyright', pyright_override)
vim.lsp.config('ltex_plus', ltex_override)

vim.lsp.enable('clangd')
vim.lsp.enable('ruff')
vim.lsp.enable('pyright')
vim.lsp.enable('lua_ls')
vim.lsp.enable('elmls')
vim.lsp.enable('hls')
vim.lsp.enable('ltex_plus')
vim.lsp.enable('bashls')
vim.lsp.enable('ocamllsp')
--vim.lsp.enable('harper_ls')

vim.diagnostic.config({
    serverity_sort = true,
    float = { border = 'rounded', source = 'if_many' },
    virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
            local diagnostic_message = {
                [vim.diagnostic.severity.ERROR] = diagnostic.message,
                [vim.diagnostic.severity.WARN] = diagnostic.message,
                [vim.diagnostic.severity.INFO] = diagnostic.message,
                [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
        end,
    },
})

vim.keymap.set({ 'n' }, '<leader>d', vim.diagnostic.open_float, { desc = 'Open [D]iagnostics floating window' })
vim.keymap.set({ 'n' }, '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics [Q]uickfix list' })
vim.keymap.set({ 'n' }, '<leader>n', function() vim.diagnostic.jump({count=1, float=true}) end, { desc = 'Go to [N]ext diagnostic' })
vim.keymap.set({ 'n' }, '<leader>p', function() vim.diagnostic.jump({count=-1, float=true}) end, { desc = 'Go to [P]revious diagnostic' })

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(event)
        vim.keymap.set({'n'}, 'grn', vim.lsp.buf.rename, {buffer = event.buf, desc = 'LSP: [R]e[n]ame variable under cursor'})
        vim.keymap.set({'n'}, 'grr', vim.lsp.buf.references, {buffer = event.buf, desc = 'LSP: [G]o to [R]references'})
        vim.keymap.set({'n'}, 'gri', vim.lsp.buf.implementation, {buffer = event.buf, desc = 'LSP: [G]o to [I]mplementation'})
        vim.keymap.set({'n'}, 'grD', vim.lsp.buf.declaration, {buffer = event.buf, desc = 'LSP: [G]o to [D]eclaration'})
        vim.keymap.set({'n'}, 'grd', vim.lsp.buf.definition, {buffer = event.buf, desc = 'LSP: [G]o to [D]efinition'})
        vim.keymap.set({'n', 'x'}, 'gra', vim.lsp.buf.code_action, {buffer = event.buf, desc = 'LSP: [G]o to code [A]ction'})
    end
})
