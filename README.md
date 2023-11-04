Triển khai CDinfra cho VCBS
-1 sử dụng Terraform để tạo máy ảo lên VCSA (Card mạng, ổ đĩa, IP)
-2 sử dụng Ansible để cấu hình tập trung các cụm máy ảo
-3 sử dụng Jenkins để quản lý job cho Terraform và Ansible
-4 Khi tạo xong sẽ có 1 hosts ELK để thu nhập log của một cụm