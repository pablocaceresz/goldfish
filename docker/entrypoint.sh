#!/bin/bash


GOLDFISH_PORT=${GOLDFISH_PORT:=8000}
TLS_DISABLE=${TLS_DISABLE:=1}

VAULT_ADDRESS=${VAULT_ADDRESS:=http://vault:8200}
TLS_SKIP_VERIFY=${TLS_SKIP_VERIFY:=1}
RUNTIME_CONFIG=${RUNTIME_CONFIG:=secret/goldfish}
APPROLE_LOGIN=${APPROLE_LOGIN:=auth/approle/login}
APPROLE_ID=${APPROLE_ID:=goldfish}
DISABLE_MLOCK=${DISABLE_MLOCK:=1}

sed -i "s/\$GOLDFISH_PORT/$GOLDFISH_PORT/g" /app/config.hcl
sed -i "s/\$TLS_DISABLE/$TLS_DISABLE/g" /app/config.hcl

sed -i "s/\$VAULT_ADDRESS/$VAULT_ADDRESS/g" /app/config.hcl
sed -i "s/\$TLS_SKIP_VERIFY/$TLS_SKIP_VERIFY/g" /app/config.hcl
sed -i "s/\$RUNTIME_CONFIG/$RUNTIME_CONFIG/g" /app/config.hcl
sed -i "s/\$APPROLE_LOGIN/$APPROLE_LOGIN/g" /app/config.hcl
sed -i "s/\$APPROLE_ID/$APPROLE_ID/g" /app/config.hcl
sed -i "s/\$DISABLE_MLOCK/$DISABLE_MLOCK/g" /app/config.hcl

if [[ -z "${GOLDFISH_DEV}" ]]; then 
    /app/goldfish -dev; 
else 
    /app/goldfish -config=/app/config.hcl -token=${VAULT_TOKEN};
fi