class openstack::db::mongodb (
      ceilometer             = $ceilometer,
      ceilometer_db_user     = $ceilometer_db_user,
      ceilometer_db_password = $ceilometer_db_password,
      ceilometer_db_dbname   = $ceilometer_db_dbname,
) {
  
  class { 'mongodb::server':
  }
  class { 'ceilometer::db::mongodb':
    password      => $ceilometer_db_password,
    dbname        => $ceilometer_db_dbname,
    user          => $ceilometer_db_user,
  }
}
