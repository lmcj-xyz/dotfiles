vim.opt.colorcolumn = "" --remove the line drawn on 80th column for tex files

-- Insert mode maps, see :h vimtex-imaps
vim.fn['vimtex#imaps#add_map']({lhs = '---', rhs = '\\textemdash', wrapper = 'vimtex#imaps#wrap_trivial'})
vim.fn['vimtex#imaps#add_map']({lhs = '-', rhs = '\\item', leader = '#', wrapper = 'vimtex#imaps#wrap_environment', context = 'itemize'})

vim.snippet.add(
    'bq',
    '\\begin{equation}\n\t${1:% content}\n\\end{equation}',
    { buffer = 0 }
)
