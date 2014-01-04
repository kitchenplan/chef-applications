node.default["sublime_text_packages"] = [
  {"name" => "BracketHighlighter", "source" => "https://github.com/facelessuser/BracketHighlighter.git", "branch" => "BH2ST3"},
  {"name" => "Git", "source" => "https://github.com/kemayo/sublime-text-git.git", "branch" => "master"},
  {"name" => "PHP-Twig", "source" => "https://github.com/Anomareh/PHP-Twig.tmbundle.git", "branch" => "master"},
  {"name" => "SideBarEnhancements", "source" => "https://github.com/titoBouzout/SideBarEnhancements", "branch" => "st3"},
  {"name" => "Theme - Aqua", "source" => "https://github.com/cafarm/aqua-theme.git", "branch" => "master"},
  {"name" => "Theme - Soda", "source" => "https://github.com/buymeasoda/soda-theme.git", "branch" => "master"},
  {"name" => "Tomorrow Color Schemes", "source" => "https://github.com/theymaybecoders/sublime-tomorrow-theme", "branch" => "master"},
  {"name" => "Solarized", "source" => "https://github.com/mybuddymichael/solarized-sublimetext2", "branch" => "master"},
  {"name" => "DetectSyntax", "source" => "https://github.com/phillipkoebbe/DetectSyntax", "branch" => "master"},
  {"name" => "SCSS", "source" => "https://github.com/kuroir/SCSS.tmbundle", "branch" => "master"},
  {"name" => "CoffeeScript", "source" => "https://github.com/Xavura/CoffeeScript-Sublime-Plugin.git", "branch" => "master"},
  {"name" => "MarkdownPreview", "source" => "https://github.com/revolunet/sublimetext-markdown-preview", "branch" => "master"},
  {"name" => "GitGutter", "source" => "https://github.com/jisaacks/GitGutter.git", "branch" => "master"},
  {"name" => "SublimeCodeIntel", "source" => "https://github.com/SublimeCodeIntel/SublimeCodeIntel", "branch" => "master"},
  {"name" => "Emmet", "source" => "https://github.com/sergeche/emmet-sublime", "branch" => "master"},
  {"name" => "Spacegray", "source" => "https://github.com/kkga/spacegray.git", "branch" => "master"}
]
node.default["sublime_text"]["color_scheme"] = "Packages/Tomorrow Color Schemes/Tomorrow-Night-Eighties.tmTheme"

node.default['sublime_text']['preferences'] = {}.tap do |prefs|
  prefs["bold_folder_labels"] = true
  prefs["color_scheme"] = node['sublime_text']['color_scheme']
  prefs["draw_white_space"] = "all"
  prefs["ensure_newline_at_eof_on_save"] = true
  prefs["file_exclude_patterns"] = [
    ".DS_Store",
    ".gitkeep",
    "dump.rdb"
  ]
  prefs["folder_exclude_patterns"] =[
    ".git",
    ".sass-cache",
    "coverage",
    "log",
    "tmp"
  ]
  prefs["highlight_modified_tabs"] = true
  prefs["highlight_line"] = true
  prefs["hot_exit"] = false
  prefs["caret_style"] = "phase"
  prefs["remember_open_files"] = false
  prefs["save_on_focus_lost"] = true
  prefs["tab_size"] = 4
  prefs["theme"] = "Soda Dark 3.sublime-theme"
  prefs["translate_tabs_to_spaces"] = true
  prefs["trim_trailing_white_space_on_save"] = true
  prefs["line_padding_bottom"] = 1
  prefs["line_padding_top"] = 1
  prefs["fade_fold_buttons"] = false
end
