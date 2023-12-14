return {
	-- color_scheme = "Gruvbox Dark",
	-- color_scheme = "Gruvbox dark, medium (base16)",
	color_scheme = "Gruvbox dark, hard (base16)",

	-- disable the title bar but enable the resizable border
	window_decorations = "RESIZE",

	-- window_background_opacity specifies the alpha channel value with floating
	-- point numbers in the range 0.0 (meaning completely translucent/transparent)
	-- through to 1.0 (meaning completely opaque).
	window_background_opacity = 0.96,

	-- to disable ligatures in most fonts
	-- https://wezfurlong.org/wezterm/config/font-shaping.html
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
}
