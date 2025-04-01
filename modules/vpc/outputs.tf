output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_ids" {
  value = [aws_subnet.public.id]  # Mantenha apenas as públicas se necessário para outros recursos
}

output "private_subnet_ids" {
  value = [aws_subnet.private.id, aws_subnet.private_b.id]  # Todas as privadas
}

output "public_sg_id" {
  value = aws_security_group.public_sg.id
}

output "private_sg_id" {
  value = aws_security_group.private_sg.id
}