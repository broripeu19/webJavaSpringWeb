function keyupEmail(){
    var email = document.getElementById("exampleInputEmail1").value;
 
    
    if(email == ''){
        document.getElementById("error-email").innerHTML ="Bạn chưa nhập email";
        return false;
    }
    else{
        document.getElementById("error-email").innerHTML ="";
    }
    


} 
function keyupPassword(){
    var inputPassword = document.getElementById("inputPassword6").value;
    if(inputPassword == ''){
        document.getElementById("passwordHelpInline").innerHTML = "Mật khẩu không được để trống!";
    }
    else{
        document.getElementById("passwordHelpInline").innerHTML ="";
    }
        
    
}
function keyupCheckPassword(){
    var inputPassword = document.getElementById("inputPassword6").value;
    var checkInputPassword = document.getElementById("check-inputPassword6").value;
    if( checkInputPassword == '' || checkInputPassword == null ){
        document.getElementById("checkpasswordHelpInline").innerHTML = "Mật khẩu không được để trống!";
    }
    else if( checkInputPassword != inputPassword  ){
        document.getElementById("checkpasswordHelpInline").innerHTML = "Mật khẩu nhập lại không đúng!";
    }
    else{
        document.getElementById("checkpasswordHelpInline").innerHTML = "";
    }
}
