function req()
            {
                var from=document.f1.t1.value;
                var to=document.f1.t2.value;
                var amt=document.f1.t3.value;
                var gv=document.f1.t4.value.length;
                var gv_info=document.f1.t4.value;
                var ll=/^[a-zA-Z]+$/;
                if(from===to){
                alert("Mode HAVE and Mode WANT can't be same.");
                return false;    
                }
                else if(isNaN(amt))
                {
                    alert("Invalid Amount");
                    return false;
                }
                else if(Number(amt)>10000 || Number(amt)<50)
                {
                    alert("Amount should be atleast 50 and atmost 10000");
                    return false;
                }
                else if(from==="Select" || to==="Select"){  
                    alert("Please select your MODE HAVE/MODE WANT");
                    return false; 
                }
                else if(from==="Gift Voucher")
                {
                    if(gv===0)
                    {
                    alert("Please provide info of Gift Voucher");
                    return false;
                    }
                    if(ll.test(gv_info)===false)
                    {
                    alert("Invalid Gift Voucher");
                    return false;
                    }
                }
                else if(from!=="Gift Voucher")
                {
                    if(gv!==0)
                {
                    alert("Please empty the Gift Voucher section");
                    return false;
                }
                }
                else
                    return true;
            }
