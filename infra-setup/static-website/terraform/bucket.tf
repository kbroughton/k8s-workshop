resource "google_storage_bucket" "website" {
  provider = google
  name     = var.bucket
  location = "US"
}

# Make new objects public
resource "google_storage_default_object_access_control" "website_read" {
  bucket = var.bucket
  role   = "READER"
  entity = "allUsers"
}
