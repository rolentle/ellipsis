local vcs = require('galaxyline.provider_vcs')
local fileinfo = require('galaxyline.provider_fileinfo')
local galaxyline = require('galaxyline')
local gruvbox = require('gruvbox')

galaxyline.short_line_list = { 'NvimTree', 'fugitive' }

local vi_mode = {
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

local git_branch = {
  GitBranch = {
    provider = vcs.get_git_branch,
    separator = ' ',
  }
}

local file_icon = {
  FileIcon = {
    provider = fileinfo.get_file_icon,
    highlight = {fileinfo.get_file_icon_color},
    separator_highlight = {fileinfo.get_file_icon_color},
  }
}

file_name = {
  FileName = {
    provider = fileinfo.get_current_file_name,
  }
}

left_sections = {vi_mode, git_branch, file_icon, file_name}

for index, section in ipairs(left_sections) do
  galaxyline.section.left[index] = section
end
