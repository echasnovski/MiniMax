## 2025-10-16

- Move `now_if_args` startup helper to 'init.lua' as `_G.Config.now_if_args` to be directly usable from other config files.

- Enable 'mini.misc' behind `now_if_args` instead of `now`. Otherwise `setup_auto_root()` and `setup_restore_cursor()` don't work on initial file(s) if Neovim is started as `nvim -- path/to/file`.

## 2025-10-13

- Initial release.
