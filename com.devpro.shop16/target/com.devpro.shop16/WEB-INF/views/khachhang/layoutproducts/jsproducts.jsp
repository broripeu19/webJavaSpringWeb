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
    function XACNHAN(productId){
  		
  			alert("Đã xóa thành công!!")
  		
  	}
    function XACNHANTHANHTOAN(productId){
  		if(confirm('Bạn có chắc chắn muốn thanh toán sản phẩm này không!!')){
  			alert("Đơn hàng đã được thanh toán thành công!!")
  		}
  	} 
</script>
<script src="${base}/js/products.js"></script>
<script src="${base}/js/jquery.min.js"></script>
<script src="${base}/js/customer_scripts.js"></script>