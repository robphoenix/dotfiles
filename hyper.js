// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    updateChannel: "stable",
    fontSize: 21,
    fontFamily:
      'Iosevka Light, Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
    cursorColor: "rgba(248,28,229,0.8)",
    cursorShape: "BLOCK",
    cursorBlink: true,
    foregroundColor: "#fff",
    backgroundColor: "#000",
    borderColor: "#333",
    css: "",
    termCSS: "",
    showHamburgerMenu: "",
    showWindowControls: "",
    padding: "12px 14px",
    colors: {
      black: "#000000",
      red: "#ff0000",
      green: "#33ff00",
      yellow: "#ffff00",
      blue: "#0066ff",
      magenta: "#cc00ff",
      cyan: "#00ffff",
      white: "#d0d0d0",
      lightBlack: "#808080",
      lightRed: "#ff0000",
      lightGreen: "#33ff00",
      lightYellow: "#ffff00",
      lightBlue: "#0066ff",
      lightMagenta: "#cc00ff",
      lightCyan: "#00ffff",
      lightWhite: "#ffffff"
    },
    shell: "C:\\Windows\\System32\\wsl.exe",
    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: [],
    env: {},
    bell: false,
    copyOnSelect: true
  },
  plugins: ["hyper-subliminal-theme", "hyperlinks"],
  localPlugins: [],
  keymaps: {
    // Example
    // 'window:devtools': 'cmd+alt+o',
  }
}
