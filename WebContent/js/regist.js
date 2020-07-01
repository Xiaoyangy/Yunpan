$(function(){  
//    alert("111");
    $('input[type=text]').focusin(function(){  
        $(this).css('border','1px solid #3F89EC');  
        $(this).parent().siblings('.mes').find('.error').hide().end().find('.tip').show();  
    }).focusout(function(){  
        $(this).css('border','1px solid #ddd');  
        $(this).parent().siblings('.mes').find('.tip').hide();  
    });  
  
    $('input[type=password]').focusin(function(){  
        $(this).css('border','1px solid #3F89EC');  
        $(this).parent().siblings('.mes').find('.error').hide().end().find('ul').show();  
        $(this).parent().next('.mes').find('.pwd_icon').removeClass('pwdok').removeClass('pwdno').html('○');  
        $(this).parent().next('.mes').find('.pwd_tip').css('color','#999');  
    }).focusout(function(){  
        $(this).css('border','1px solid #ddd');  
        $(this).parent().siblings('.mes').find('ul').hide();  
    });  
  
    if('placeholder' in document.createElement('input')){  
        $('input').eq(0).focus();  
    }  
      
    $('input').keyup(function(){  
        if($(this).val()){  
            $(this).next('.clear').show();  
        }  
    });  
      
    $('.clear').click(function(){  
        $(this).prev('input').val('');  
        $(this).parent().next('.mes').find('.pwd_icon').removeClass('pwdok').removeClass('pwdno').html('○');  
        $(this).parent().next('.mes').find('.pwd_tip').css('color','#999');  
        $(this).prev('input').focus();  
        $(this).hide();  
    });  
      
    $('#usr').blur(function(){  
        if(isUsr()){  
            $(this).parent().siblings('.mes').find('.error').show().find('span').eq(0).removeClass().addClass('ok_icon').next('span').html('');  
        }else{  
            if($('#usr').val()){  
                $(this).parent().siblings('.mes').find('.error').show().find('span').eq(0).removeClass().addClass('error_icon').next('span').html('用户名不能超过7个汉字或14个字符');  
            }  
        };  
    });  
          
    var isUsr = function(){  
        return /^[0-9A-Za-z\u4e00-\u9fa5]{1,14}$/.test($('#usr').val());      
    }  
      
    $('#tel').blur(function(){  
        if(isTel()){  
            $(this).parent().siblings('.mes').find('.error').show().find('span').eq(0).removeClass().addClass('ok_icon').next('span').html('');  
        }else{  
            if($('#tel').val()){  
                $(this).parent().siblings('.mes').find('.error').show().find('span').eq(0).removeClass().addClass('error_icon').next('span').html('手机号码格式不正确');  
            }  
        };  
    });  
      
    var isTel = function(){  
        return /^1\d{10}$/.test($('#tel').val()) || /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/.test($('#tel').val());  
    } 
      
    $('#pwd').keyup(function(){  
        if(checkLength()){  
            $(this).parent().siblings('.mes').find('.pwd_icon').eq(0).html('').removeClass('pwdno').addClass('pwdok');  
            $(this).parent().next('.mes').find('.pwd_tip').eq(0).css('color','#999');  
        }else{  
            $(this).parent().siblings('.mes').find('.pwd_icon').eq(0).html('').removeClass('pwdok').addClass('pwdno');  
            $(this).parent().siblings('.mes').find('.pwd_tip').eq(0).css('color','red');  
        }  
          
        if(checkChar()){  
            $(this).parent().siblings('.mes').find('.pwd_icon').eq(1).html('').removeClass('pwdno').addClass('pwdok');  
            $(this).parent().next('.mes').find('.pwd_tip').eq(1).css('color','#999');  
        }else{  
            $(this).parent().siblings('.mes').find('.pwd_icon').eq(1).html('').removeClass('pwdok').addClass('pwdno');  
            $(this).parent().siblings('.mes').find('.pwd_tip').eq(1).css('color','red');  
        }  
          
        if(!checkSpace()){  
            $(this).parent().siblings('.mes').find('.pwd_icon').eq(2).html('').removeClass('pwdno').addClass('pwdok');  
            $(this).parent().next('.mes').find('.pwd_tip').eq(2).css('color','#999');  
        }else{  
            $(this).parent().siblings('.mes').find('.pwd_icon').eq(2).html('').removeClass('pwdok').addClass('pwdno');  
            $(this).parent().siblings('.mes').find('.pwd_tip').eq(2).css('color','red');  
        }  
          
        if(!$('#pwd').val()){  
            $(this).parent().next('.mes').find('.pwd_icon').removeClass('pwdok').removeClass('pwdno').html('○');  
            $(this).parent().next('.mes').find('.pwd_tip').css('color','#999');  
        }  
    });  
      
    var checkLength = function(){  
        return $('#pwd').val().length >= 6 && $('#pwd').val().length <=14;  
    }  ;
      
    var checkChar = function(){  
        return /[0-9a-zA-Z|\.]/.test($('#pwd').val());  
    }  ;
      
    var checkSpace = function(){  
        return /\s/g.test($('#pwd').val());  
    }  ;
    $('.regBtn').click(function(){  
        if(isUsr() && isTel() && checkLength() && checkChar() && !checkSpace() && checkAgree()){  
            alert('注册成功');  
        }else{  
              
            if(!isUsr()){  
                $('#usr').css('border','1px solid red');  
                $('#usr').parent().siblings('.mes').find('.error').show().find('span').eq(0).removeClass().addClass('error_icon').next('span').html('请您填写用户名');  
            }  
              
            if(!isTel()){  
                $('#tel').css('border','1px solid red');  
                $('#tel').parent().siblings('.mes').find('.error').show().find('span').eq(0).removeClass().addClass('error_icon').next('span').html('请您填写手机号');  
            }  
              
            if(checkYzm()){  
                $('#yzm').css('border','1px solid red');  
                $('#yzm').parent().siblings('.mes').find('.error').show().find('span').eq(0).removeClass().addClass('error_icon').next('span').html('请您填写验证码');  
            }  
                  
            if(!checkLength() || !checkChar() || checkSpace()){  
                $('.mes').find('ul').hide();  
                $('#pwd').css('border','1px solid red');  
                $('#pwd').parent().siblings('.mes').find('.error').show().find('span').eq(0).removeClass().addClass('error_icon').next('span').html('请输入密码');  
            }  
              
            if(!checkAgree()){  
                $(this).parent().next('.mes').find('.error').show();  
            }  
        }     
    });  
      
    var checkYzm = function(){  
        return true;  
    } ;
          
    var checkAgree = function(){  
    if($('#agree').is(':checked')){  
//      return true;  
//      <span style="white-space:pre">  </span>}else{  
//      return false;  
        }  
    }  ;
      
  
});  