if status is-interactive
    # Commands to run in interactive sessions can go her
    starship init fish | source
    pfetch
    set fish_greeting
    alias hyprconf="vim .config/hypr/hyprland.conf"
end
