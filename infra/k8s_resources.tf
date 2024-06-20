resource "kubernetes_namespace" "devops_challenge" {
  metadata {
    name = "devops-challenge"
  }
}

resource "kubernetes_secret" "db_secret" {
  metadata {
    name      = "db-secret"
    namespace = kubernetes_namespace.devops_challenge.metadata[0].name
  }

  data = {
    POSTGRES_DB       = base64encode("pollsdb")
    POSTGRES_USER     = base64encode("postgres")
    POSTGRES_PASSWORD = base64encode("postgres")
    SECRET_KEY        = base64encode("mysecretkey")
  }
}
