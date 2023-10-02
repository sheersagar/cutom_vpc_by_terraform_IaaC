 output "region" {
   value = var.region
 }

 output "project_name" {
   value = var.project_name
 }

 output "vpc_id" {
   value = aws_vpc.vpc.id
 }

 output "public_subnet_az1_id" {
   value = aws_subnet.pb_sn_az1.id
 }

 output "public_subnet_az2_id" {
   value = aws_subnet.pb_sn_az2.id
 }

 output "public_subnet_az3_id" {
   value = aws_subnet.pb_sn_az3.id
 }

 output "private_db_subnet_az1_id" {
   value = aws_subnet.pvt_db_az1.id
 }

 output "private_db_subnet_az2_id" {
   value = aws_subnet.pvt_db_az2.id
 }

 output "private_dn_subnet_az3_id" {
   value = aws_subnet.pvt_db_az3.id
 }

 output "private_app_subnet_az1_id" {
   value = aws_subnet.pvt_sn_az1.id
 }

 output "private_app_subnet_az2_id" {
   value = aws_subnet.pvt_sn_az2.id
 }

 output "private_app_subnet_az3_id" {
   value = aws_subnet.pvt_sn_az3.id
 }

 output "internet_gateway" {
   value = aws_internet_gateway.internet_gateway.id
 }