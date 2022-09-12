require("telescope").setup({
    defaults = {
        initial_mode = "insert",
        scroll_strategy = "limit",
        results_title = false,
        layout_strategy = "horizontal",
        path_display = { "smart" },
        file_ignore_patterns = {},
        layout_config = {
            prompt_position = "bottom",
            horizontal = {
                preview_width = 0.5,
            },
        },
        prompt_prefix = " ",
        selection_caret = " ",
    },
    extensions = {
        fzf = {
            fuzzy = false,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
        frecency = {
            show_scores = true,
            show_unindexed = true,
            ignore_patterns = { "*.git/*", "*/tmp/*" },
        },
    },
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("frecency")
