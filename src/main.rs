mod api;
mod captcha_solver;
mod crypto;
mod fake_login;
use actix_web::{web, App, HttpServer};
use std::env;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    env::set_var("RUST_LOG", "info");
    env_logger::init();
    log::warn!("HQU_ROBBER_LOGIN server start on: http://0.0.0.0:8085");
    HttpServer::new(|| {
        App::new()
            .service(api::index)
            .default_service(web::to(api::not_found))
    })
    .bind(("0.0.0.0", 8085))?
    .run()
    .await
}
