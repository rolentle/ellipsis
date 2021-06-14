local vcs = require('galaxyline.provider_vcs')
local fileinfo = require('galaxyline.provider_fileinfo')
local galaxyline = require('galaxyline')
local gruvbox = require('gruvbox')

background = gruvbox.GruvboxFg1.fg.hex

galaxyline.short_line_list = { 'NvimTree', 'fugitive' }

galaxyline.section.left[1] = {
  ViMode = {
    provider = function()
      local alias = {
        n = 'NORMAL',
        i = 'INSERT',
        c = 'COMMAND',
        V = 'VISUAL',
        [''] = 'VISUAL',
        v = 'VISUAL',
        R = 'REPLACE',
      }
      local alias_mode = alias[vim.fn.mode()]
      if alias_mode == nil then
        alias_mode = vim.fn.mode()
      end
      return alias_mode..' '
    end,
  }
}

galaxyline.section.left[2] = {
  FileIcon = {
    provider = fileinfo.get_file_icon,
    highlight = {fileinfo.get_file_icon_color},
    separator_highlight = {fileinfo.get_file_icon_color},
  }
}

galaxyline.section.left[3] = {
  FileName = {
    provider = fileinfo.get_current_file_name,
  }
}
