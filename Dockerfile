FROM rust:latest 
RUN apt-get update && apt-get install -y libclang-dev libopencv-dev clang libssl-dev
WORKDIR /server
COPY ./src ./src
COPY ./Cargo.toml  .
RUN cargo build --release
RUN mv /server/target/release/hqu_robber_login /hqu_robber_login
ENV RUST_LOG=info
CMD ["/hqu_robber_login"]