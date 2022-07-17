require("possession").setup({
	commands = {
		save = "SSave",
		load = "SLoad",
		delete = "SDelete",
		list = "SList",
	},
	session_dir = os.getenv("HOME") .. "/vim_sessions",
	autosave = {
		tmp = true,
		current = true,
		on_load = true,
		on_quit = true,
		after_save = true,
	},
})

require("telescope").load_extension("possession")
