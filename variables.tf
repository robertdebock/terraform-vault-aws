variable "access_key" {
  description = "The access key that Vault will use to generate credentials."
  validation {
    condition     = can(regex("^A..................Q$", var.access_key)) || var.access_key == null
    error_message = "When specifying an access key, please use the correct format."
  }
}

variable "secret_key" {
  description = "The secret key that Vault will use to generate credentials"
  validation {
    condition     = try(length(var.secret_key),"fourtybitsofrandomnessisnoteasytomakeman") == 40 || var.secret_key == null
    error_message = "When specifying a secret key, please use the correct length."
  }
}

variable "max_lease_ttl_seconds" {
  description = "The maximum TTL that can be requested for credentials issued by this backend."
  default     = 120
}

variable "default_lease_ttl_seconds" {
  description = "The default TTL for credentials issued by this backend."
  default     = 60
}
