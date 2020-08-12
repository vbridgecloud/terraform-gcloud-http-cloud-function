# Terraform Google Cloud Platform HTTP Cloud Function

Terraform deploy a local folder to a Google Cloud Function that can be triggered over HTTP

## Basic Usage

```hcl
# Create a Storage Bucket to store the Cloud Functions in
resource "google_storage_bucket" "cloudfunctions_bucket" {
  name     = "myproject-cloud-functions"
  location = "europe-west3"
}

# Create a cloud function named `hello-world`
module "cloudfunction--hello-world" {
  source      = "github.com/vbridgebvba/terraform-gcloud-http-cloud-function"
  bucket_name = google_storage_bucket.cloudfunctions_bucket.name
  name        = "hello-world"
}
```

The module `terraform-gcloud-http-cloud-function` will:

1. Zip up the contents of the `./cloudfunctions/hello-world` folder
2. Store the `hello-world.zip` file as an object into the bucket
3. Create the Cloud Function, linking to the `hello-world.zip` object in the bucket

## Variables

### Required Variables

- `bucket_name`: Name of GCS bucket to use to store the Cloud Functions their contents on.
- `name`: Name of the cloud function

### Optional Variables and their defaults

- `source_dir`= `"./cloudfunctions/${var.name}"`
- `description`: `"${var.name} HTTP Cloud Function"`
- `runtime`: `"python37"`
- `entrypoint`: `"__main__"`
- `available_memory_mb`: `128`
- `timeout`: `60`
- `environment_variables`= `{}`
- `service_account_email` = `""`
- `vpc_connector` = `null`
- `max_instances` = `null`

## Extended Example (Overriding the defaults)

```hcl
# Create a Storage Bucket to store the Cloud Functions in
resource "google_storage_bucket" "cloudfunctions_bucket" {
  name     = "myproject-cloud-functions"
  location = "europe-west3"
}

# Create a cloud function named `hello-world`
module "cloudfunction--hello-world" {
  source                 = "github.com/vbridgebvba/terraform-gcloud-http-cloud-function"
  bucket_name            = google_storage_bucket.cloudfunctions_bucket.name
  name                   = "hello-world"
  source_dir             = "./functions/hello-world/src"
  runtime                = "nodejs10"
  available_memory_mb    = 512
  timeout                = 120
  service_account_email  = "cloud-function-invoker@project.iam.gserviceaccount.com"
  vpc_connector          = "vpc-access-connector-name"
  max_instances          = 200
}
```

## License

`terraform-gcloud-http-cloud-function` is released under the MIT License. See the enclosed [`LICENSE` file](LICENSE) for details.