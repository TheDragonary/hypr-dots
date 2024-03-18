if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    pfetch
    set fish_greeting
    alias hyprconf="nvim ~/.config/hypr/hyprland.conf"
    alias feh="feh -."
    set -gx MANPAGER nvim +Man!
end
