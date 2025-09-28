#!/bin/bash
SECRET_VALUE=$(circleci env subst "${SECRET_VALUE}")

cat <<EOF > ./app/out/secrets.json
$SECRET_VALUE
EOF