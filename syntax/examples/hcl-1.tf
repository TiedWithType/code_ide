resource "local_file" "example" {
 content = "hello ${var.name} tail"
 text = <<-EOT
hello ${var.name}
EOT
 enabled = true
}
