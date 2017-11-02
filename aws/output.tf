# Ouput information about AWS resources
# Example:
# output "NAME" {
#   value = VALUE
# }

output "elb_dns_name" {
    value = "${aws_elb.example.dns_name}"
}