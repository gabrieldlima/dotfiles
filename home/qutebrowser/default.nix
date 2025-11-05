# ╔══════════════════════════════════════════════════════════════════════════════════════════════╗
# ║ ██████╗ ██╗   ██╗████████╗███████╗██████╗ ██████╗  ██████╗ ██╗    ██╗███████╗███████╗██████╗ ║
# ║██╔═══██╗██║   ██║╚══██╔══╝██╔════╝██╔══██╗██╔══██╗██╔═══██╗██║    ██║██╔════╝██╔════╝██╔══██╗║
# ║██║   ██║██║   ██║   ██║   █████╗  ██████╔╝██████╔╝██║   ██║██║ █╗ ██║███████╗█████╗  ██████╔╝║
# ║██║▄▄ ██║██║   ██║   ██║   ██╔══╝  ██╔══██╗██╔══██╗██║   ██║██║███╗██║╚════██║██╔══╝  ██╔══██╗║
# ║╚██████╔╝╚██████╔╝   ██║   ███████╗██████╔╝██║  ██║╚██████╔╝╚███╔███╔╝███████║███████╗██║  ██║║
# ║ ╚══▀▀═╝  ╚═════╝    ╚═╝   ╚══════╝╚═════╝ ╚═╝  ╚═╝ ╚═════╝  ╚══╝╚══╝ ╚══════╝╚══════╝╚═╝  ╚═╝║
# ╚══════════════════════════════════════════════════════════════════════════════════════════════╝

{
...
}: let
  red        = "#cc241d";
  green      = "#98971a";
  blue       = "#458588";
  yellow     = "#d79921";
  black      = "#282828";
  background = "#000000";
  foreground = "#ebdbb2";
in {
  programs.qutebrowser = {
    enable = true;

    quickmarks = {
      chatgpt      = "https://chat.openai.com";
      drive        = "https://drive.google.com/drive/my-drive";
      github       = "https://github.com/dashboard";
      gmail        = "https://mail.google.com/mail";
      google       = "https://www.google.com";
      hacker_news  = "https://news.ycombinator.com";
      home-manager = "https://nix-community.github.io/home-manager/options.xhtml";
      hyprland     = "https://wiki.hyprland.org";
      nixpkgs      = "https://search.nixos.org/packages";
      translate    = "https://translate.google.com";
      twitch       = "https://www.twitch.tv";
      youtube      = "https://www.youtube.com";
    };

    extraConfig = ''
        c.url.searchengines = {
            "DEFAULT": "https://duckduckgo.com/?ia=web&q={}",
            "!g": "https://google.com/search?hl=en&q={}",
            "!d": "https://duckduckgo.com/?ia=web&q={}",
            "!b": "https://search.brave.com/search?q={}&source=web",
        }
    '';

    settings = {
      url = {
        default_page = "https://start.duckduckgo.com";
        start_pages = [ "https://start.duckduckgo.com" ];
      };

      fonts = {
        default_family = "Iosevka";
        default_size   = "11pt";
      };

      tabs = {
        show = "multiple";
      };

      downloads = {
        position = "bottom";
      };

      content = {
        javascript = {
          clipboard = "access";
        };
      };

      # ------------------------------------------------------------------------
      # THEME
      # ------------------------------------------------------------------------
      colors = {
        webpage.preferred_color_scheme = "dark";

        # ==========
        completion = {
          fg       = "${foreground}";
          even.bg  = "${background}";
          odd.bg   = "${background}";
          match.fg = "${red}";

          category = {
            bg = "${background}";
            fg = "${blue}";
            border = {
              top    = "${black}";
              bottom = "${black}";
            };
          };

          item.selected = {
            bg       = "${blue}";
            fg       = "${background}";
            match.fg = "${red}";
            border = {
              top    = "${black}";
              bottom = "${black}";
            };
          };

          scrollbar = {
            bg = "${background}";
            fg = "${blue}";
          };
        };

        # ==========
        downloads = {
          bar.bg = "${background}";

          error = {
            bg = "${background}";
            fg = "${red}";
          };

          start = {
            bg = "${background}";
            fg = "${blue}";
          };

          stop = {
            bg = "${background}";
            fg = "${green}";
          };

          system = {
            bg = "none";
            fg = "none";
          };
        };

        # ==========
        hints = {
          bg       = "${yellow}";
          fg       = "${background}";
          match.fg = "${foreground}";
        };

        # ==========
        keyhint = {
          bg        = "${background}";
          fg        = "${foreground}";
          suffix.fg = "${blue}";
        };

        # ==========
        messages = {
          error = {
            bg     = "${background}";
            fg     = "${red}";
            border = "${black}";
          };

          info = {
            bg     = "${background}";
            fg     = "${green}";
            border = "${black}";
          };

          warning = {
            bg     = "${background}";
            fg     = "${yellow}";
            border = "${black}";
          };
        };

        # ==========
        prompts = {
          bg     = "${background}";
          fg     = "${foreground}";
          border = "${black}";
          selected = {
            bg = "${background}";
            fg = "${blue}";
          };
        };

        # ==========
        statusbar = {
          progress.bg = "${background}";

          passthrough = {
            bg = "${background}";
            fg = "${foreground}";
          };

          normal = {
            bg = "${background}";
            fg = "${foreground}";
          };

          insert = {
            bg = "${background}";
            fg = "${foreground}";
          };

          command = {
            bg = "${background}";
            fg = "${foreground}";
            private = {
              bg = "${background}";
              fg = "${foreground}";
            };
          };

          private = {
            bg = "${background}";
            fg = "${foreground}";
          };

          caret = {
            bg = "${background}";
            fg = "${foreground}";
            selection = {
              bg = "${background}";
              fg = "${foreground}";
            };
          };

          url = {
            error.fg = "${red}";
            fg       = "${foreground}";
            hover.fg = "${blue}";
            warn.fg  = "${yellow}";
            success  = {
              http.fg  = "${green}";
              https.fg = "${green}";
            };
          };
        };

        # ==========
        tabs = {
          bar.bg = "${background}";

          even = {
            bg = "${background}";
            fg = "${foreground}";
          };

          odd = {
            bg = "${background}";
            fg = "${foreground}";
          };

          indicator = {
            error  = "${red}";
            system = "none";
          };

          selected = {
            even = {
              bg = "${blue}";
              fg = "${background}";
            };
            odd = {
              bg = "${blue}";
              fg = "${background}";
            };
          };

          pinned = {
            even = {
              bg = "${background}";
              fg = "${foreground}";
            };
            odd = {
              bg = "${background}";
              fg = "${foreground}";
            };
            selected = {
              odd = {
                bg = "${blue}";
                fg = "${background}";
              };
              even = {
                bg = "${blue}";
                fg = "${background}";
              };
            };
          };
        };

        # ==========
        contextmenu = {
          menu = {
            bg = "${background}";
            fg = "${foreground}";
          };

          disabled = {
            bg = "${background}";
            fg = "${black}";
          };

          selected = {
            bg = "${blue}";
            fg = "${background}";
          };
        };
      };
    };
  };
}
