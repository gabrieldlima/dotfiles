# ╔═════════════════════╗
# ║ ██████╗ ██╗████████╗║
# ║██╔════╝ ██║╚══██╔══╝║
# ║██║  ███╗██║   ██║   ║
# ║██║   ██║██║   ██║   ║
# ║╚██████╔╝██║   ██║   ║
# ║ ╚═════╝ ╚═╝   ╚═╝   ║
# ╚═════════════════════╝

{
  ...
}: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "Gabriel Lima";
      user.email = "gabrielgsdlima@gmail.com";
      core = {
        askPass = "";
      };
    };
  };
}
