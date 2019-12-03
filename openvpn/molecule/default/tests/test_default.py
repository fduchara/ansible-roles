import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_srv_running_and_enabled(host):
    srv = host.service('openvpn-server@server')
    assert srv.is_running
    assert srv.is_enabled
