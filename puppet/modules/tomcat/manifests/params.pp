class tomcat::params (

  $http_connector_port = "9000",
  $xss                 = "256k",
  $xms                 = "1024m",
  $xmx                 = "1024m",
  $permsize            = "256m",
  $maxpermsize         = "512m",
  $maxgcpausemillis    = "1500",
  $gctimeratio         = "9",
  $xcatalinaopts       = "", # Allows supplying misc. catalina options
  $xjavaopts           = "", # Allows supplying misc. java options

  # Global database connection settings
  $mysql_datasource_managed     = 'undef',
  $mysql_datasource_name,
  $mysql_datasource_host        = 'localhost',
  $mysql_datasource_port        = '3306',
  $mysql_datasource_dbname,
  $mysql_datasource_username,
  $mysql_datasource_password,
  $mysql_datasource_max_active  = '100',
  $mysql_datasource_max_idle    = '20',
  $mysql_datasource_min_idle    = '5',
  $mysql_datasource_max_wait    = '10000',

  ) {}
