return {
  {
    'R-nvim/R.nvim',
    -- Only required if you also set defaults.lazy = true
    lazy = false,

    -- R.nvim is still young and we may make some breaking changes from time
    -- to time (but also bug fixes all the time). If configuration stability
    -- is a high priority for you, pin to the latest minor version, but unpin
    -- it and try the latest version before reporting an issue:
    -- version = "~0.1.0"
    config = function()
      -- Create a table with the options to be passed to setup()
      ---@type RConfigUserOpts
      local opts = {
        hook = {
          on_filetype = function()
            vim.api.nvim_buf_set_keymap(0, 'v', '<localleader>rs', '<Plug>RSendSelection', {})
            vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>rd', '<Plug>RDSendLine', {})
            vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>rl', '<Plug>RSendLine', {})
            vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>ra', '<Plug>RSendFile', {})
            vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>ru', '<Plug>RSendAboveLines', {})
            vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>rp', '<Plug>RObjectPr', {})
            vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>rs', '<Plug>RObjectStr', {})
            vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>rN', '<Plug>RObjectNames', {})
            vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>rc', "<Cmd>lua require('r.send').cmd('system2(clearstring)')<CR>", {})
            vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>rh', "<Cmd>lua require('r.run').action('head')<CR>", {})
            -- devtools
            vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>jt', "<Cmd>lua require('r.send').cmd('devtools::test()')<CR>", {})
            vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>jl', "<Cmd>lua require('r.send').cmd('devtools::load_all()')<CR>", {})
            vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>jc', "<Cmd>lua require('r.send').cmd('devtools::check()')<CR>", {})
            vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>js', "<Cmd>lua require('r.send').cmd('startup::restart()')<CR>", {})
            vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>jQ', "<Cmd>lua require('r.send').cmd('Q')<CR>", {})
            vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>jN', "<Cmd>lua require('r.send').cmd('n')<CR>", {})
            vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>jC', "<Cmd>lua require('r.send').cmd('c')<CR>", {})
          end,
        },
        R_path = '~/scoop/apps/R/current/bin',
        R_args = { '--quiet', '--no-save' },
        min_editor_width = 72,
        rconsole_width = 78,
        disable_cmds = {
          'RClearConsole',
          'RCustomStart',
          'RSPlot',
          'RSaveClose',
          'RPackages',
          'RShowEx',
          'RViewDF',
          'RFormatSubsetting',
          'RFormatNumbers',
          'RSeparatePath',
          'RInsertPipe',
          'RInsertAssign',
          'RDputObj',
          'RNRightPart',
          'RNLeftPart',
          'RSendMotion',
          'RInsertLineOutput',
          'ROBToggle',
          'ROBOpenLists',
          'ROBToggle',
          'RMakeWord',
          'RMakeHTML',
          'RMakePDF',
          'RShowRout',
          'RUndebug',
          'RDebug',
          'RShowArgs',
          -- 'RObjectStr',
          -- 'RObjectNames',
          -- 'RObjectPr',
          'RClearAll',
          'RListSpace',
          'RSetwd',
          'RPlot',
          'RSummary',
          'RHelp',
          'RClearConsole',
          'RSPlot',
          'RMakeAll',
          'RMakeRmd',
          'RMakeODT',
          'RMakePDFKb',
          'RMakePDFK',
          'ROBCloseLists',
          'RSendChain',
          'RDSendCurrentFun',
          'RSendCurrentFun',
          'RSendAllFun',
          'RDSendMBlock',
          'RSendMBlock',
          'RSendChunk',
          'RDSendSelection',
        },
      }
      -- Check if the environment variable "R_AUTO_START" exists.
      -- If using fish shell, you could put in your config.fish:
      -- alias r "R_AUTO_START=true nvim"
      if vim.env.R_AUTO_START == 'true' then
        opts.auto_start = 'on startup'
        opts.objbr_auto_start = true
      end
      require('r').setup(opts)
    end,
  },
}
