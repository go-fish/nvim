local M = { 
    "willothy/nvim-cokeline",
    dependencies = {
        "nvim-lua/plenary.nvim",        -- Required for v0.4.0+
        "kyazdani42/nvim-web-devicons", -- If you want devicons
        "stevearc/resession.nvim"       -- Optional, for persistent history
    }
 }
 
 M.config = function ()
    local get_hex = require('cokeline.hlgroups').get_hl_attr

    require('cokeline').setup({
        default_hl = {
            fg = function(buffer)
              return
                buffer.is_focused
                and get_hex('ColorColumn', 'bg')
                 or get_hex('Normal', 'fg')
            end,
            bg = 'NONE'
        },

        -- Only show the bufferline when there are at least this many visible buffers.
        -- default: `1`.
        -- -@type integer
        -- show_if_buffers_are_at_least = 0,
      
        buffers = {
          -- A function to filter out unwanted buffers. Takes a buffer table as a
          -- parameter (see the following section for more infos) and has to return
          -- either `true` or `false`.
          -- default: `false`.
          -- -@type false | fun(buf: Buffer):boolean
          filter_valid = false,
      
          -- A looser version of `filter_valid`, use this function if you still
          -- want the `cokeline-{switch,focus}-{prev,next}` mappings to work for
          -- these buffers without displaying them in your bufferline.
          -- default: `false`.
          -- -@type false | fun(buf: Buffer):boolean
          filter_visible = false,
      
          -- Which buffer to focus when a buffer is deleted, `prev` focuses the
          -- buffer to the left of the deleted one while `next` focuses the one the
          -- right.
          -- default: 'next'.
          focus_on_delete = 'next',
      
          -- If set to `last` new buffers are added to the end of the bufferline,
          -- if `next` they are added next to the current buffer.
          -- if set to `directory` buffers are sorted by their full path.
          -- if set to `number` buffers are sorted by bufnr, as in default Neovim
          -- default: 'last'.
          -- -@type 'last' | 'next' | 'directory' | 'number' | fun(a: Buffer, b: Buffer):boolean
          new_buffers_position = 'last',
      
          -- If true, right clicking a buffer will close it
          -- The close button will still work normally
          -- Default: true
          -- -@type boolean
          delete_on_right_click = true,
        },
      
        mappings = {
          -- Controls what happens when the first (last) buffer is focused and you
          -- try to focus/switch the previous (next) buffer. If `true` the last
          -- (first) buffers gets focused/switched, if `false` nothing happens.
          -- default: `true`.
          -- -@type boolean
          cycle_prev_next = true,
      
          -- Disables mouse mappings
          -- default: `false`.
          -- -@type boolean
          disable_mouse = false,
        },
      
        -- Maintains a history of focused buffers using a ringbuffer
        history = {
          -- -@type boolean
          enabled = true,
          ---The number of buffers to save in the history
          -- -@type integer
          size = 2
        },
      
        rendering = {
          -- The maximum number of characters a rendered buffer is allowed to take
          -- up. The buffer will be truncated if its width is bigger than this
          -- value.
          -- default: `999`.
          -- -@type integer
          max_buffer_width = 999,
        },
      
        pick = {
          -- Whether to use the filename's first letter first before
          -- picking a letter from the valid letters list in order.
          -- default: `true`
          -- -@type boolean
          use_filename = true,
      
          -- The list of letters that are valid as pick letters. Sorted by
          -- keyboard reachability by default, but may require tweaking for
          -- non-QWERTY keyboard layouts.
          -- default: `'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERTYQP'`
          -- -@type string
          letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERTYQP',
        },
      
        -- The highlight group used to fill the tabline space
        fill_hl = 'TabLineFill',

        -- Left sidebar to integrate nicely with file explorer plugins.
        -- This is a table containing a `filetype` key and a list of `components` to
        -- be rendered in the sidebar.
        -- The last component will be automatically space padded if necessary
        -- to ensure the sidebar and the window below it have the same width.
        -- -@type table | false
        sidebar = {
          -- -@type string | string[]
          filetype = { "NvimTree", "neo-tree", "SidebarNvim", "CHADtree" },
          -- -@type Component[]
          components = {},
        },

        components = {
            {
                text = function(buffer) return (buffer.index ~= 1) and '▏' or '' end,
                fg = function() return get_hex('Normal', 'fg') end
            },
            {
              text = function(buffer) return (buffer.is_focused) and ' ' or '' end,
              fg = 'red',
            },
            {
              text = function(buffer) return ' ' .. buffer.devicon.icon end,
              fg = function(buffer) return buffer.devicon.color end,
            },
            {
              text = function(buffer) return buffer.unique_prefix end,
              fg = get_hex('Comment', 'fg'),
              italic = true
            },
            {
              text = function(buffer) return buffer.filename .. ' ' end,
              underline = function(buffer)
                return buffer.is_hovered and not buffer.is_focused
              end
            },
            {
              text = ' ',
              on_click = function(_, _, _, _, buffer)
                buffer:delete()
              end
            },
            {
              text = ' ',
            }
        },
      })

      local map = vim.api.nvim_set_keymap
      map("n", "<C-Left>", "<Plug>(cokeline-focus-prev)", { silent = true })
      map("n", "<C-Right>", "<Plug>(cokeline-focus-next)", { silent = true })
 end

 return M