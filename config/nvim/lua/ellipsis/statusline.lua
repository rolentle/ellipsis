local vcs = require('galaxyline.provider_vcs')

require('galaxyline').section.left[1] = {
  GitBranch = {
    provider = vcs.get_git_branch
  }
}
