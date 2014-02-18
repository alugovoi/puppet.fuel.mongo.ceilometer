
class ceilometer::db::mongodb(
  $password      = false,
  $dbname        = 'ceilometer',
  $user          = 'ceilometer',
  $host          = 'localhost',
) {
  Class['mongodb::server'] -> Class['ceilometer::db::mongodb']
  Class['ceilometer::db::mongodb'] -> Exec<| title == 'ceilometer-dbsync' |>
  Mongodb::Db[$dbname] ~> Exec<| title == 'ceilometer-dbsync' |>

  mongodb::db { $dbname:
    user         => $user,
    password     => $password,
    require      => Class['mongodb::server'],
  }

}

