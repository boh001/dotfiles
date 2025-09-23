{ config, pkgs, lib, ... }:

{
  home.username = "sanghyeon";
  home.homeDirectory = "/home/sanghyeon";
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    nixpkgs-fmt
    nerd-fonts.jetbrains-mono
    pavucontrol
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "blue";
  };

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      # Monitor configuration - dual monitor setup
      monitor = [
        "eDP-1,preferred,0x1080,1"
        "DP-1,1920x1080@60,0x0,1"
      ];

      # Workspace assignment to monitors
      workspace = [
        "1,monitor:eDP-1,default:true"
        "2,monitor:eDP-1"
        "3,monitor:eDP-1"
        "4,monitor:eDP-1"
        "5,monitor:eDP-1"
        "6,monitor:DP-1,default:true"
        "7,monitor:DP-1"
        "8,monitor:DP-1"
        "9,monitor:DP-1"
        "10,monitor:DP-1"
      ];

      # Program variables
      "$terminal" = "kitty";
      "$menu" = "rofi -show drun";
      "$mainMod" = "SUPER_L";

      # General configuration
      general = {
        gaps_in = 0;
        gaps_out = 0;
        border_size = 0;
        resize_on_border = true;
        allow_tearing = false;
        layout = "master";
      };

      decoration = {
        rounding = 0;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = false;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      # Animation configuration
      animations = {
        enabled = true;

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global,1,10,default"
          "border,1,5.39,easeOutQuint"
          "windows,1,4.79,easeOutQuint"
          "windowsIn,1,4.1,easeOutQuint,popin 87%"
          "windowsOut,1,1.49,linear,popin 87%"
          "fadeIn,1,1.73,almostLinear"
          "fadeOut,1,1.46,almostLinear"
          "fade,1,3.03,quick"
          "layers,1,3.81,easeOutQuint"
          "layersIn,1,4,easeOutQuint,fade"
          "layersOut,1,1.5,linear,fade"
          "fadeLayersIn,1,1.79,almostLinear"
          "fadeLayersOut,1,1.39,almostLinear"
          "workspaces,1,1.94,almostLinear,fade"
          "workspacesIn,1,1.21,almostLinear,fade"
          "workspacesOut,1,1.94,almostLinear,fade"
        ];
      };

      # Layout configurations
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      # Misc settings
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      # Input configuration
      input = {
        kb_layout = "us";
        kb_options = "caps:ctrl_modifiers,ctrl:swapcaps";
        follow_mouse = 1;
        sensitivity = 0;

        touchpad = {
          natural_scroll = false;
        };
      };

      # Device-specific config
      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      # Window rules
      windowrule = [
        "suppressevent maximize,class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      # Key bindings
      bind = [
        # Basic window management
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, T, exec, hyprlock"
        "$mainMod SHIFT, H, exec, systemctl hibernate"

        # Focus movement (vim-style)
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        # Workspace switching
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move windows to workspaces
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through workspaces
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      # Mouse bindings
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # Volume controls
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      # Media controls
      bindl = [
        ",XF86AudioNext, exec, playerctl next"
        ",XF86AudioPause, exec, playerctl play-pause"
        ",XF86AudioPlay, exec, playerctl play-pause"
        ",XF86AudioPrev, exec, playerctl previous"
      ];
    };
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 36;
        spacing = 8;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "cpu" "memory" "disk" "pulseaudio" "network" "battery" "clock" ];

        cpu = {
          interval = 5;
          format = "󰻠 {usage}%";
          tooltip = true;
          tooltip-format = "CPU Usage: {usage}%\nLoad: {load}";
        };

        memory = {
          interval = 10;
          format = "󰑭 {percentage}%";
          tooltip = true;
          tooltip-format = "Memory: {used:0.1f}GB used / {total:0.1f}GB total\nSwap: {swapUsed:0.1f}GB / {swapTotal:0.1f}GB";
        };

        disk = {
          interval = 30;
          format = "󰋊 {percentage_used}%";
          path = "/";
          tooltip = true;
          tooltip-format = "Disk Usage: {used} used / {total} total\nAvailable: {free}";
        };

        pulseaudio = {
          scroll-step = 5;
          format = "{icon} {volume}%";
          format-muted = "󰝟 Muted";
          format-icons = {
            headphone = "󰋋";
            hands-free = "󰋋";
            headset = "󰋋";
            phone = "";
            portable = "";
            car = "";
            default = [ "󰕿" "󰖀" "󰕾" ];
          };
          tooltip = true;
          tooltip-format = "Volume: {volume}%\nDevice: {desc}";
          on-click = "pavucontrol";
          on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };

        battery = {
          interval = 10;
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󰂄 {capacity}%";
          format-full = "󰁹 {capacity}%";
          format-icons = [
            "󰁺"
            "󰁼"
            "󰁾"
            "󰂀"
            "󰁹"
          ];
          tooltip = true;
          tooltip-format = "Battery: {capacity}%\nTime remaining: {time}\nPower: {power}W";
        };

        clock = {
          interval = 60;
          format = "󰥔 {:%H:%M}";
          tooltip = true;
          tooltip-format = "󰥔 {:%A, %B %d, %Y %I:%M %p}";
        };

        network = {
          interval = 5;
          format-wifi = "  {essid} ({signalStrength}%)";
          format-ethernet = "󰈀 Connected";
          format-linked = "󰈀 {ifname} (No IP)";
          format-disconnected = "󰤭 Disconnected";
          tooltip = true;
          tooltip-format = "Interface: {ifname}\nIP: {ipaddr}\nGateway: {gwaddr}\nNetmask: {netmask}";
          tooltip-format-wifi = "Network: {essid}\nSignal: {signalStrength}%\nFrequency: {frequency}MHz\nIP: {ipaddr}";
          on-click = "nm-connection-editor";
        };

        "hyprland/window" = {
          format = "{}";
          max-length = 60;
          separate-outputs = true;
        };

        "hyprland/workspaces" = {
          disable-scroll = true;
          format = "{icon}";
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
          };
          active-only = false;
          all-outputs = false;
          sort-by-number = true;
          persistent-workspaces = {
            "*" = 5;
          };
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        min-height: 0;
        margin: 0;
        padding: 0;
        font-weight: bold;
      }
      
      #waybar {
        font-size: 16px;
        background: @base;
        color: @text;
      }
      
      #battery,
      #clock,
      #cpu,
      #disk,
      #memory,
      #network,
      #pulseaudio {
        padding: 0 8px;
        margin: 0 4px;
      }
      
      #cpu {
        color: @blue;
      }
      
      #memory {
        color: @blue;
      }
      
      #disk {
        color: @blue;
      }
      
      #pulseaudio {
        color: @blue;
      }
      
      #battery {
        color: @blue;
      }
      
      #network {
        color: @blue;
      }
      
      #clock {
        color: @blue;
      }
      
      #battery.warning {
        color: @yellow;
      }
      
      #battery.critical {
        color: @red;
      }
      
      #network.disconnected {
        color: @red;
      }
      
      #pulseaudio.muted {
        color: @surface2;
      }
      
      #workspaces button {
        color: @surface2;
        padding: 4px 12px;
        margin: 0 2px;
        background: transparent;
        transition: all 0.3s ease;
      }
      
      #workspaces button:hover {
        color: @text;
        background: @surface0;
      }
      
      #workspaces button.active {
        color: @base;
        background: @blue;
      }
      
      #workspaces button.urgent {
        color: @base;
        background: @red;
      }
      
      #window {
        padding: 0 16px;
        color: @text;
        font-weight: 600;
      }
      
      tooltip {
        background: @base;
        border: 1px solid @surface0;
        border-radius: 8px;
        color: @text;
      }
      
      tooltip label {
        color: @text;
      }
    '';
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/.dotfiles/wallpaper.png"
      ];
      wallpaper = [
        ",~/.dotfiles/wallpaper.png"
      ];
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 600;
          on-timeout = "hyprlock";
        }
        {
          timeout = 660;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 900;
          on-timeout = "systemctl suspend-then-hibernate";
        }
      ];
    };
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      background = lib.mkForce [
        {
          monitor = "";
          path = "~/.dotfiles/wallpaper.png";
          blur_passes = 2;
          contrast = 1;
          brightness = 0.5;
          vibrancy = 0.2;
          vibrancy_darkness = 0.2;
        }
      ];

      general = {
        no_fade_in = true;
        no_fade_out = true;
        hide_cursor = false;
        grace = 0;
        disable_loading_bar = true;
      };
    };
  };

  programs.rofi = {
    enable = true;
  };

  services.dunst = {
    enable = true;
    settings = { };
  };

  programs.git = {
    enable = true;
    userName = "sanghyeon.kim";
    userEmail = "boh001g@gmail.com";
    extraConfig = {
      credential.helper = "store";
    };
  };

  programs.firefox = {
    enable = true;
  };

  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrains Mono Nerd Font";
      size = 14;
    };
    settings = {
      background_opacity = "0.85";
      background_blur = 20;
    };
  };

  programs.yazi = {
    enable = true;
    settings = {
      mgr = {
        show_hidden = true;
      };
    };
  };

  programs.bat = {
    enable = true;
  };

  programs.btop = {
    enable = true;
  };

  programs.lazygit = {
    enable = true;
  };
}
