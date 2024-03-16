<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<script src="${base}/js/popper.min.js"></script>
<script src="${base}/js/bootstrap.js"></script>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    var index =1;
    changeImageRight = function(){
        var imgs = ["../imgs/section-recommend-products-wrappe-img-2.jpg","../imgs/KinhDo1.jpg","../imgs/KinhDo2.jpg","../imgs/KinhDo3.jpg","../imgs/KinhDo4.jpg"];
        document.getElementById('img').src = imgs[index];
        index++;
        if(index == 5){
            index =0;
        }
            
    }
    changeImageLeft = function(){
        var imgs = ["../imgs/section-recommend-products-wrappe-img-2.jpg","../imgs/KinhDo1.jpg","../imgs/KinhDo2.jpg","../imgs/KinhDo3.jpg","../imgs/KinhDo4.jpg"];
        document.getElementById('img').src = imgs[index];
        index--;
        if(index == 0){
            index =3;
        }
            
    }
    function XACNHAN(productId) {
        if (confirm("Bạn có chắc chắn muốn xóa sản phẩm này không?")) {
            // Thực hiện xóa sản phẩm ở đây nếu người dùng chọn "OK"
            alert("Đã xóa thành công!!");
        } else {
            // Nếu người dùng chọn "Cancel", không thực hiện gì cả
        }
    }

    function XACNHANTHANHTOAN(productId) {
        // Sử dụng hàm confirm để hiển thị hộp thoại xác nhận
        var confirmation = confirm('Bạn có chắc chắn muốn thanh toán sản phẩm này không?');

        // Kiểm tra xem người dùng đã nhấn "OK" hay không
        if (confirmation) {
            // Hiển thị hộp thoại alert thông báo thành công
            alert("Đơn hàng đã được thanh toán thành công!");
        } else {
            // Nếu người dùng nhấn "Cancel" hoặc đóng hộp thoại, không làm gì cả
            // Người dùng quyết định không muốn thanh toán, do đó không cần thông báo gì
        }
    }
</script>
<script src="${base}/js/products.js"></script>
<script src="${base}/js/jquery.min.js"></script>
<script src="${base}/js/customer_scripts.js"></script>