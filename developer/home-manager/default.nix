{ pkgs, config, ... }:

{
  config = {
    home = {
      sessionVariables = { EDITOR = "nvim"; };

      shellAliases = {
        hms = ''
          home-manager switch -b backup --flake "path:$(readlink -f /home/${config.username}/${config.configpath}/#developer)"
        '';
      };

      packages = with pkgs; [ noto-fonts noto-fonts-cjk noto-fonts-emoji ];
    };

    programs = {
      home-manager.enable = true;
      direnv.enable = true;
    };
  };

  imports = [
    ../modules/tmux
    ../modules/git
    ../modules/firefox
    ../modules/sway
    ../modules/ssh
    ../modules/terminal
  ];
}

