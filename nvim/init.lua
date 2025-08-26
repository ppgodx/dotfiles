-- 在任何插件加载之前禁用blink.cmp
vim.g.lazyvim_blink_main = false

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
