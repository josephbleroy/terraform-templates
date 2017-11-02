# Ouput information about AWS resources
# Example:
# output "NAME" {
#   value = VALUE
# }

output "public_ip" {
    value = "${aws_instance.web.public_ip}"
}