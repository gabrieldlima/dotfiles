{
  pkgs,
  inputs,
  ...
}:
let
  # Yazi plugins repository
  plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "06e5fe1c7a2a4009c483b28b298700590e7b6784";
    hash = "sha256-jg8+GDsHOSIh8QPYxCvMde1c1D9M78El0PljSerkLQc=";
  };

  # Catppuccin Mocha palette
  rosewater = "#f5e0dc";
  flamingo  = "#f2cdcd";
  pink      = "#f5c2e7";
  mauve     = "#cba6f7";
  red       = "#f38ba8";
  maroon    = "#eba0ac";
  peach     = "#fab387";
  yellow    = "#f9e2af";
  green     = "#a6e3a1";
  teal      = "#94e2d5";
  sky       = "#89dceb";
  sapphire  = "#74c7ec";
  blue      = "#89b4fa";
  lavender  = "#b4befe";
  text      = "#cdd6f4";
  subtext1  = "#bac2de";
  subtext0  = "#a6adc8";
  overlay2  = "#9399b2";
  overlay1  = "#7f849c";
  overlay0  = "#6c7086";
  surface2  = "#585b70";
  surface1  = "#45475a";
  surface0  = "#313244";
  base      = "#1e1e2e";
  mantle    = "#181825";
  crust     = "#010101";
