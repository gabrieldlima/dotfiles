{
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "Gabriel Lima";
    userEmail = "gabrielgsdlima@gmail.com";
    extraConfig = {
      core = {
        askPass = "";
      };
    };
  };
}
