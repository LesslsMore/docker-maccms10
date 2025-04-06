#!/bin/sh
set -eu

if [ ! -f index.php ]; then
    git clone --depth 1 -q ${REPO_URL} .
    rm -rf .git*
    chmod a+rw -R application runtime upload static addons
    echo "maccms10 downloaded"
    
    git clone --depth 1 -q https://github.com/LesslsMore/template.git template
    chmod a+rw -R template
    echo "template downloaded"
fi

if [ -f admin.php ]; then
    mv admin.php $ADMIN_PHP
    echo "admin.php => $ADMIN_PHP"
fi

exec "$@"
