FROM rust:1.77.2 as dependencies
WORKDIR /app
RUN apt-get update -qq && apt-get install -yqq musl-tools
RUN USER=root cargo new --bin any-app-to-deploy
RUN rustup target add x86_64-unknown-linux-musl
WORKDIR /app/any-app-to-deploy
COPY ./Cargo.lock ./Cargo.lock
COPY ./Cargo.toml ./Cargo.toml
RUN cargo build --target=x86_64-unknown-linux-musl --release
RUN rm src/*.rs

FROM dependencies as build
COPY ./src ./src
RUN rm ./target/x86_64-unknown-linux-musl/release/deps/*
RUN cargo build --target=x86_64-unknown-linux-musl --release

FROM alpine:3.19 as final
WORKDIR /app
COPY --from=build /app/any-app-to-deploy/target/x86_64-unknown-linux-musl/release/any-app-to-deploy .
EXPOSE 8080
CMD ["/app/any-app-to-deploy"]