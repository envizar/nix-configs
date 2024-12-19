{ config, pkgs, ... }: {
	services.mysql = {
	  enable = true;
	  package = pkgs.mariadb;

	  settings = {
	  	mysqld = {
	  	  bind-address = "0.0.0.0";
	  	};
	  };
	};
}
