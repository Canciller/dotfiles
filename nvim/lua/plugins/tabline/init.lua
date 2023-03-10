return {
    'akinsho/bufferline.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    opts = {
        options = {
            mode = "tabs",
            separator_style = 'thick',
            always_show_bufferline = true,
            show_buffer_close_icons = false,
            show_close_icon = false,
            color_icons = true
        },
        highlights = {
            buffer_selected = {
                bold = true
            }
        }
    }
}
