function strength(){
    var msg;
    if(document.f1.t7.value.length>8){
        msg="Good Strength";
    }
    else if(document.f1.t7.value.length>4 && document.f1.t7.value.length<9){
        msg="Poor Strength";
    }
    else{
        msg="No Strength";
    }
    document.getElementById("myloc").innerText=msg;
}

function validate(){
    var psw=document.f1.t7.value;
    var cpsw=document.f1.t8.value;
    var st_id=document.f1.t10.value;
    var email=document.f1.t2.value;
    var mob=document.f1.t4.value;
    var gen=document.f1.t5.value;
    var sub=document.f1.t6.value;
    var nm=document.f1.t1.value;
    var patt=/^[a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    var ll=/^[a-zA-Z ]+$/;
    if(patt.test(email)=== false){
        alert("Invalid E-Mail");
        return false;
    }
    else if(st_id.length!==8){
        alert("Invalid student ID");
        return false;
    }
    else if(isNaN(mob) || mob.length!==10){  
        alert("Invalid Mobile number");
        return false; 
    }
    else if(gen==="Select"){  
        alert("Please specify your Gender");
        return false; 
    }
    else if(sub==="Select"){  
        alert("Please select your desired subscription");
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

function email_vad(){
    var email=document.f2.t1.value;
    var patt=/^[a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    if(patt.test(email)=== false){
        alert("Invalid E-Mail");
        return false;
    }
    else{
        return true;
    }
}
function clg_adr_cnf(){
    return confirm("Please check if you have entered your address like BLOCK, YEAR, BRANCH, SECTION and CLASS ROOM NO.");
    }
