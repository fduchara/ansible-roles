#!/usr/bin/env bash

ansible-galaxy install -p roles -r requirements.yml

read -r -p "обновить galaxy [y/N] " response
if [[ "$response" =~ ^([yY])+$ ]]
then
    ansible-galaxy install -p roles -r requirements.yml --force
fi

read -r -p "тестовый запуск -C -D [y/N] " response
if [[ "$response" =~ ^([yY])+$ ]]
then
    ansible-playbook site.yml -C -D -i hosts.yml $*
fi

read -r -p "запуск -D [y/N] " response
if [[ "$response" =~ ^([yY])+$ ]]
then
    ansible-playbook site.yml -D -i hosts.yml $*
fi
