#!/usr/bin/env bash

socat TCP-LISTEN:2375,reuseaddr,fork,bind=localhost UNIX-CONNECT:/var/run/docker.sock &