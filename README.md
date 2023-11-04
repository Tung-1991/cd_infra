Triển khai CDinfra 
B1: Máy quản trị (windows,Ubuntu) thực hiện cấu hình và đẩy code lên GIT  
B2: Jenins chạy job lấy code từ git về để thực hiện theo kịch bản code  
B3: Terraform tạo các máy ảo theo tài nguyên của VCSA ( ESXI) theo kịch bản CODE  
B4: Ansible chạy các task thực hiện cấu hình các máy đã được Terraform tạo từ trước theo kịch bản  
B5: Kịch bản hoàn thiện máy chủ ELK thực hiện thu nhập log từ các cụm máy chủ khác bằng filebeast  

Mô hình Luồng CD (mô hình tab chỉ có 1 VCSA và 1 ESXI)  
Lab thực tế:
- 1 máy quản trị chính 
- 1 máy Ubuntu làm MasterControl (cài bằng vagrant)
- 1 VCSA 8.0.2 + 1 VMWARE 8.0.2 (chạy khởi tạo 10 máy ảo)
<img width="301" alt="image" src="https://github.com/Tung-1991/cd_infraVCBS/assets/63487060/32d3ab53-5fb4-43e7-baf1-5223b625a990">  

Thời gian  Terraform tạo 10 máy ảo theo 1 template clone có sẵn trên VCSA (đã thực hiện tạo và xóa 52 lần)
<img width="945" alt="image" src="https://github.com/Tung-1991/cd_infraVCBS/assets/63487060/d2a3306c-eda8-4807-b057-46271d3c455f">  

Thời gian Ansible thực hiện cấu hình 10 máy ảo theo checklist và 
<img width="942" alt="image" src="https://github.com/Tung-1991/cd_infraVCBS/assets/63487060/dac1a158-5d51-48c5-a73a-ff4f45246aa1">  

SV ELK lọc các trường thông tin của các máy ảo
<img width="957" alt="image" src="https://github.com/Tung-1991/cd_infraVCBS/assets/63487060/1169d80f-91a2-40c7-9528-228f73590b1f">  




