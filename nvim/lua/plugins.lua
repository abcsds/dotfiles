-- Bootstrapping lazy.nvim (adjust the path as needed)
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
vim.opt.rtp:prepend(lazypath)

-- Setup Lazy with your plugin list
require("lazy").setup({

  -- Telescope for fuzzy finding
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope", -- load only when the :Telescope command is used
  },

  -- Comments
  {
    "numToStr/Comment.nvim",
    cmd = "CommentToggle",
    config = function() -- This function will run after the plugin is loaded
      require("Comment").setup()
    end
  },

  -- File explorer (nvim-tree, as a Nerdtree-like file viewer)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require("nvim-tree").setup({
        disable_netrw = false,
        hijack_netrw = false,
        open_on_tab = false,
        hijack_cursor = false,
        diagnostics = {
          enable = true,
          icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          },
        },
        update_focused_file = {
          enable = true,
          update_cwd = false,
        },
        system_open = {
        --   cmd = nil,
        --   args = {},
          cmd = "xdg-open",
          args = {},
        },
        view = {
          width = 30,
          side = "left",
        },
      })
    end,
  },

  -- Git integration: gitsigns (for inline git blame and signs)
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,  -- show git blame info inline
      })
    end,
  },

  -- Git diff/graph: diffview for a visual diff interface
  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
  },

  -- LSP & Autocompletion Setup
  -- Mason for installing LSP servers and tools
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function() require("mason").setup() end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
      })
    end,
  },
  -- Basic LSP configuration for Python, Julia and LaTeX
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")
      -- Python LSP (pyright)
      lspconfig.pyright.setup({})
      -- Julia LSP (assuming you have LanguageServer.jl installed)
      lspconfig.julials.setup({})
      -- LaTeX LSP (texlab)
      lspconfig.texlab.setup({})
      -- (Additional server configuration can be added here)
    end,
  },
  -- Completion engine with sources and snippet support
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      require("luasnip,loaders.from_vscode").lazy_load()
      luasnip.config.setup({
        history = true,
      })

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          -- ["<a-n>"] = cmp.mapping.select_next_item(),
          -- ["<a-p>"] = cmp.mapping.select_prev_item(),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = require("lspkind").cmp_format({ with_text = true, maxwidth = 50 }),
        },
      })
    end,
  },

  -- Quarto integration for interactive document work
  {
    "quarto-dev/quarto-nvim",
    ft = { "quarto" },
    config = function()
      require("quarto").setup({})
    end,
  },

  -- LaTeX integration using vimtex (a mature Vimscript plugin)
  {
    "lervag/vimtex",
    ft = { "tex", "latex" },
  },

--   -- GitHub Copilot integration
--   {
--     "github/copilot.vim",
--     cmd = "Copilot",
--   },

  -- Instead of using github/copilot.vim, we use coc.nvim with the coc-copilot extension.
  -- coc.nvim will handle copilot suggestions. Note: coc.nvim is a complete LSP/completion engine.
  {
    "neoclide/coc.nvim",
    branch = "release",
    event = "InsertEnter",
    config = function()
      -- Set up global extensions to include coc-copilot (as well as any others you may need)
      vim.g.coc_global_extensions = { "coc-copilot", "coc-json", "coc-snippets" }
      -- (Further coc.nvim configuration is typically done in a separate coc-settings.json file)
    end,
  },

  -- Theme: Atom One Dark–inspired using onedark.nvim
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "dark", -- adjust style as desired
      })
      require("onedark").load()
    end,
  },

  -- Other inactive themes: gruvbox, nord, and tokyonight
--   {
--     "npxbr/gruvbox.nvim",
--     config = function()
--       vim.g.gruvbox_contrast_dark = "hard"
--       vim.g.gruvbox_italic = 1
--       vim.g.gruvbox_invert_selection = 0
--       vim.g.gruvbox_italicize_strings = 0
--       vim.g.gruvbox_italicize_comments = 0
--   }
--   {
--     "shaunsingh/nord.nvim",
--     config = function()
--       require("nord").set()
--     end,
--   },
--   {
--     "folke/tokyonight.nvim",
--     config = function()
--       require("tokyonight").setup({
--         style = "night", -- adjust style as desired
--       })
--     end,
--   },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {"vim", "vimdoc", "lua", "python", "julia", "markdown"}, -- latex, quarto
        auto_install = false,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        -- autotag = {
        --   enable = true,
        -- },
        -- context_commentstring = {
        --   enable = true,
        -- },
      })
    end,
  },
  -- Lualine: a replacement to the default statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require("lualine").setup({
            icons_enabled = true,
            theme = "onedark",
        })
    end,
  },
  
  -- Spell-checker & Linting: ALE (can check spelling and run linters)
  {
    "dense-analysis/ale",
    ft = { "python", "julia", "tex", "quarto", "markdown" },
    config = function()
      vim.g.ale_linters_explicit = 1
      vim.g.ale_fix_on_save = 1
      -- ALE uses Vim's built-in spell checking if enabled:
      vim.o.spell = true
    end,
  },

  -- Neovim development tools
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    -- opts = {
    --   library = {
    --     -- Load luvit types when the `vim.uv` word is found
    --     { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    --   },
    -- },
  },

})
