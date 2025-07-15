require("main.core")
require("main.lazy")

vim.cmd("lang en_US.UTF-8")

if vim.fn.has("nvim") == 1 and vim.fn.executable("nvr") == 1 then
	vim.env.GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
end
