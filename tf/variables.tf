# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "appId" {
  description = "Azure Kubernetes Service Cluster service principal"
  type        = string
}

variable "password" {
  description = "Azure Kubernetes Service Cluster password"
  type        = string
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}