in
{
  programs.yazi = {
    enable = true;
    package = inputs.yazi.packages.${pkgs.system}.default;

    plugins = {
      full-border = "${plugins}/full-border.yazi";
    };

    initLua = ./init.lua;

    keymap = {
      manager.prepend_keymap = [
        { on = [ "<A-f>" ]; run = "seek 5"; desc = "Scroll down (backward) in the preview panel"; }
        { on = [ "<A-b>" ]; run = "seek -5"; desc = "Scroll up (forward) in the preview panel"; }
      ];
    };

    theme = {
      manager = {
        cwd = { fg = "${teal}"; };

        # Hovered
        hovered         = { fg = "${base}"; bg = "${blue}"; };
        preview_hovered = { underline = true; };

        # Find
        find_keyword  = { fg = "${yellow}"; italic = true; };
        find_position = { fg = "${pink}"; bg = "reset"; italic = true; };

        # Marker
        marker_copied   = { fg = "${green}"; bg = "${green}"; };
        marker_cut      = { fg = "${red}"; bg = "${red}"; };
        marker_selected = { fg = "${blue}"; bg = "${blue}"; };

        # Tab
        tab_active   = { fg = "${base}"; bg = "${text}"; };
        tab_inactive = { fg = "${text}"; bg = "${surface1}"; };
        tab_width    = 1;

        # Count
        count_copied   = { fg = "${base}"; bg = "${green}"; };
        count_cut      = { fg = "${base}"; bg = "${red}"; };
        count_selected = { fg = "${base}"; bg = "${blue}"; };

        # Border
        border_symbol = "│";
        border_style  = { fg = "${overlay1}"; };

        # Highlighting
        syntect_theme = "~/.config/bat/themes/CatppuccinMocha.tmTheme";
      };

      status = {
        separator_open  = "";
        separator_close = "";
        separator_style = { fg = "${surface1}"; bg = "${surface1}"; };

        # Mode
        mode_normal = { fg = "${base}"; bg = "${blue}"; bold = true; };
        mode_select = { fg = "${base}"; bg = "${green}"; bold = true; };
        mode_unset  = { fg = "${base}"; bg = "${flamingo}"; bold = true; };

        # Progress
        progress_label  = { fg = "#ffffff"; bold = true; };
        progress_normal = { fg = "${blue}"; bg = "${surface1}"; };
        progress_error  = { fg = "${red}"; bg = "${surface1}"; };

        # Permissions
        permissions_t = { fg = "${blue}"; };
        permissions_r = { fg = "${yellow}"; };
        permissions_w = { fg = "${red}"; };
        permissions_x = { fg = "${green}"; };
        permissions_s = { fg = "${overlay1}"; };
      };

      input = {
        border   = { fg = "${blue}"; };
        title    = {};
        value    = {};
        selected = { reversed = true; };
      };

      select = {
        border   = { fg = "${blue}"; };
        active   = { fg = "${pink}"; };
        inactive = {};
      };

      tasks = {
        border  = { fg = "${blue}"; };
        title   = {};
        hovered = { underline = true; };
      };

      which = {
        mask            = { bg = "${surface0}"; };
        cand            = { fg = "${teal}"; };
        rest            = { fg = "${overlay2}"; };
        desc            = { fg = "${pink}"; };
        separator       = ";  ";
        separator_style = { fg = "${surface2}"; };
      };

      help = {
        on      = { fg = "${pink}"; };
        exec    = { fg = "${teal}"; };
        desc    = { fg = "${overlay2}"; };
        hovered = { bg = "${surface2}"; bold = true; };
        footer  = { fg = "${surface1}"; bg = "${text}"; };
      };

      filetype = {
        rules = [
          # Images
          { mime = "image/*"; fg = "${teal}"; }

          # Videos
          { mime = "video/*"; fg = "${yellow}"; }
          { mime = "audio/*"; fg = "${yellow}"; }

          # Archives
          { mime = "application/zip";             fg = "${pink}"; }
          { mime = "application/gzip";            fg = "${pink}"; }
          { mime = "application/x-tar";           fg = "${pink}"; }
          { mime = "application/x-bzip";          fg = "${pink}"; }
          { mime = "application/x-bzip2";         fg = "${pink}"; }
          { mime = "application/x-7z-compressed"; fg = "${pink}"; }
          { mime = "application/x-rar";           fg = "${pink}"; }

          # Fallback
          { name = "*"; fg = "${text}"; }
          { name = "*/"; fg = "${blue}"; }
        ];
      };

      icon = {
        prepend_rules = [
          { name = ".SRCINFO"; text = "󰣇"; fg = "#89b4fa"; }
          { name = ".Xauthority"; text = ""; fg = "#fab387"; }
          { name = ".Xresources"; text = ""; fg = "#fab387"; }
          { name = ".babelrc"; text = ""; fg = "#f9e2af"; }
          { name = ".bash_profile"; text = ""; fg = "#a6e3a1"; }
          { name = ".bashrc"; text = ""; fg = "#a6e3a1"; }
          { name = ".dockerignore"; text = "󰡨"; fg = "#89b4fa"; }
          { name = ".ds_store"; text = ""; fg = "#45475a"; }
          { name = ".editorconfig"; text = ""; fg = "#f5e0dc"; }
          { name = ".env"; text = ""; fg = "#f9e2af"; }
          { name = ".eslintignore"; text = ""; fg = "#585b70"; }
          { name = ".eslintrc"; text = ""; fg = "#585b70"; }
          { name = ".gitattributes"; text = ""; fg = "#fab387"; }
          { name = ".gitconfig"; text = ""; fg = "#fab387"; }
          { name = ".gitignore"; text = ""; fg = "#fab387"; }
          { name = ".gitlab-ci.yml"; text = ""; fg = "#fab387"; }
          { name = ".gitmodules"; text = ""; fg = "#fab387"; }
          { name = ".gtkrc-2.0"; text = ""; fg = "#f5e0dc"; }
          { name = ".gvimrc"; text = ""; fg = "#a6e3a1"; }
          { name = ".justfile"; text = ""; fg = "#7f849c"; }
          { name = ".luaurc"; text = ""; fg = "#89b4fa"; }
          { name = ".mailmap"; text = "󰊢"; fg = "#45475a"; }
          { name = ".npmignore"; text = ""; fg = "#f38ba8"; }
          { name = ".npmrc"; text = ""; fg = "#f38ba8"; }
          { name = ".nvmrc"; text = ""; fg = "#a6e3a1"; }
          { name = ".prettierrc"; text = ""; fg = "#89b4fa"; }
          { name = ".settings.json"; text = ""; fg = "#6c7086"; }
          { name = ".vimrc"; text = ""; fg = "#a6e3a1"; }
          { name = ".xinitrc"; text = ""; fg = "#fab387"; }
          { name = ".xsession"; text = ""; fg = "#fab387"; }
          { name = ".zprofile"; text = ""; fg = "#a6e3a1"; }
          { name = ".zshenv"; text = ""; fg = "#a6e3a1"; }
          { name = ".zshrc"; text = ""; fg = "#a6e3a1"; }
          { name = "FreeCAD.conf"; text = ""; fg = "#f38ba8"; }
          { name = "PKGBUILD"; text = ""; fg = "#89b4fa"; }
          { name = "PrusaSlicer.ini"; text = ""; fg = "#fab387"; }
          { name = "PrusaSlicerGcodeViewer.ini"; text = ""; fg = "#fab387"; }
          { name = "QtProject.conf"; text = ""; fg = "#a6e3a1"; }
          { name = "R"; text = "󰟔"; fg = "#6c7086"; }
          { name = "_gvimrc"; text = ""; fg = "#a6e3a1"; }
          { name = "_vimrc"; text = ""; fg = "#a6e3a1"; }
          { name = "avif"; text = ""; fg = "#7f849c"; }
          { name = "brewfile"; text = ""; fg = "#313244"; }
          { name = "bspwmrc"; text = ""; fg = "#313244"; }
          { name = "build"; text = ""; fg = "#a6e3a1"; }
          { name = "build.gradle"; text = ""; fg = "#585b70"; }
          { name = "build.zig.zon"; text = ""; fg = "#fab387"; }
          { name = "cantorrc"; text = ""; fg = "#89b4fa"; }
          { name = "checkhealth"; text = "󰓙"; fg = "#89b4fa"; }
          { name = "cmakelists.txt"; text = ""; fg = "#7f849c"; }
          { name = "commit_editmsg"; text = ""; fg = "#fab387"; }
          { name = "compose.yaml"; text = "󰡨"; fg = "#89b4fa"; }
          { name = "compose.yml"; text = "󰡨"; fg = "#89b4fa"; }
          { name = "config"; text = ""; fg = "#7f849c"; }
          { name = "containerfile"; text = "󰡨"; fg = "#89b4fa"; }
          { name = "copying"; text = ""; fg = "#f9e2af"; }
          { name = "copying.lesser"; text = ""; fg = "#f9e2af"; }
          { name = "docker-compose.yaml"; text = "󰡨"; fg = "#89b4fa"; }
          { name = "docker-compose.yml"; text = "󰡨"; fg = "#89b4fa"; }
          { name = "dockerfile"; text = "󰡨"; fg = "#89b4fa"; }
          { name = "ext_typoscript_setup.txt"; text = ""; fg = "#fab387"; }
          { name = "favicon.ico"; text = ""; fg = "#f9e2af"; }
          { name = "fp-info-cache"; text = ""; fg = "#f5e0dc"; }
          { name = "fp-lib-table"; text = ""; fg = "#f5e0dc"; }
          { name = "gemfile$"; text = ""; fg = "#313244"; }
          { name = "gnumakefile"; text = ""; fg = "#7f849c"; }
          { name = "gradle-wrapper.properties"; text = ""; fg = "#585b70"; }
          { name = "gradle.properties"; text = ""; fg = "#585b70"; }
          { name = "gradlew"; text = ""; fg = "#585b70"; }
          { name = "groovy"; text = ""; fg = "#585b70"; }
          { name = "gruntfile.babel.js"; text = ""; fg = "#fab387"; }
          { name = "gruntfile.coffee"; text = ""; fg = "#fab387"; }
          { name = "gruntfile.js"; text = ""; fg = "#fab387"; }
          { name = "gruntfile.ts"; text = ""; fg = "#fab387"; }
          { name = "gtkrc"; text = ""; fg = "#f5e0dc"; }
          { name = "gulpfile.babel.js"; text = ""; fg = "#f38ba8"; }
          { name = "gulpfile.coffee"; text = ""; fg = "#f38ba8"; }
          { name = "gulpfile.js"; text = ""; fg = "#f38ba8"; }
          { name = "gulpfile.ts"; text = ""; fg = "#f38ba8"; }
          { name = "hyprland.conf"; text = ""; fg = "#74c7ec"; }
          { name = "i3blocks.conf"; text = ""; fg = "#f5e0dc"; }
          { name = "i3status.conf"; text = ""; fg = "#f5e0dc"; }
          { name = "justfile"; text = ""; fg = "#7f849c"; }
          { name = "kalgebrarc"; text = ""; fg = "#89b4fa"; }
          { name = "kdeglobals"; text = ""; fg = "#89b4fa"; }
          { name = "kdenlive-layoutsrc"; text = ""; fg = "#89b4fa"; }
          { name = "kdenliverc"; text = ""; fg = "#89b4fa"; }
          { name = "kritadisplayrc"; text = ""; fg = "#cba6f7"; }
          { name = "kritarc"; text = ""; fg = "#cba6f7"; }
          { name = "license"; text = ""; fg = "#f9e2af"; }
          { name = "lxde-rc.xml"; text = ""; fg = "#9399b2"; }
          { name = "lxqt.conf"; text = ""; fg = "#89b4fa"; }
          { name = "makefile"; text = ""; fg = "#7f849c"; }
          { name = "mix.lock"; text = ""; fg = "#7f849c"; }
          { name = "mpv.conf"; text = ""; fg = "#1e1e2e"; }
          { name = "node_modules"; text = ""; fg = "#f38ba8"; }
          { name = "package-lock.json"; text = ""; fg = "#313244"; }
          { name = "package.json"; text = ""; fg = "#f38ba8"; }
          { name = "platformio.ini"; text = ""; fg = "#fab387"; }
          { name = "pom.xml"; text = ""; fg = "#313244"; }
          { name = "procfile"; text = ""; fg = "#7f849c"; }
          { name = "py.typed"; text = ""; fg = "#f9e2af"; }
          { name = "r"; text = "󰟔"; fg = "#6c7086"; }
          { name = "rakefile"; text = ""; fg = "#313244"; }
          { name = "rmd"; text = ""; fg = "#74c7ec"; }
          { name = "settings.gradle"; text = ""; fg = "#585b70"; }
          { name = "svelte.config.js"; text = ""; fg = "#fab387"; }
          { name = "sxhkdrc"; text = ""; fg = "#313244"; }
          { name = "sym-lib-table"; text = ""; fg = "#f5e0dc"; }
          { name = "tailwind.config.js"; text = "󱏿"; fg = "#74c7ec"; }
          { name = "tailwind.config.mjs"; text = "󱏿"; fg = "#74c7ec"; }
          { name = "tailwind.config.ts"; text = "󱏿"; fg = "#74c7ec"; }
          { name = "tmux.conf"; text = ""; fg = "#a6e3a1"; }
          { name = "tmux.conf.local"; text = ""; fg = "#a6e3a1"; }
          { name = "tsconfig.json"; text = ""; fg = "#74c7ec"; }
          { name = "unlicense"; text = ""; fg = "#f9e2af"; }
          { name = "vagrantfile$"; text = ""; fg = "#6c7086"; }
          { name = "vlcrc"; text = "󰕼"; fg = "#fab387"; }
          { name = "webpack"; text = "󰜫"; fg = "#74c7ec"; }
          { name = "weston.ini"; text = ""; fg = "#f9e2af"; }
          { name = "workspace"; text = ""; fg = "#a6e3a1"; }
          { name = "xmobarrc"; text = ""; fg = "#f38ba8"; }
          { name = "xmobarrc.hs"; text = ""; fg = "#f38ba8"; }
          { name = "xmonad.hs"; text = ""; fg = "#f38ba8"; }
          { name = "xorg.conf"; text = ""; fg = "#fab387"; }
          { name = "xsettingsd.conf"; text = ""; fg = "#fab387"; }
          { name = "*.3gp"; text = ""; fg = "#fab387"; }
          { name = "*.3mf"; text = "󰆧"; fg = "#7f849c"; }
          { name = "*.7z"; text = ""; fg = "#fab387"; }
          { name = "*.Dockerfile"; text = "󰡨"; fg = "#89b4fa"; }
          { name = "*.a"; text = ""; fg = "#f5e0dc"; }
          { name = "*.aac"; text = ""; fg = "#74c7ec"; }
          { name = "*.ai"; text = ""; fg = "#f9e2af"; }
          { name = "*.aif"; text = ""; fg = "#74c7ec"; }
          { name = "*.aiff"; text = ""; fg = "#74c7ec"; }
          { name = "*.android"; text = ""; fg = "#a6e3a1"; }
          { name = "*.ape"; text = ""; fg = "#74c7ec"; }
          { name = "*.apk"; text = ""; fg = "#a6e3a1"; }
          { name = "*.app"; text = ""; fg = "#45475a"; }
          { name = "*.applescript"; text = ""; fg = "#7f849c"; }
          { name = "*.asc"; text = "󰦝"; fg = "#6c7086"; }
          { name = "*.ass"; text = "󰨖"; fg = "#f9e2af"; }
          { name = "*.astro"; text = ""; fg = "#f38ba8"; }
          { name = "*.awk"; text = ""; fg = "#585b70"; }
          { name = "*.azcli"; text = ""; fg = "#6c7086"; }
          { name = "*.bak"; text = "󰁯"; fg = "#7f849c"; }
          { name = "*.bash"; text = ""; fg = "#a6e3a1"; }
          { name = "*.bat"; text = ""; fg = "#a6e3a1"; }
          { name = "*.bazel"; text = ""; fg = "#a6e3a1"; }
          { name = "*.bib"; text = "󱉟"; fg = "#f9e2af"; }
          { name = "*.bicep"; text = ""; fg = "#74c7ec"; }
          { name = "*.bicepparam"; text = ""; fg = "#7f849c"; }
          { name = "*.bin"; text = ""; fg = "#45475a"; }
          { name = "*.blade.php"; text = ""; fg = "#f38ba8"; }
          { name = "*.blend"; text = "󰂫"; fg = "#fab387"; }
          { name = "*.blp"; text = "󰺾"; fg = "#89b4fa"; }
          { name = "*.bmp"; text = ""; fg = "#7f849c"; }
          { name = "*.brep"; text = "󰻫"; fg = "#a6e3a1"; }
          { name = "*.bz"; text = ""; fg = "#fab387"; }
          { name = "*.bz2"; text = ""; fg = "#fab387"; }
          { name = "*.bz3"; text = ""; fg = "#fab387"; }
          { name = "*.bzl"; text = ""; fg = "#a6e3a1"; }
          { name = "*.c"; text = ""; fg = "#89b4fa"; }
          { name = "*.c++"; text = ""; fg = "#f38ba8"; }
          { name = "*.cache"; text = ""; fg = "#f5e0dc"; }
          { name = "*.cast"; text = ""; fg = "#fab387"; }
          { name = "*.cbl"; text = "⚙"; fg = "#585b70"; }
          { name = "*.cc"; text = ""; fg = "#f38ba8"; }
          { name = "*.ccm"; text = ""; fg = "#f38ba8"; }
          { name = "*.cfg"; text = ""; fg = "#7f849c"; }
          { name = "*.cjs"; text = ""; fg = "#f9e2af"; }
          { name = "*.clj"; text = ""; fg = "#a6e3a1"; }
          { name = "*.cljc"; text = ""; fg = "#a6e3a1"; }
          { name = "*.cljd"; text = ""; fg = "#74c7ec"; }
          { name = "*.cljs"; text = ""; fg = "#74c7ec"; }
          { name = "*.cmake"; text = ""; fg = "#7f849c"; }
          { name = "*.cob"; text = "⚙"; fg = "#585b70"; }
          { name = "*.cobol"; text = "⚙"; fg = "#585b70"; }
          { name = "*.coffee"; text = ""; fg = "#f9e2af"; }
          { name = "*.conf"; text = ""; fg = "#7f849c"; }
          { name = "*.config.ru"; text = ""; fg = "#313244"; }
          { name = "*.cp"; text = ""; fg = "#74c7ec"; }
          { name = "*.cpp"; text = ""; fg = "#74c7ec"; }
          { name = "*.cppm"; text = ""; fg = "#74c7ec"; }
          { name = "*.cpy"; text = "⚙"; fg = "#585b70"; }
          { name = "*.cr"; text = ""; fg = "#f5e0dc"; }
          { name = "*.crdownload"; text = ""; fg = "#94e2d5"; }
          { name = "*.cs"; text = "󰌛"; fg = "#585b70"; }
          { name = "*.csh"; text = ""; fg = "#585b70"; }
          { name = "*.cshtml"; text = "󱦗"; fg = "#585b70"; }
          { name = "*.cson"; text = ""; fg = "#f9e2af"; }
          { name = "*.csproj"; text = "󰪮"; fg = "#585b70"; }
          { name = "*.css"; text = ""; fg = "#89b4fa"; }
          { name = "*.csv"; text = ""; fg = "#a6e3a1"; }
          { name = "*.cts"; text = ""; fg = "#74c7ec"; }
          { name = "*.cu"; text = ""; fg = "#a6e3a1"; }
          { name = "*.cue"; text = "󰲹"; fg = "#f38ba8"; }
          { name = "*.cuh"; text = ""; fg = "#7f849c"; }
          { name = "*.cxx"; text = ""; fg = "#74c7ec"; }
          { name = "*.cxxm"; text = ""; fg = "#74c7ec"; }
          { name = "*.d"; text = ""; fg = "#a6e3a1"; }
          { name = "*.d.ts"; text = ""; fg = "#fab387"; }
          { name = "*.dart"; text = ""; fg = "#585b70"; }
          { name = "*.db"; text = ""; fg = "#f5e0dc"; }
          { name = "*.dconf"; text = ""; fg = "#f5e0dc"; }
          { name = "*.desktop"; text = ""; fg = "#45475a"; }
          { name = "*.diff"; text = ""; fg = "#45475a"; }
          { name = "*.dll"; text = ""; fg = "#11111b"; }
          { name = "*.doc"; text = "󰈬"; fg = "#585b70"; }
          { name = "*.docx"; text = "󰈬"; fg = "#585b70"; }
          { name = "*.dot"; text = "󱁉"; fg = "#585b70"; }
          { name = "*.download"; text = ""; fg = "#94e2d5"; }
          { name = "*.drl"; text = ""; fg = "#eba0ac"; }
          { name = "*.dropbox"; text = ""; fg = "#6c7086"; }
          { name = "*.dump"; text = ""; fg = "#f5e0dc"; }
          { name = "*.dwg"; text = "󰻫"; fg = "#a6e3a1"; }
          { name = "*.dxf"; text = "󰻫"; fg = "#a6e3a1"; }
          { name = "*.ebook"; text = ""; fg = "#fab387"; }
          { name = "*.edn"; text = ""; fg = "#74c7ec"; }
          { name = "*.eex"; text = ""; fg = "#7f849c"; }
          { name = "*.ejs"; text = ""; fg = "#f9e2af"; }
          { name = "*.el"; text = ""; fg = "#7f849c"; }
          { name = "*.elc"; text = ""; fg = "#7f849c"; }
          { name = "*.elf"; text = ""; fg = "#45475a"; }
          { name = "*.elm"; text = ""; fg = "#74c7ec"; }
          { name = "*.eln"; text = ""; fg = "#7f849c"; }
          { name = "*.env"; text = ""; fg = "#f9e2af"; }
          { name = "*.eot"; text = ""; fg = "#f5e0dc"; }
          { name = "*.epp"; text = ""; fg = "#fab387"; }
          { name = "*.epub"; text = ""; fg = "#fab387"; }
          { name = "*.erb"; text = ""; fg = "#313244"; }
          { name = "*.erl"; text = ""; fg = "#f38ba8"; }
          { name = "*.ex"; text = ""; fg = "#7f849c"; }
          { name = "*.exe"; text = ""; fg = "#45475a"; }
          { name = "*.exs"; text = ""; fg = "#7f849c"; }
          { name = "*.f#"; text = ""; fg = "#74c7ec"; }
          { name = "*.f3d"; text = "󰻫"; fg = "#a6e3a1"; }
          { name = "*.f90"; text = "󱈚"; fg = "#585b70"; }
          { name = "*.fbx"; text = "󰆧"; fg = "#7f849c"; }
          { name = "*.fcbak"; text = ""; fg = "#f38ba8"; }
          { name = "*.fcmacro"; text = ""; fg = "#f38ba8"; }
          { name = "*.fcmat"; text = ""; fg = "#f38ba8"; }
          { name = "*.fcparam"; text = ""; fg = "#f38ba8"; }
          { name = "*.fcscript"; text = ""; fg = "#f38ba8"; }
          { name = "*.fcstd"; text = ""; fg = "#f38ba8"; }
          { name = "*.fcstd1"; text = ""; fg = "#f38ba8"; }
          { name = "*.fctb"; text = ""; fg = "#f38ba8"; }
          { name = "*.fctl"; text = ""; fg = "#f38ba8"; }
          { name = "*.fdmdownload"; text = ""; fg = "#94e2d5"; }
          { name = "*.fish"; text = ""; fg = "#585b70"; }
          { name = "*.flac"; text = ""; fg = "#6c7086"; }
          { name = "*.flc"; text = ""; fg = "#f5e0dc"; }
          { name = "*.flf"; text = ""; fg = "#f5e0dc"; }
          { name = "*.fnl"; text = ""; fg = "#f9e2af"; }
          { name = "*.fs"; text = ""; fg = "#74c7ec"; }
          { name = "*.fsi"; text = ""; fg = "#74c7ec"; }
          { name = "*.fsscript"; text = ""; fg = "#74c7ec"; }
          { name = "*.fsx"; text = ""; fg = "#74c7ec"; }
          { name = "*.gcode"; text = "󰐫"; fg = "#6c7086"; }
          { name = "*.gd"; text = ""; fg = "#7f849c"; }
          { name = "*.gemspec"; text = ""; fg = "#313244"; }
          { name = "*.gif"; text = ""; fg = "#7f849c"; }
          { name = "*.git"; text = ""; fg = "#fab387"; }
          { name = "*.glb"; text = ""; fg = "#fab387"; }
          { name = "*.gnumakefile"; text = ""; fg = "#7f849c"; }
          { name = "*.go"; text = ""; fg = "#74c7ec"; }
          { name = "*.godot"; text = ""; fg = "#7f849c"; }
          { name = "*.gql"; text = ""; fg = "#f38ba8"; }
          { name = "*.graphql"; text = ""; fg = "#f38ba8"; }
          { name = "*.gresource"; text = ""; fg = "#f5e0dc"; }
          { name = "*.gv"; text = "󱁉"; fg = "#585b70"; }
          { name = "*.gz"; text = ""; fg = "#fab387"; }
          { name = "*.h"; text = ""; fg = "#7f849c"; }
          { name = "*.haml"; text = ""; fg = "#f5e0dc"; }
          { name = "*.hbs"; text = ""; fg = "#fab387"; }
          { name = "*.heex"; text = ""; fg = "#7f849c"; }
          { name = "*.hex"; text = ""; fg = "#6c7086"; }
          { name = "*.hh"; text = ""; fg = "#7f849c"; }
          { name = "*.hpp"; text = ""; fg = "#7f849c"; }
          { name = "*.hrl"; text = ""; fg = "#f38ba8"; }
          { name = "*.hs"; text = ""; fg = "#7f849c"; }
          { name = "*.htm"; text = ""; fg = "#fab387"; }
          { name = "*.html"; text = ""; fg = "#fab387"; }
          { name = "*.huff"; text = "󰡘"; fg = "#585b70"; }
          { name = "*.hurl"; text = ""; fg = "#f38ba8"; }
          { name = "*.hx"; text = ""; fg = "#fab387"; }
          { name = "*.hxx"; text = ""; fg = "#7f849c"; }
          { name = "*.ical"; text = ""; fg = "#313244"; }
          { name = "*.icalendar"; text = ""; fg = "#313244"; }
          { name = "*.ico"; text = ""; fg = "#f9e2af"; }
          { name = "*.ics"; text = ""; fg = "#313244"; }
          { name = "*.ifb"; text = ""; fg = "#313244"; }
          { name = "*.ifc"; text = "󰻫"; fg = "#a6e3a1"; }
          { name = "*.ige"; text = "󰻫"; fg = "#a6e3a1"; }
          { name = "*.iges"; text = "󰻫"; fg = "#a6e3a1"; }
          { name = "*.igs"; text = "󰻫"; fg = "#a6e3a1"; }
          { name = "*.image"; text = ""; fg = "#f2cdcd"; }
          { name = "*.img"; text = ""; fg = "#f2cdcd"; }
          { name = "*.import"; text = ""; fg = "#f5e0dc"; }
          { name = "*.info"; text = ""; fg = "#f9e2af"; }
          { name = "*.ini"; text = ""; fg = "#7f849c"; }
          { name = "*.ino"; text = ""; fg = "#74c7ec"; }
          { name = "*.ipynb"; text = ""; fg = "#74c7ec"; }
          { name = "*.iso"; text = ""; fg = "#f2cdcd"; }
          { name = "*.ixx"; text = ""; fg = "#74c7ec"; }
          { name = "*.java"; text = ""; fg = "#f38ba8"; }
          { name = "*.jl"; text = ""; fg = "#7f849c"; }
          { name = "*.jpeg"; text = ""; fg = "#7f849c"; }
          { name = "*.jpg"; text = ""; fg = "#7f849c"; }
          { name = "*.js"; text = ""; fg = "#f9e2af"; }
          { name = "*.json"; text = ""; fg = "#f9e2af"; }
          { name = "*.json5"; text = ""; fg = "#f9e2af"; }
          { name = "*.jsonc"; text = ""; fg = "#f9e2af"; }
          { name = "*.jsx"; text = ""; fg = "#74c7ec"; }
          { name = "*.jwmrc"; text = ""; fg = "#6c7086"; }
          { name = "*.jxl"; text = ""; fg = "#7f849c"; }
          { name = "*.kbx"; text = "󰯄"; fg = "#6c7086"; }
          { name = "*.kdb"; text = ""; fg = "#a6e3a1"; }
          { name = "*.kdbx"; text = ""; fg = "#a6e3a1"; }
          { name = "*.kdenlive"; text = ""; fg = "#89b4fa"; }
          { name = "*.kdenlivetitle"; text = ""; fg = "#89b4fa"; }
          { name = "*.kicad_dru"; text = ""; fg = "#f5e0dc"; }
          { name = "*.kicad_mod"; text = ""; fg = "#f5e0dc"; }
          { name = "*.kicad_pcb"; text = ""; fg = "#f5e0dc"; }
          { name = "*.kicad_prl"; text = ""; fg = "#f5e0dc"; }
          { name = "*.kicad_pro"; text = ""; fg = "#f5e0dc"; }
          { name = "*.kicad_sch"; text = ""; fg = "#f5e0dc"; }
          { name = "*.kicad_sym"; text = ""; fg = "#f5e0dc"; }
          { name = "*.kicad_wks"; text = ""; fg = "#f5e0dc"; }
          { name = "*.ko"; text = ""; fg = "#f5e0dc"; }
          { name = "*.kpp"; text = ""; fg = "#cba6f7"; }
          { name = "*.kra"; text = ""; fg = "#cba6f7"; }
          { name = "*.krz"; text = ""; fg = "#cba6f7"; }
          { name = "*.ksh"; text = ""; fg = "#585b70"; }
          { name = "*.kt"; text = ""; fg = "#6c7086"; }
          { name = "*.kts"; text = ""; fg = "#6c7086"; }
          { name = "*.lck"; text = ""; fg = "#bac2de"; }
          { name = "*.leex"; text = ""; fg = "#7f849c"; }
          { name = "*.less"; text = ""; fg = "#45475a"; }
          { name = "*.lff"; text = ""; fg = "#f5e0dc"; }
          { name = "*.lhs"; text = ""; fg = "#7f849c"; }
          { name = "*.lib"; text = ""; fg = "#11111b"; }
          { name = "*.license"; text = ""; fg = "#f9e2af"; }
          { name = "*.liquid"; text = ""; fg = "#a6e3a1"; }
          { name = "*.lock"; text = ""; fg = "#bac2de"; }
          { name = "*.log"; text = "󰌱"; fg = "#f5e0dc"; }
          { name = "*.lrc"; text = "󰨖"; fg = "#f9e2af"; }
          { name = "*.lua"; text = ""; fg = "#74c7ec"; }
          { name = "*.luac"; text = ""; fg = "#74c7ec"; }
          { name = "*.luau"; text = ""; fg = "#89b4fa"; }
          { name = "*.m"; text = ""; fg = "#89b4fa"; }
          { name = "*.m3u"; text = "󰲹"; fg = "#f38ba8"; }
          { name = "*.m3u8"; text = "󰲹"; fg = "#f38ba8"; }
          { name = "*.m4a"; text = ""; fg = "#74c7ec"; }
          { name = "*.m4v"; text = ""; fg = "#fab387"; }
          { name = "*.magnet"; text = ""; fg = "#45475a"; }
          { name = "*.makefile"; text = ""; fg = "#7f849c"; }
          { name = "*.markdown"; text = ""; fg = "#f5e0dc"; }
          { name = "*.material"; text = "󰔉"; fg = "#f38ba8"; }
          { name = "*.md"; text = ""; fg = "#f5e0dc"; }
          { name = "*.md5"; text = "󰕥"; fg = "#7f849c"; }
          { name = "*.mdx"; text = ""; fg = "#74c7ec"; }
          { name = "*.mint"; text = "󰌪"; fg = "#a6e3a1"; }
          { name = "*.mjs"; text = ""; fg = "#f9e2af"; }
          { name = "*.mk"; text = ""; fg = "#7f849c"; }
          { name = "*.mkv"; text = ""; fg = "#fab387"; }
          { name = "*.ml"; text = ""; fg = "#fab387"; }
          { name = "*.mli"; text = ""; fg = "#fab387"; }
          { name = "*.mm"; text = ""; fg = "#74c7ec"; }
          { name = "*.mo"; text = "∞"; fg = "#7f849c"; }
          { name = "*.mobi"; text = ""; fg = "#fab387"; }
          { name = "*.mojo"; text = ""; fg = "#fab387"; }
          { name = "*.mov"; text = ""; fg = "#fab387"; }
          { name = "*.mp3"; text = ""; fg = "#74c7ec"; }
          { name = "*.mp4"; text = ""; fg = "#fab387"; }
          { name = "*.mpp"; text = ""; fg = "#74c7ec"; }
          { name = "*.msf"; text = ""; fg = "#89b4fa"; }
          { name = "*.mts"; text = ""; fg = "#74c7ec"; }
          { name = "*.mustache"; text = ""; fg = "#fab387"; }
          { name = "*.nfo"; text = ""; fg = "#f9e2af"; }
          { name = "*.nim"; text = ""; fg = "#f9e2af"; }
          { name = "*.nix"; text = ""; fg = "#74c7ec"; }
          { name = "*.nswag"; text = ""; fg = "#a6e3a1"; }
          { name = "*.nu"; text = ">"; fg = "#a6e3a1"; }
          { name = "*.o"; text = ""; fg = "#45475a"; }
          { name = "*.obj"; text = "󰆧"; fg = "#7f849c"; }
          { name = "*.ogg"; text = ""; fg = "#6c7086"; }
          { name = "*.opus"; text = ""; fg = "#6c7086"; }
          { name = "*.org"; text = ""; fg = "#94e2d5"; }
          { name = "*.otf"; text = ""; fg = "#f5e0dc"; }
          { name = "*.out"; text = ""; fg = "#45475a"; }
          { name = "*.part"; text = ""; fg = "#94e2d5"; }
          { name = "*.patch"; text = ""; fg = "#45475a"; }
          { name = "*.pck"; text = ""; fg = "#7f849c"; }
          { name = "*.pcm"; text = ""; fg = "#6c7086"; }
          { name = "*.pdf"; text = ""; fg = "#585b70"; }
          { name = "*.php"; text = ""; fg = "#7f849c"; }
          { name = "*.pl"; text = ""; fg = "#74c7ec"; }
          { name = "*.pls"; text = "󰲹"; fg = "#f38ba8"; }
          { name = "*.ply"; text = "󰆧"; fg = "#7f849c"; }
          { name = "*.pm"; text = ""; fg = "#74c7ec"; }
          { name = "*.png"; text = ""; fg = "#7f849c"; }
          { name = "*.po"; text = ""; fg = "#74c7ec"; }
          { name = "*.pot"; text = ""; fg = "#74c7ec"; }
          { name = "*.pp"; text = ""; fg = "#fab387"; }
          { name = "*.ppt"; text = "󰈧"; fg = "#f38ba8"; }
          { name = "*.prisma"; text = ""; fg = "#6c7086"; }
          { name = "*.pro"; text = ""; fg = "#f9e2af"; }
          { name = "*.ps1"; text = "󰨊"; fg = "#6c7086"; }
          { name = "*.psb"; text = ""; fg = "#74c7ec"; }
          { name = "*.psd"; text = ""; fg = "#74c7ec"; }
          { name = "*.psd1"; text = "󰨊"; fg = "#7f849c"; }
          { name = "*.psm1"; text = "󰨊"; fg = "#7f849c"; }
          { name = "*.pub"; text = "󰷖"; fg = "#f9e2af"; }
          { name = "*.pxd"; text = ""; fg = "#89b4fa"; }
          { name = "*.pxi"; text = ""; fg = "#89b4fa"; }
          { name = "*.py"; text = ""; fg = "#f9e2af"; }
          { name = "*.pyc"; text = ""; fg = "#f9e2af"; }
          { name = "*.pyd"; text = ""; fg = "#f9e2af"; }
          { name = "*.pyi"; text = ""; fg = "#f9e2af"; }
          { name = "*.pyo"; text = ""; fg = "#f9e2af"; }
          { name = "*.pyx"; text = ""; fg = "#89b4fa"; }
          { name = "*.qm"; text = ""; fg = "#74c7ec"; }
          { name = "*.qml"; text = ""; fg = "#a6e3a1"; }
          { name = "*.qrc"; text = ""; fg = "#a6e3a1"; }
          { name = "*.qss"; text = ""; fg = "#a6e3a1"; }
          { name = "*.query"; text = ""; fg = "#a6e3a1"; }
          { name = "*.r"; text = "󰟔"; fg = "#6c7086"; }
          { name = "*.rake"; text = ""; fg = "#313244"; }
          { name = "*.rar"; text = ""; fg = "#fab387"; }
          { name = "*.razor"; text = "󱦘"; fg = "#585b70"; }
          { name = "*.rb"; text = ""; fg = "#313244"; }
          { name = "*.res"; text = ""; fg = "#f38ba8"; }
          { name = "*.resi"; text = ""; fg = "#f38ba8"; }
          { name = "*.rlib"; text = ""; fg = "#fab387"; }
          { name = "*.rmd"; text = ""; fg = "#74c7ec"; }
          { name = "*.rproj"; text = "󰗆"; fg = "#a6e3a1"; }
          { name = "*.rs"; text = ""; fg = "#fab387"; }
          { name = "*.rss"; text = ""; fg = "#fab387"; }
          { name = "*.sass"; text = ""; fg = "#f38ba8"; }
          { name = "*.sbt"; text = ""; fg = "#f38ba8"; }
          { name = "*.sc"; text = ""; fg = "#f38ba8"; }
          { name = "*.scad"; text = ""; fg = "#f9e2af"; }
          { name = "*.scala"; text = ""; fg = "#f38ba8"; }
          { name = "*.scm"; text = "󰘧"; fg = "#f5e0dc"; }
          { name = "*.scss"; text = ""; fg = "#f38ba8"; }
          { name = "*.sh"; text = ""; fg = "#585b70"; }
          { name = "*.sha1"; text = "󰕥"; fg = "#7f849c"; }
          { name = "*.sha224"; text = "󰕥"; fg = "#7f849c"; }
          { name = "*.sha256"; text = "󰕥"; fg = "#7f849c"; }
          { name = "*.sha384"; text = "󰕥"; fg = "#7f849c"; }
          { name = "*.sha512"; text = "󰕥"; fg = "#7f849c"; }
          { name = "*.sig"; text = "λ"; fg = "#fab387"; }
          { name = "*.signature"; text = "λ"; fg = "#fab387"; }
          { name = "*.skp"; text = "󰻫"; fg = "#a6e3a1"; }
          { name = "*.sldasm"; text = "󰻫"; fg = "#a6e3a1"; }
          { name = "*.sldprt"; text = "󰻫"; fg = "#a6e3a1"; }
          { name = "*.slim"; text = ""; fg = "#fab387"; }
          { name = "*.sln"; text = ""; fg = "#6c7086"; }
          { name = "*.slvs"; text = "󰻫"; fg = "#a6e3a1"; }
          { name = "*.sml"; text = "λ"; fg = "#fab387"; }
          { name = "*.so"; text = ""; fg = "#f5e0dc"; }
          { name = "*.sol"; text = ""; fg = "#74c7ec"; }
          { name = "*.spec.js"; text = ""; fg = "#f9e2af"; }
          { name = "*.spec.jsx"; text = ""; fg = "#74c7ec"; }
          { name = "*.spec.ts"; text = ""; fg = "#74c7ec"; }
          { name = "*.spec.tsx"; text = ""; fg = "#585b70"; }
          { name = "*.sql"; text = ""; fg = "#f5e0dc"; }
          { name = "*.sqlite"; text = ""; fg = "#f5e0dc"; }
          { name = "*.sqlite3"; text = ""; fg = "#f5e0dc"; }
          { name = "*.srt"; text = "󰨖"; fg = "#f9e2af"; }
          { name = "*.ssa"; text = "󰨖"; fg = "#f9e2af"; }
          { name = "*.ste"; text = "󰻫"; fg = "#a6e3a1"; }
          { name = "*.step"; text = "󰻫"; fg = "#a6e3a1"; }
          { name = "*.stl"; text = "󰆧"; fg = "#7f849c"; }
          { name = "*.stp"; text = "󰻫"; fg = "#a6e3a1"; }
          { name = "*.strings"; text = ""; fg = "#74c7ec"; }
          { name = "*.styl"; text = ""; fg = "#a6e3a1"; }
          { name = "*.sub"; text = "󰨖"; fg = "#f9e2af"; }
          { name = "*.sublime"; text = ""; fg = "#fab387"; }
          { name = "*.suo"; text = ""; fg = "#6c7086"; }
          { name = "*.sv"; text = "󰍛"; fg = "#a6e3a1"; }
          { name = "*.svelte"; text = ""; fg = "#fab387"; }
          { name = "*.svg"; text = "󰜡"; fg = "#fab387"; }
          { name = "*.svh"; text = "󰍛"; fg = "#a6e3a1"; }
          { name = "*.swift"; text = ""; fg = "#fab387"; }
          { name = "*.t"; text = ""; fg = "#74c7ec"; }
          { name = "*.tbc"; text = "󰛓"; fg = "#585b70"; }
          { name = "*.tcl"; text = "󰛓"; fg = "#585b70"; }
          { name = "*.templ"; text = ""; fg = "#f9e2af"; }
          { name = "*.terminal"; text = ""; fg = "#a6e3a1"; }
          { name = "*.test.js"; text = ""; fg = "#f9e2af"; }
          { name = "*.test.jsx"; text = ""; fg = "#74c7ec"; }
          { name = "*.test.ts"; text = ""; fg = "#74c7ec"; }
          { name = "*.test.tsx"; text = ""; fg = "#585b70"; }
          { name = "*.tex"; text = ""; fg = "#45475a"; }
          { name = "*.tf"; text = ""; fg = "#585b70"; }
          { name = "*.tfvars"; text = ""; fg = "#585b70"; }
          { name = "*.tgz"; text = ""; fg = "#fab387"; }
          { name = "*.tmux"; text = ""; fg = "#a6e3a1"; }
          { name = "*.toml"; text = ""; fg = "#585b70"; }
          { name = "*.torrent"; text = ""; fg = "#94e2d5"; }
          { name = "*.tres"; text = ""; fg = "#7f849c"; }
          { name = "*.ts"; text = ""; fg = "#74c7ec"; }
          { name = "*.tscn"; text = ""; fg = "#7f849c"; }
          { name = "*.tsconfig"; text = ""; fg = "#fab387"; }
          { name = "*.tsx"; text = ""; fg = "#585b70"; }
          { name = "*.ttf"; text = ""; fg = "#f5e0dc"; }
          { name = "*.twig"; text = ""; fg = "#a6e3a1"; }
          { name = "*.txt"; text = "󰈙"; fg = "#a6e3a1"; }
          { name = "*.txz"; text = ""; fg = "#fab387"; }
          { name = "*.typoscript"; text = ""; fg = "#fab387"; }
          { name = "*.ui"; text = ""; fg = "#313244"; }
          { name = "*.v"; text = "󰍛"; fg = "#a6e3a1"; }
          { name = "*.vala"; text = ""; fg = "#585b70"; }
          { name = "*.vh"; text = "󰍛"; fg = "#a6e3a1"; }
          { name = "*.vhd"; text = "󰍛"; fg = "#a6e3a1"; }
          { name = "*.vhdl"; text = "󰍛"; fg = "#a6e3a1"; }
          { name = "*.vim"; text = ""; fg = "#a6e3a1"; }
          { name = "*.vsh"; text = ""; fg = "#7f849c"; }
          { name = "*.vsix"; text = ""; fg = "#6c7086"; }
          { name = "*.vue"; text = ""; fg = "#a6e3a1"; }
          { name = "*.wasm"; text = ""; fg = "#585b70"; }
          { name = "*.wav"; text = ""; fg = "#74c7ec"; }
          { name = "*.webm"; text = ""; fg = "#fab387"; }
          { name = "*.webmanifest"; text = ""; fg = "#f9e2af"; }
          { name = "*.webp"; text = ""; fg = "#7f849c"; }
          { name = "*.webpack"; text = "󰜫"; fg = "#74c7ec"; }
          { name = "*.wma"; text = ""; fg = "#74c7ec"; }
          { name = "*.woff"; text = ""; fg = "#f5e0dc"; }
          { name = "*.woff2"; text = ""; fg = "#f5e0dc"; }
          { name = "*.wrl"; text = "󰆧"; fg = "#7f849c"; }
          { name = "*.wrz"; text = "󰆧"; fg = "#7f849c"; }
          { name = "*.x"; text = ""; fg = "#89b4fa"; }
          { name = "*.xaml"; text = "󰙳"; fg = "#585b70"; }
          { name = "*.xcf"; text = ""; fg = "#585b70"; }
          { name = "*.xcplayground"; text = ""; fg = "#fab387"; }
          { name = "*.xcstrings"; text = ""; fg = "#74c7ec"; }
          { name = "*.xls"; text = "󰈛"; fg = "#585b70"; }
          { name = "*.xlsx"; text = "󰈛"; fg = "#585b70"; }
          { name = "*.xm"; text = ""; fg = "#74c7ec"; }
          { name = "*.xml"; text = "󰗀"; fg = "#fab387"; }
          { name = "*.xpi"; text = ""; fg = "#fab387"; }
          { name = "*.xul"; text = ""; fg = "#fab387"; }
          { name = "*.xz"; text = ""; fg = "#fab387"; }
          { name = "*.yaml"; text = ""; fg = "#7f849c"; }
          { name = "*.yml"; text = ""; fg = "#7f849c"; }
          { name = "*.zig"; text = ""; fg = "#fab387"; }
          { name = "*.zip"; text = ""; fg = "#fab387"; }
          { name = "*.zsh"; text = ""; fg = "#a6e3a1"; }
          { name = "*.zst"; text = ""; fg = "#fab387"; }
          { name = "*.🔥"; text = ""; fg = "#fab387"; }
        ];
      };
    };
  };
}
