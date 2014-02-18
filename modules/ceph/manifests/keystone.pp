#ceph::keystone will configure keystone with ceph parts
class ceph::keystone (
  $pub_ip    = $::ceph::rgw_pub_ip,
  $adm_ip    = $::ceph::rgw_adm_ip,
  $int_ip    = $::ceph::rgw_int_ip,
  $rgw_port  = $::ceph::rgw_port,
) {
  keystone_service {'swift':
    ensure      => present,
    type        => 'object-store',
    description => 'Openstack Object-Store Service',
  }

  keystone_endpoint {'swift':
    ensure       => present,
    region       => 'RegionOne',
    public_url   => "http://${pub_ip}:${rgw_port}/swift/v1",
    admin_url    => "http://${adm_ip}:${rgw_port}/swift/v1",
    internal_url => "http://${int_ip}:${rgw_port}/swift/v1",
  }
}
