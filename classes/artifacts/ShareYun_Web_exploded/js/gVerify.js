document.getElementById('code').onclick = changeImg;
function changeImg(){
    // 验证码组成库
    var arrays=new Array(
        '1','2','3','4','5','6','7','8','9','0',
        'a','b','c','d','e','f','g','h','i','j',
        'k','l','m','n','o','p','q','r','s','t',
        'u','v','w','x','y','z',
        'A','B','C','D','E','F','G','H','I','J',
        'K','L','M','N','O','P','Q','R','S','T',
        'U','V','W','X','Y','Z'
    );
    // 重新初始化验证码
    code ='';
    // 随机从数组中获取四个元素组成验证码
    for(var i = 0; i<4; i++){
        // 随机获取一个数组的下标
        var r = parseInt(Math.random()*arrays.length);
        code += arrays[r];
    }
    // 验证码写入span区域
    document.getElementById('code').innerHTML = code;

}

// 验证验证码
function check(){
    var error;
    // 获取用户输入的验证码
    var codeInput = document.getElementById('codeInput').value;
    if(codeInput.toLowerCase() == code.toLowerCase()){
        console.log('123');
        return true;
    }else{
        error = '验证码错误，重新输入';
        document.getElementById('errorTips').innerHTML = error;
        return false;
    }
}
