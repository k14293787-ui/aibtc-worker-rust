FROM rust:1.83 as builder
WORKDIR /app
COPY . .
RUN cargo build --release

FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*
COPY --from=builder /app/target/release/aibtc-rust /usr/local/bin/aibtc-rust
CMD ["aibtc-rust", "0x8317166971a3D2B29f46Feb12cCF1Af701801a47"]
