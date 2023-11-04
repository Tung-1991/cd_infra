Triển khai CDinfra cho VCBS  

-0 sử dụng VCSA bản 7.0 để terraform mới chạy được,  
-1 sử dụng Terraform để tạo máy ảo lên VCSA (Card mạng, ổ đĩa, IP)  
-2 sử dụng Ansible để cấu hình tập trung các cụm máy ảo  
-3 sử dụng Jenkins để quản lý job cho Terraform và Ansible  
-4 Khi tạo xong sẽ có 1 hosts ELK để thu nhập log của một cụm  

Mô hình Luồng CD (mô hình tab chỉ có 1 VCSA và 1 ESXI)
<img width="480" alt="image" src="https://github.com/Tung-1991/cd_infraVCBS/assets/63487060/eac432e7-583d-4dfd-9834-636ba2657f8c">


