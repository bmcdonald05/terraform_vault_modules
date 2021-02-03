variable "userpass_name" {
  description = "The name to create for the userpass user."
  default = ""
}

variable "userpass_password" {
  description = "The initial password to set for the userpass user. This should be changed by the user upon login."
  default = ""
}

variable "userpass_policies" {
  description = "A list of policies to assign to the the userpass user."
  default = ""
}
