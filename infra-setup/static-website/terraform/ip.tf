# Reserve an external IP
resource "google_compute_global_address" "website" {
  provider = google
  name     = "website-lb-ip"
}

## Get the managed DNS zone
#data "google_dns_managed_zone" "gcp_coffeetime_dev" {
#  provider = google
#  name     = "gcp-coffeetime-dev"
#}

# Add the IP to the DNS
#resource "google_dns_record_set" "website" {
#  provider     = google
#  name         = "website.${data.google_dns_managed_zone.gcp_coffeetime_dev.dns_name}"
#  type         = "A"
#  ttl          = 300
#  managed_zone = data.google_dns_managed_zone.gcp_coffeetime_dev.name
#  rrdatas      = [google_compute_global_address.website.address]
#}
