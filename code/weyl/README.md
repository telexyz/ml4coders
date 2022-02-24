Review code của bạn Đức https://github.com/ducntbcit/Weyl

N/iệm vụ của bài toán: Đức mu4. Để tối ưu hàm lỗi Đức dùng phương pháp BFGS (Broyden–Fletcher–Goldfarb–Shanno), pp này đã có sẵn trong pythonốn sử dụng mạng feed forward để giải phương trình tích phân.

Phương trình tích phân là phương trình chứa hàm cần tìm dưới dấu tích phân, cụ thể ở đây là hàm `Phi`.

Ý tưởng cơ bản:

1/ Dùng feed forward để xấp xỉ hàm (sinh ra 1 hàm số) với biến là `x` (chính là input của mạng nơron), hàm số này phụ thuộc vào `weight` và `bias`. Gọi hàm số đó là `NN(w,x)`.

2/ Sau khi có được hàm `NN(w,x)`, ta thay hàm này vào các tích phân để tối ưu hàm lỗi

3/ Để tính các tp đó ta có thể dùng thư viện có sẵn của python hoặc bằng các phương pháp tính tích phân, ở đây Đức dùng phương pháp tính tích phân Simpson

4/ Để tối ưu hàm lỗi Đức dùng phương pháp BFGS (Broyden–Fletcher–Goldfarb–Shanno), pp này đã có sẵn trong Python

5/ sau khi tối ưu đc hàm lỗi ta nhận được w,b. Ta thay w, b quay trở lại mạng feed forrward để tìm ra hàm số

6/ So sánh kq tìm được bằng mạng NN và kq tính dc bằng toán học(gọi là nghiệm chính xác). 
   plot kq trên đồ thị

