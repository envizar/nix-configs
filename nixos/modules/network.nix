{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;

    # Cloudflare DNS servers
    nameservers = [ "1.1.1.1" "1.0.0.1" ];

    # Uncomment, switch and restart system to download jetbrains.*
    # proxy.default = "127.0.0.1:2081";
    
    # JetBrains license workaround
    #   127.0.0.1 account.jetbrains.com
    # extraHosts = ''
    # 127.0.0.1 account.jetbrains.com
    # '';
    firewall.extraCommands = ''
      iptables -A OUTPUT -p tcp -m string --string "account.jetbrains.com" --algo kmp -j REJECT
      iptables -A OUTPUT -p tcp -m string --string "account.jetbrains.com/github" --algo kmp -j ACCEPT
    '';
  };
}
