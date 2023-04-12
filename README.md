# CSDLPT-QLVT-PTITHCM
Đồ án môn CSDLPT đề tài quản lý vật tư PTITHCM
- Publication and Subcription 
+ Cây phân tán đối với Phân mảnh 1(CN1) và phân mảnh 2(CN2)
![image](https://user-images.githubusercontent.com/81803058/231347468-f3886862-4d35-466c-b19a-d22e4d0fa3f3.png)

Đối với phân mảnh 1 và phân mảnh 2 thì chúng ta sẽ phân tán Kho đi theo Chi Nhánh , nhân viên đi theo Chi Nhanh(hoặc theo kho) còn đối với  đơn đặt hàng(DDH), Phiếu nhập(PN),
Phiếu Xuất (PX) đi theo Kho hoặc có thể theo Nhân Viên
+ Cây phân tán đối với Phân mảnh 3 (Dùng để tra cứu Nhân viên , Kho)
![image](https://user-images.githubusercontent.com/81803058/231348740-e31c0566-9a5e-4b7f-ac98-b7b8733f1ba5.png)

Đối với phân mảnh 3 dùng để tra cứu nhân viên và kho thì chúng ta nhân bản hoàn toàn 2 table Kho và Nhân viên để đảm bảo tính toàn vẹn dữ Liệu
+LinkServer : Để đạt được sự trong suốt phân tán chúng ta phải đặt tên Linkserver và tên CSDL ở mọi chi nhánh là giống nhau 
LINK0 đi từ phân mảnh này tới phân mảnh 3
LINK1 đi từ phân mảnh này tới phân mảnh còn lại
LINK2 đi từ phân mảnh này tới phân mảnh gốc

-Phân quyền: 

Phân quyền: Chương trình có 3 nhóm : Công ty , ChiNhanh, User

Nếu login thuộc nhóm CongTy thì login đó có thể đăng nhập vào bất kỳ chi nhánh nào để xem số liệu bằng cách chọn tên chi nhánh, và chỉ có các chức năng sau:
1.Chỉ có thể xem dữ liệu của phân mảnh tương ứng.
2.Xem được các báo cáo.
3.Tạo login thuộc nhóm Congty
Nếu login thuộc nhóm ChiNhanh thì chỉ cho phép toàn quyền làm việc trên chi nhánh đó , không được log vào chi nhánh khác ; Tạo login thuộc nhóm ChiNhanh, User .
Nếu login thuộc nhóm User thì chỉ được quyền cập nhật dữ liệu, không được tạo tài khoản mới cho hệ thống. Chương trình cho phép ta tạo các login, password và cho login này làm việc với quyền hạn gì. Căn cứ vào quyền này khi user login vào hệ thống, ta sẽ biết người đó được quyền làm việc với mảnh phân tán nào hay trên tất cả các phân mảnh.
Nhóm Chi Nhánh : 
Chi nhánh không thể chuyển qua lại giữa các chi nhánh để xem dữ liệu nhưng có thể thêm - xóa - sửa thoải mái với phân mảnh đang đăng nhập, có thể tạo tài khoản với vai trò Chi nhánh hoặc User.
Nhóm User:
User cũng không thể chuyển qua lại giữa các chi nhánh để xem dữ liệu nhưng có thể thêm - xóa - sửa thoải mái với phân mảnh đang đăng nhập, không thể tạo tài khoản.
+ Một số hình ảnh của chương trình:
Form Nhân Viên

![image](https://user-images.githubusercontent.com/81803058/231351993-b8408bca-37e4-42e1-8a86-f525a32afbc0.png)


Form DDH

![image](https://user-images.githubusercontent.com/81803058/231351275-ca0ae75e-3e3b-405e-813d-c60cf3958d02.png)

Form tạo tài khoản

![image](https://user-images.githubusercontent.com/81803058/231351931-b233e10a-3bbf-4b47-b41a-cbc9f776c24b.png)


