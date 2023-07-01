FROM rust:1.70.0 as builder
WORKDIR /app
ADD . /app
RUN rustup target add x86_64-unknown-linux-musl
RUN cargo build --target x86_64-unknown-linux-musl --release

FROM alpine:latest
COPY --from=builder /app/target/x86_64-unknown-linux-musl/release/server /
EXPOSE 8080
CMD [ "./server" ]
