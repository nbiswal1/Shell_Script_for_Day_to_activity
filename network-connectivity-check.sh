#!/bin/bash

check_website() {
    local site="$1"

    if curl -Is --connect-timeout 5 "https://$site" >/dev/null; then
        echo "✅ Website $site is reachable."
    else
        echo "❌ Website $site is unreachable."
    fi
}

read -rp "Enter website (e.g. google.com): " SITE

check_website "$SITE"
