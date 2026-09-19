FROM alpine:3 AS build
# syntax example
RUN <<EOF
echo hello
EOF
COPY --from=build /a /b
