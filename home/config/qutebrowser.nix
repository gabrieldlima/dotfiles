{
...
}: let
  rosewater = "#f5e0dc";
  # flamingo  = "#f2cdcd";
  # pink      = "#f5c2e7";
  # mauve     = "#cba6f7";
  red       = "#f38ba8";
  # maroon    = "#eba0ac";
  peach     = "#fab387";
  yellow    = "#f9e2af";
  green     = "#a6e3a1";
  teal      = "#94e2d5";
  sky       = "#89dceb";
  # sapphire  = "#74c7ec";
  blue      = "#89b4fa";
  # lavender  = "#b4befe";
  text      = "#cdd6f4";
  subtext1  = "#bac2de";
  subtext0  = "#a6adc8";
  overlay2  = "#9399b2";
  # overlay1  = "#7f849c";
  overlay0  = "#6c7086";
  surface2  = "#585b70";
  # surface1  = "#45475a";
  # surface0  = "#313244";
  base      = "#010101";
  mantle    = "#010101";
  crust     = "#010101";
in {
  programs.qutebrowser = {
    enable = true;

    quickmarks = {
      awesomewm    = "https://awesomewm.org/apidoc";
      chatgpt      = "https://chat.openai.com";
      catppuccin   = "https://catppuccin.com";
      drive        = "https://drive.google.com/drive/my-drive";
      github       = "https://github.com/dashboard";
      gmail        = "https://mail.google.com/mail";
      google       = "https://www.google.com";
      hacker_news  = "https://news.ycombinator.com";
      home-manager = "https://nix-community.github.io/home-manager/options.xhtml";
      nixpkgs      = "https://search.nixos.org/packages";
      reddit       = "https://www.reddit.com";
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
        default_family = "FiraCode Nerd Font";
        default_size   = "10pt";
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
          fg       = "${subtext0}";
          even.bg  = "${base}";
          odd.bg   = "${base}";
          match.fg = "${green}";

          category = {
            bg = "${base}";
            fg = "${green}";
            border = {
              top    = "${overlay2}";
              bottom = "${mantle}";
            };
          };

          item.selected = {
            bg       = "${surface2}";
            fg       = "${text}";
            match.fg = "${rosewater}";
            border = {
              top    = "${surface2}";
              bottom = "${surface2}";
            };
          };

          scrollbar = {
            bg = "${crust}";
            fg = "${surface2}";
          };
        };

        # ==========
        downloads = {
          bar.bg = "${base}";

          error = {
            bg = "${base}";
            fg = "${red}";
          };

          start = {
            bg = "${base}";
            fg = "${blue}";
          };

          stop = {
            bg = "${base}";
            fg = "${green}";
          };

          system = {
            bg = "none";
            fg = "none";
          };
        };

        # ==========
        hints = {
          bg       = "${peach}";
          fg       = "${mantle}";
          match.fg = "${subtext1}";
        };

        # ==========
        keyhint = {
          bg        = "${mantle}";
          fg        = "${text}";
          suffix.fg = "${subtext1}";
        };

        # ==========
        messages = {
          error = {
            bg     = "${overlay0}";
            fg     = "${red}";
            border = "${mantle}";
          };

          info = {
            bg     = "${overlay0}";
            fg     = "${text}";
            border = "${mantle}";
          };

          warning = {
            bg     = "${overlay0}";
            fg     = "${peach}";
            border = "${mantle}";
          };
        };

        # ==========
        prompts = {
          bg     = "${mantle}";
          fg     = "${text}";
          border = "${overlay0}";
          selected = {
            bg = "${surface2}";
            fg = "${rosewater}";
          };
        };

        # ==========
        statusbar = {
          progress.bg = "${base}";

          passthrough = {
            fg = "${peach}";
            bg = "${base}";
          };

          normal = {
            bg = "${base}";
            fg = "${text}";
          };

          insert = {
            bg = "${crust}";
            fg = "${rosewater}";
          };

          command = {
            bg = "${base}";
            fg = "${text}";
            private = {
              bg = "${base}";
              fg = "${subtext1}";
            };
          };

          private = {
            bg = "${mantle}";
            fg = "${subtext1}";
          };

          caret = {
            bg = "${base}";
            fg = "${peach}";
            selection = {
              bg = "${base}";
              fg = "${peach}";
            };
          };

          url = {
            error.fg = "${red}";
            fg       = "${text}";
            hover.fg = "${sky}";
            warn.fg  = "${yellow}";
            success  = {
              http.fg  = "${teal}";
              https.fg = "${green}";
            };
          };
        };

        # ==========
        tabs = {
          bar.bg = "${crust}";

          even = {
            bg = "${crust}";
            fg = "${text}";
          };

          odd = {
            bg = "${crust}";
            fg = "${text}";
          };

          indicator = {
            error  = "${red}";
            system = "none";
          };

          selected = {
            even = {
              bg = "${blue}";
              fg = "${crust}";
            };
            odd = {
              bg = "${blue}";
              fg = "${crust}";
            };
          };

          pinned = {
            even = {
              bg = "${crust}";
              fg = "${text}";
            };
            odd = {
              bg = "${crust}";
              fg = "${text}";
            };
            selected = {
              odd = {
                bg = "${blue}";
                fg = "${crust}";
              };
              even = {
                bg = "${blue}";
                fg = "${crust}";
              };
            };
          };
        };

        # ==========
        contextmenu = {
          menu = {
            bg = "${base}";
            fg = "${text}";
          };

          disabled = {
            bg = "${mantle}";
            fg = "${overlay0}";
          };

          selected = {
            bg = "${overlay0}";
            fg = "${rosewater}";
          };
        };
      };
    };
  };
}
