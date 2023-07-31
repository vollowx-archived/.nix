{ pkgs, ... }: { services.printing.drivers = with pkgs; [ hplip ]; }
