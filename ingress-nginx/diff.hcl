metadata {
  path = "ingress-nginx"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "ingress-nginx/terraform"
  target  = "ingress-nginx/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:ZbFvMXXe+BIQp7eBKs4UtXZi5wTgLloH231BHfiFXGU="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "ingress-nginx/terraform"
  target  = "ingress-nginx/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "ingress-nginx",
  ]

  sha     = "h1:ZbFvMXXe+BIQp7eBKs4UtXZi5wTgLloH231BHfiFXGU="
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "ingress-nginx/helm"
  target  = "ingress-nginx/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "ingress-nginx",
  ]

  sha     = "h1:5axcuo/X9T2OFJRgH9hroIJy3tTa91nEqCC1cDRfkmo="
  retries = 0
  verbose = false
}
