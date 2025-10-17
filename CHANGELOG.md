## 2025-10-17

- Readd the `now` alias to `40_plugins.lua`.
  It was removed in the change below (Move `now_if_args`...).
  It was readded, because it allows new users to uncomment the example for color schemes outside of mini.hue without further adjustments.

## 2025-10-16

- Move `now_if_args` startup helper to 'init.lua' as `_G.Config.now_if_args` to be directly usable from other config files.

- Enable 'mini.misc' behind `now_if_args` instead of `now`. Otherwise `setup_auto_root()` and `setup_restore_cursor()` don't work on initial file(s) if Neovim is started as `nvim -- path/to/file`.

## 2025-10-13

- Initial release.
