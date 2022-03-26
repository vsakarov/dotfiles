{ config, pkgs, user, email, homeDirectory, ... }: {
  programs.git = {
    enable = true;
    userName = user;
    userEmail = email;
    aliases = {
      amend = "commit --amend";
      br = "branch";
      ci = "commit";
      co = "checkout";
      cp = "cherry-pick";
      di = "diff";
      dw = "diff --word-diff";
      prune-branches = "fetch origin --prune";
      remove-merged =
        "!git branch --merged | grep -v 'master\\|^\\*' | xargs --no-run-if-empty git br -d";
      st = "status";
    };
    extraConfig = {
      core = { excludesfile = "${homeDirectory}/.gitignore"; };
      color = { ui = "true"; };
      push = { default = "simple"; };
    };
  };
}
