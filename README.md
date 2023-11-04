Triển khai CDinfra cho VCSA 

-1 sử dụng Terraform để tạo máy ảo lên VCSA (Card mạng, ổ đĩa, IP)

-2 sử dụng Ansible để cấu hình tập trung các cụm máy ảo 

-3 sử dụng Jenkins để quản lý job cho Terraform và Ansible 

-4 sau khi khởi tạo xong sẽ có máy chủ ELK master chịu trách nghiệm đọc log của các máy cụm