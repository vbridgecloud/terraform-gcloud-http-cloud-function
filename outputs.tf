output "https_trigger_url" {
  value       = google_cloudfunctions_function.function.https_trigger_url
  description = "URL which triggers function execution. Returned only if `trigger_http` is used."
}

output "project" {
  value       = google_cloudfunctions_function.function.project
  description = "Project of the function."
}

output "region" {
  value       = google_cloudfunctions_function.function.region
  description = "Region of function. Defaults to `us-central1`."
}

output "zip_name" {
  value       = google_storage_bucket_object.function_zip_bucket_object.name
  description = "Name of the .zip file that stored on GCS"
}

output "function_name" {
  value       = google_cloudfunctions_function.function.name
  description = "Name of the cloud function"
}

output "environment_variables" {
  value       = google_cloudfunctions_function.function.environment_variables
  description = "Environment Variables used in the Cloud Function"
  sensitive   = true
}
