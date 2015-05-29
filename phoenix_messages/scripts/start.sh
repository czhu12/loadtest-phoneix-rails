build() {
  docker build -t chriszhu/ubc_cheaters_app .
}

data() {
  docker run -v /var/lib/postgresql/data --name ubc_cheaters_data busybox
}

db() {
  docker run --name ubc_cheaters_db -e POSTGRES_PASSWORD=phoenix_messages -d postgres
}

app() {
  docker run -p 4000:8080 -i --link ubc_cheaters_db:postgres --name ubc_cheaters_app chriszhu/ubc_cheaters_app
}

clean() {
  docker rm -f ubc_cheaters_app
}
deploy() {
  build
  clean
  db
  app
}

action=$1

${action}
