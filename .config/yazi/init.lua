
-- Plugin https://github.com/dedukun/bookmarks.yazi
require("bookmarks"):setup({
	last_directory = { enable = true, persist = true, mode="jump" },
	persist = "all",
	desc_format = "parent",
	file_pick_mode = "parent",
	custom_desc_input = true,
	notify = {
		enable = true,
		timeout = 2,
		message = {
			new = "New bookmark '<key>' -> '<folder>'",
			delete = "Deleted bookmark in '<key>'",
			delete_all = "Deleted all bookmarks",
		},
	},
})
