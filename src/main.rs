use actix_web::{self, get, web::{self}, App, HttpServer};
use serde::Deserialize;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    println!("Listeting server at port 8080");
    HttpServer::new(|| {
        App::new()
            .service(hello)
            .service(health_check)
    })
    .bind(("0.0.0.0", 8080))?
    .run()
    .await
}

#[get("/")]
async fn hello(query: web::Query<HelloQuery>) -> String {
    let name = query.name.clone();
    format!("Hello {}", name)
}

#[get("/health")]
async fn health_check() -> String {
    "\"state\": \"healthy\"".to_string()
}

#[derive(Deserialize, Default)]
struct HelloQuery {
    name: String
}
