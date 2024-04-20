use actix_web::{self, get, web::{self}, App, HttpServer};
use serde::Deserialize;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    println!("Listeting server at port 8080");
    HttpServer::new(|| {
        App::new()
            .service(hello)
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

#[derive(Deserialize, Default)]
struct HelloQuery {
    name: String
}
