vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<C-n>", ":nohl<CR>")

--delete the content without write into register
keymap.set("n", "dl", '"_dl')

--reselect the paste content
keymap.set("n", "gp", "`[V`]")

--break the line
keymap.set("n", "K", "i<CR><ESC>k$")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

keymap.set("v", "p", "pgvy")
keymap.set("v", "<C-c>", "y")
keymap.set("v", "<C-v>", "p")

keymap.set("n", "<leader>w", ":w<CR>")

--visual paste with out lose current content
keymap.set("v", "p", "pgvy")
keymap.set("v", "d", '"_d')
keymap.set("v", "$", "g_")
keymap.set("v", "g_", "$")

--operator pending mode
keymap.set("o", "L", "$")
keymap.set("o", "H", "^")

if vim.g.vscode then
  --展开所有折叠
  keymap.set("n", "zR", "<Cmd>call VSCodeNotify('editor.unfoldAll')<CR>")
  --关闭所有折叠
  keymap.set("n", "zM", "<Cmd>call VSCodeNotify('editor.foldAll')<CR>")
  --展开当下折叠
  keymap.set("n", "zo", "<Cmd>call VSCodeNotify('editor.unfold')<CR>")
  --关闭/切换当下折叠
  keymap.set("n", "zc", "<Cmd>call VSCodeNotify('editor.toggleFold')<CR>")
  --下一个折叠
  keymap.set("n", "zj", "<Cmd>call VSCodeNotify('editor.gotoNextFold')<CR>")
  --上一个折叠
  keymap.set("n", "zk", "<Cmd>call VSCodeNotify('editor.gotoPreviousFold')<CR>")

  --write file
  keymap.set("n", "<leader>w", "<Cmd>call VSCodeNotify('workbench.action.files.save')<CR>")

  --change symbol
  --keymap.set({"n","i", "v"}, "<leader>s", "<Cmd>call VSCodeNotify('editor.action.rename')<CR>")
  --change all occurrences
  keymap.set({ "i" }, "<C-a>", "<Cmd>call VSCodeNotify('editor.action.changeAll')<CR>")

  -- 取消 Ctrl + / 的快捷键绑, 绑定成vscode line comment
  keymap.set("n", "<c-/>", "<Cmd>call VSCodeNotify('editor.action.commentLine')<CR>")
end
