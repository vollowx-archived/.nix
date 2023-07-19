{ config, lib, pkgs, inputs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    dotDir = ".config/zsh";
    history.path = "${config.home.homeDirectory}/.config/zsh/.zsh_history";

    envExtra = ''
      export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    '';

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "a411ef3e0992d4839f0732ebeb9823024afaaaa8";
          sha256 = "1g3pij5qn2j7v7jjac2a63lxd97mcsgw6xq6k5p7835q9fjiid98";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "caa749d030d22168445c4cb97befd406d2828db0";
          sha256 = "17ck9lm8j6bv9fhag827kxrbwdwbhhss0sw7p1yz7nhpknj6apv1";
        };
      }
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.5.0";
          sha256 = "0za4aiwwrlawnia4f29msk822rj9bgcygw6a8a6iikiwzjjz0g91";
        };
      }
      {
        name = "zsh-autopair";
        file = "zsh-autopair.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "hlissner";
          repo = "zsh-autopair";
          rev = "34a8bca0c18fcf3ab1561caef9790abffc1d3d49";
          sha256 = "1h0vm2dgrmb8i2pvsgis3lshc5b0ad846836m62y8h3rdb3zmpy1";
        };
      }
    ];

    shellAliases = {
      # Modern Unix units
      ls = "exa --git --icons --group-directories-first $@";
      la = "ls --all $@";
      l = "la --long $@";
      grep = "rg $@";
      find = "fd $@";
      df = "duf $@";
      cat = "bat $@";
      dig = "dog $@";
      sudo = "doas $@";
      # curl = "curlie $@";

      # Abbrs
      nv = "nvim $@";
      lg = "lazygit $@";
      gaa = "git add --all $@";
      gc = "git commit $@";
      gca = "git commit --all $@";
      gcl = "git clone --recurse-submodules $@";
      gco = "git checkout $@";
      gcob = "git checkout -b $@";
      gd = "git diff $@";
      gds = "git diff --staged $@";
      gf = "git fetch $@";
      gi = "git init $@";
      gs = "git status --short $@";
      gsa = "git status $@";
      gp = "git push $@";
      gpl = "git pull $@";
    };
  };
  home.packages = with pkgs; [
    zsh-nix-shell
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];

  programs.nix-index.enable = true;

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      palette = "catppuccin_mocha";
    } // builtins.fromTOML
      (builtins.readFile (inputs.catppuccin-starship + "/palettes/mocha.toml"));
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
