-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'alexghergh/nvim-tmux-navigation',
    event = 'VeryLazy',
    config = function()
      local nvim_tmux_nav = require 'nvim-tmux-navigation'
      nvim_tmux_nav.setup {
        disable_when_zoomed = true,
        -- defaults to false
        keybindings = {
          left = '<C-h>',
          down = '<C-j>',
          up = '<C-k>',
          right = '<C-l>',
        },
      }
    end,
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    keys = {
      { '<leader>nt', '<CMD>Neotree toggle<CR>', mode = { 'n' }, desc = 'Toggle [N]eo[T]ree' },
    },
    config = true,
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        open_mapping = [[<C-t>]],
        direction = 'float',
      }
    end,
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {}
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    config = function()
      require('copilot_cmp').setup()
    end,
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-go',
    },
    config = function()
      local neotest_ns = vim.api.nvim_create_namespace 'neotest'
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
            return message
          end,
        },
      }, neotest_ns)
      require('neotest').setup {
        adapters = {
          require 'neotest-go',
        },
      }
    end,
    keys = {
      {
        '<leader>tt',
        function()
          require('neotest').run.run(vim.fn.expand '%')
        end,
        desc = 'Run File',
      },
      {
        '<leader>tT',
        function()
          require('neotest').run.run(vim.loop.cwd())
        end,
        desc = 'Run All Test Files',
      },
      {
        '<leader>tr',
        function()
          require('neotest').run.run()
        end,
        desc = 'Run Nearest',
      },
      {
        '<leader>tl',
        function()
          require('neotest').run.run_last()
        end,
        desc = 'Run Last',
      },
      {
        '<leader>ts',
        function()
          require('neotest').summary.toggle()
        end,
        desc = 'Toggle Summary',
      },
      {
        '<leader>to',
        function()
          require('neotest').output.open { enter = true, auto_close = true }
        end,
        desc = 'Show Output',
      },
      {
        '<leader>tO',
        function()
          require('neotest').output_panel.toggle()
        end,
        desc = 'Toggle Output Panel',
      },
      {
        '<leader>tS',
        function()
          require('neotest').run.stop()
        end,
        desc = 'Stop',
      },
      {
        '<leader>tw',
        function()
          require('neotest').watch.watch(vim.fn.expand '%')
        end,
      },
    },
  },
  {
    'stevearc/oil.nvim',
    version = '*',
    config = function()
      require('oil').setup {
        default_file_explorer = true,
        columns = {
          'icon',
          'permissions',
          'size',
        },
        keymaps = {
          ['g?'] = 'actions.show_help',
          ['<CR>'] = 'actions.select',
          ['<C-s>'] = 'actions.select_vsplit',
          ['<C-g>'] = 'actions.select_split',
          ['<C-t>'] = 'actions.select_tab',
          ['<C-p>'] = 'actions.preview',
          ['<C-c>'] = 'actions.close',
          ['<C-r>'] = 'actions.refresh',
          ['-'] = 'actions.parent',
          ['_'] = 'actions.open_cwd',
          ['`'] = 'actions.cd',
          ['~'] = 'actions.tcd',
          ['gs'] = 'actions.change_sort',
          ['gx'] = 'actions.open_external',
          ['g.'] = 'actions.toggle_hidden',
          ['g\\'] = 'actions.toggle_trash',
        },
        use_default_keymaps = false,
        view_options = {
          show_hidden = false,
          natural_order = true,
          sort = {
            { 'type', 'asc' },
            { 'name', 'asc' },
            { 'size', 'desc' },
          },
        },
      }
    end,
  },
}
