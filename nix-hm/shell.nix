{ config, pkgs, ... }: {
  home.packages = with pkgs; [ ag fd file fzf ripgrep ];
  programs.bat.enable = true;
  programs.htop.enable = true;

  programs.bash = {
    enable = true;
    bashrcExtra = ''
      # https://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows
      # Avoid duplicates
      HISTCONTROL=ignoredups:erasedups
      # When the shell exits, append to the history file instead of overwriting it
      shopt -s histappend

      # After each command, append to the history file and reread it
      PROMPT_COMMAND="''${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
    '';
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "command-not-found"
        "docker"
        "docker-compose"
        "fd"
        "fzf"
        "git"
        "jump"
        "kubectl"
        "pass"
        "tmux"
      ];
      theme = "aussiegeek-zwsp";
      custom = "$HOME/.zsh_custom/";
      extraConfig = ''
        COMPLETION_WAITING_DOTS="true"
        DISABLE_AUTO_UPDATE="true"
        DISABLE_UNTRACKED_FILES_DIRTY="true"
        ZSH_TMUX_AUTOSTART="true"
        ZSH_TMUX_AUTOQUIT="false"
      '';
    };
    shellAliases = {
      e = "editor";
      j = "jump";
      o = "xdg-open";
    };
  };
  home.file.".zsh_custom/themes/aussiegeek-zwsp.zsh-theme".source =
    ../aussiegeek-zwsp.zsh-theme;

  programs.tmux = {
    enable = true;
    clock24 = true;
    shortcut = "Space";
    historyLimit = 100000;
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    baseIndex = 1;
    escapeTime = 25;
    terminal = "tmux-256color";
    newSession = true;
    plugins = with pkgs; [
      tmuxPlugins.open
      tmuxPlugins.yank
      {
        plugin = tmuxPlugins.jump;
        extraConfig = "set -g @jump-key 'F'";
      }
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
    ];
    extraConfig = ''
      # Aliases:
      # bind | bind-key
      # set  | set-option
      # setw | set-window-option

      set -ga terminal-overrides ",xterm-256color:Tc"
      set -g set-titles on
      bind tab last-window
      bind -T prefix / copy-mode \; send ?
      set-option -ga pane-active-border-style bg=default,fg=default

      # Turn off bell
      set -g bell-action none
      set -g visual-bell off

      # Scrolling
      bind -n S-Pageup copy-mode -u
      set -g mouse on

      # Use v for selection in copy mode
      bind -T copy-mode-vi v send-keys -X begin-selection

      # Splitting
      bind c new-window -c '#{pane_current_path}'
      bind | split-window -h -c '#{pane_current_path}'
      bind - split-window -v -c '#{pane_current_path}'

      # Switch tabs/windows as in gnome-terminal
      set -g renumber-windows on
      bind -n C-PgUp previous-window
      bind -n C-PgDn next-window
      bind -n M-1 select-window -t 1
      bind -n M-2 select-window -t 2
      bind -n M-3 select-window -t 3
      bind -n M-4 select-window -t 4
      bind -n M-5 select-window -t 5
      bind -n M-6 select-window -t 6
      bind -n M-7 select-window -t 7
      bind -n M-8 select-window -t 8
      bind -n M-9 select-window -t 9

      # Select last command output, depend on shell setting up zero-width space
      bind -T prefix v copy-mode \; send -N 2 -X search-backward ' ' \; send-keys -N 2 -X cursor-down \; send-keys -X select-line \; send -X search-forward ' ' \; send-keys -X cursor-up
    '';
    # bind r source-file ${config.xdg.configFile."tmux/tmux.conf"}
  };
}
