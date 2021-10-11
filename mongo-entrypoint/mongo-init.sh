echo '################ MONGO ENTRYPOINT START ################';

mongo -- "$MONGO_INITDB_DATABASE" <<EOF
db = db.getSiblingDB('$MONGO_INITDB_DATABASE')
db.createUser(
    {
        user: '$MONGO_INITDB_USER',
        pwd: '$MONGO_INITDB_PWD',
        roles: [
            {
                role: "readWrite",
                db: '$MONGO_INITDB_DATABASE'
            }
        ]
    }
);
EOF