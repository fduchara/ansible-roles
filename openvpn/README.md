Переменные используемые в роле. Дефолтные настройки

    openvpn_dir: /etc/openvpn	# путь до каталога конфигов сервера
    openvpn_genkey: false		# генеирровать новые ключи для сервера
    openvpn_copy_key: false	# скопировать старые ключи из каталога ./files/{{ ansible_hostname }}
    openvpn_gen_client_key: false # генерировать конфиги для клиентов
    openvpn_client: []		# масив имен клиентов
    openvpn_port: 1194
    openvpn_proto: udp
    openvpn_snort: false		# использовать при старте сервера скритп старта снора
    openvpn_suricata: false	# или сурикаты
    openvpn_pam: false		# использовать pam модуль для сервера. Так же будут генерироваться ключи для google authenticator TOP для клоиента.

Пример настроек для работы:

cat host_vars/fw-ipmi-1

    openvpn_client:
      - rescue
      - test

    openvpn_suricata: true
    openvpn_pam: true
    openvpn_port: 8081
    openvpn_proto: udp

ansible-playbook -i hosts.ini -l fw-ipmi-1 site.yml -u root -k -t openvpn -e openvpn_copy_key=true -e openvpn_gen_client_key=true
