#!/bin/bash

docker-compose -f $HOME/subspace_docker/docker-compose.yml down

sed -i 's/ghcr.io\/subspace\/node:.*/ghcr.io\/subspace\/node:gemini-3g-2023-nov-16/g' $HOME/subspace_docker/docker-compose.yml
sed -i 's/ghcr.io\/subspace\/farmer:.*/ghcr.io\/subspace\/farmer:gemini-3g-2023-nov-16/g' $HOME/subspace_docker/docker-compose.yml

docker-compose -f $HOME/subspace_docker/docker-compose.yml up -d