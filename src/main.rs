use axum::{routing::get, Router};

#[tokio::main]
async fn main() {
    let app = Router::new().route("/ping", get(pong));
    axum::Server::bind(&"0.0.0.0:8080".parse().unwrap()).serve(app.into_make_service()).await.unwrap();
}

async fn pong() -> &'static str {
    "pong"
}