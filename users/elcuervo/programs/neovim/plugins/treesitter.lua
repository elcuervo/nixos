require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },

  indent = {
    enable = false,
    disable = {},
  },

  endwise = {
    enable = true,
  },

  ensure_installed = {
    "ruby",
    "go",
    "toml",
    "fish",
    "json",
    "html",
    "nix",
    "yaml"
  },

  autotag = {
    enable = true,
  }
}
