data "external" "json2yaml" {
  program = ["ruby", "${path.module}/json2yaml.rb"]

  query = {
    json = "${var.json}"
  }
}
