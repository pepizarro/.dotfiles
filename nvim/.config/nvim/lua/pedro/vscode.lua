local vscode = require('vscode')

vim.keymap.set("n", "<leader>t", ":echo 'Leader key works!'<CR>")


vim.keymap.set("n", "]d", function()
	vscode.call("editor.action.marker.next")
end)
-- vim.keymap.set("n", "[d", function()
-- 	vscode.call("editor.action.marker.previous")
-- end)

vim.keymap.set("n", "<leader>ñ", function()
	vscode.call("workbench.action.navigateBack")
end)

vim.keymap.set("n", "<leader>{", function()
	vscode.call("workbench.action.navigateForward")
end)
