job "nuxt" {
  datacenters = ["dc1"]
  type = "service"

  group "web" {
    network {
      port "http" {
        static = 3000
      }
      dns {
				servers = ["172.17.0.4", "1.1.1.1"]
      }      
    }

    task "nuxt" {
      driver = "docker"

      config {
        privileged					= true
        network_mode 				= "bridge"
        
        image 							= "repping/medium_frontend:v1.1.0"
        ports 							= ["http"]

				dns_search_domains 	= ["service.consul"]

      }

      env {
        NUXT_PORT 				= "3000"
        NODE_ENV  				= "production"
        CONSUL_HTTP_ADDR 	= "http://192.168.50.111:8500"        
      }

      service {
        name 					= "nuxt-frontend"
        port 					= "http"
        tags 					= ["frontend"]
        address_mode 	= "driver"
      }

      resources {
        cpu    = 300
        memory = 512
      }
    }
  }
}
