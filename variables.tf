variable "access_key" {
  description = "The access key that Vault will use to generate credentials."
}

variable "secret_key" {
  description = "The secret key that Vault will use to generate credentials"
}

variable "max_lease_ttl_seconds" {
  description = "The maximum TTL that can be requested for credentials issued by this backend."
  default     = 120
}

variable "default_lease_ttl_seconds" {
  description = "The default TTL for credentials issued by this backend."
  default     = 60
}
