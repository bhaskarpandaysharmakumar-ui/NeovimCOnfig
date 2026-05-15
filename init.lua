vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
--vim.o.guicursor = table.concat({
--	"n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
--	"i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
--	"r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100"
--}, ",")
vim.cmd("set cursorline")
vim.cmd("set number")
vim.cmd("set pumheight=10")

require("config.lazy")
