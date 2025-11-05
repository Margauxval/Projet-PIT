#!/usr/bin/env bash
# log_utils.sh - fonctions d'affichage
log_info(){ printf "\033[1;34m[INFO]\033[0m %s\n" "$*"; }
log_ok(){ printf "\033[1;32m[OK]\033[0m %s\n" "$*"; }
log_err(){ printf "\033[1;31m[ERR]\033[0m %s\n" "$*"; }
