-- vim.fn is the bridge between the vim and lua programming. vim.fn allows us to access vim function from lua.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
-- rtp refers to the run time path. runtime path is the locations where neovim will look into for scrips and plugins and execute them if presents.
-- in lua if we need to call a methos of an object, we need to pass the object as the first argument. Instead of this, we can use : sign before the method, this will pass the object as the first argument by itself.
vim.opt.rtp:prepend(lazypath)
local opts = {}
-- when required a package nvim will search for this package in all the runtime paths/lua folder and if a folder is present with this package name with init.lua file, it will execute that init.lua file.
require("lazy").setup({{
    "rebelot/kanagawa.nvim",
    -- we can line that is inside this fucntion in a seperate line instead of calling this inside the cllback fucntion. The purpose of the callback functoin is to ensure that the plugin is installed before the setup live for the plugin is called.this fucntion in a seperate line instead of calling this inside the callback fucntion. The purpose of the callback functoin is to ensure that the plugin is installed before the setup live for the plugin is called.
    config=function()
        -- vim.cmd is a interface to execute vim commands from lua script.
        -- every package needs to be required and a setup function should be called to activate the plugin.
        require("kanagawa").load("wave")
    end
}, 
    { 'folke/which-key.nvim', opts = {} },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({

                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },

                auto_install = true,

                sync_install = false,

                highlight = { enable = true },

                indent = { enable = true },  

                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<Leader>ss", 
                        node_incremental = "<Leader>si",
                        scope_incremental = "<Leader>sc",
                        node_decremental = "<Leader>sd",
                    },
                },textobjects = {
                    select = {
                        enable = true,

                        -- Automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,

                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            -- You can optionally set descriptions to the mappings (used in the desc parameter of
                            -- nvim_buf_set_keymap) which plugins like which-key display
                            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                            -- You can also use captures from other query groups like `locals.scm`
                            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                        },
                        -- You can choose the select mode (default is charwise 'v')
                        --
                        -- Can also be a function which gets passed a table with the keys
                        -- * query_string: eg '@function.inner'
                        -- * method: eg 'v' or 'o'
                        -- and should return the mode ('v', 'V', or '<c-v>') or a table
                        -- mapping query_strings to modes.
                        selection_modes = {
                            ['@parameter.outer'] = 'v', -- charwise
                            -- ['@function.outer'] = 'V', -- linewise
                            ['@function.outer'] = 'v', -- linewise
                            ['@class.outer'] = '<c-v>', -- blockwise
                        },
                        -- If you set this to `true` (default is `false`) then any textobject is
                        -- extended to include preceding or succeeding whitespace. Succeeding
                        -- whitespace has priority in order to act similarly to eg the built-in
                        -- `ap`.
                        --
                        -- Can also be a function which gets passed a table with the keys
                        -- * query_string: eg '@function.inner'
                        -- * selection_mode: eg 'v'
                        -- and should return true of false
                        include_surrounding_whitespace = true,
                    },
                },

            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
    }

}, opts)

