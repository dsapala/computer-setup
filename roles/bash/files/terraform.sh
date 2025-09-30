#!/usr/bin/env bash

if command -v terraform > /dev/null; then
  function tf { terraform "$@"; }
  complete -C "$(command -v terraform)" tf
fi

