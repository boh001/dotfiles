{ config, pkgs, ... }:

{

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
}
