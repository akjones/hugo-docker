from alpine:3.7 as builder

run apk add --no-cache curl

arg HUGO_RELEASE

run mkdir /app
run curl -sL https://github.com/gohugoio/hugo/releases/download/v${HUGO_RELEASE}/hugo_${HUGO_RELEASE}_Linux-64bit.tar.gz -o /app/hugo.tar.gz
run tar -xzf /app/hugo.tar.gz -C /app

from scratch

maintainer andrew@andrewjones.id.au

copy --from=builder /app/hugo /

entrypoint ["./hugo"]
cmd ["help"]
