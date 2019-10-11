function validate(){
    var psw=document.f1.t2.value;
    var cpsw=document.f1.t4.value;
    var email=document.f1.t1.value;
    var mob=document.f1.t3.value;
    var patt=/^[a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    if(patt.test(email)=== false){
        alert("Invalid E-Mail");
        return false;
    }
    else if(isNaN(mob) || mob.length!==10){  
        alert("Invalid Mobile number");
        return false; 
    }
    else if(psw.length<8){
        alert("Password must be atleast 8 character long");
        return false;
    }
    else if(psw.length>26){
        alert("Password can be atmost 26 character long");
        return false;
    }
    else if(psw !== cpsw){
        alert("Password and Confirm Password Values do not match");
        return false;
    }
    else{
        return clg_adr_cnf();
    }
}

function clg_adr_cnf(){
    return confirm("After pressing OK, you will be immediately logged out and your account will be sent for validation which could take 3-4 hours");
    }