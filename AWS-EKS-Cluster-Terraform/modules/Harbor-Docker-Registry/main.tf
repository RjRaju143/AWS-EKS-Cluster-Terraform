resource "kubernetes_namespace" "harbor" {
  metadata {
    name = "harbor-system"
  }
}

resource "helm_release" "harbor" {
  name       = "harbor"
  repository = "https://helm.goharbor.io"
  chart      = "harbor"
  namespace  = kubernetes_namespace.harbor.metadata[0].name

  set {
    name  = "expose.ingress.hosts.core"
    value = "harbor.registy.techboyraju.com"
  }

  set {
    name  = "externalURL"
    value = "http://harbor.registy.techboyraju.com"
  }

  depends_on = [kubernetes_namespace.harbor]
}

resource "kubernetes_ingress_v1" "harbor_ingress" {
  metadata {
    name      = "harbor-ingress"
    namespace = kubernetes_namespace.harbor.metadata[0].name
    annotations = {
      "kubernetes.io/ingress.class"                    = "nginx"
      "nginx.ingress.kubernetes.io/proxy-body-size"    = "0"
      "nginx.ingress.kubernetes.io/proxy-read-timeout" = "900"
      "nginx.ingress.kubernetes.io/proxy-send-timeout" = "900"
      "cert-manager.io/cluster-issuer"                 = "letsencrypt"
    }
  }

  spec {
    tls {
      hosts       = ["harbor.registy.techboyraju.com"]
      secret_name = "letsencrypt-secret"
    }

    rule {
      host = "harbor.registy.techboyraju.com"
      http {
        path {
          path      = "/api/"
          path_type = "Prefix"
          backend {
            service {
              name = "harbor-core"
              port {
                number = 80
              }
            }
          }
        }

        path {
          path      = "/service/"
          path_type = "Prefix"
          backend {
            service {
              name = "harbor-core"
              port {
                number = 80
              }
            }
          }
        }

        path {
          path      = "/v2/"
          path_type = "Prefix"
          backend {
            service {
              name = "harbor-core"
              port {
                number = 80
              }
            }
          }
        }

        path {
          path      = "/chartrepo/"
          path_type = "Prefix"
          backend {
            service {
              name = "harbor-core"
              port {
                number = 80
              }
            }
          }
        }

        path {
          path      = "/c/"
          path_type = "Prefix"
          backend {
            service {
              name = "harbor-core"
              port {
                number = 80
              }
            }
          }
        }

        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "harbor-portal"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }

  depends_on = [helm_release.harbor]
}
