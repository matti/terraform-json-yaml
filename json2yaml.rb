require "json"
require "yaml"

query = JSON.parse(STDIN.read)
object = JSON.parse(query["json"])

result = {
  rendered: object.to_yaml
}

puts result.to_json
