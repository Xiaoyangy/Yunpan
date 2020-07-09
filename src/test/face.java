package test;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import com.baidu.aip.face.AipFace;
import com.yun.utils.Base64Util;
import com.yun.utils.FaceSpot;
import com.yun.utils.FileUtils;
import org.json.JSONObject;
import org.junit.Test;

/**
 * @author 陈宏阳
 * @date 2020/7/9
 * Yunpan
 */
public class face{
    public static final String APP_ID = "21215550";
    public static final String API_KEY = "747qMxwvbdGnBYA1p6yOROPX";
    public static final String SECRET_KEY = "G5GZZxlInF0sibThdshcKS6ZWWuyRpmh";
    public void simple(AipFace client,String image){
        HashMap<String, String> options = new HashMap<String, String>();
        options.put("max_face_num", "3");
        options.put("match_threshold", "70");
        options.put("quality_control", "NORMAL");
        options.put("liveness_control", "LOW");
        options.put("user_id", "1");
        options.put("max_user_num", "3");

  //      String image = "取决于image_type参数，传入BASE64字符串或URL字符串或FACE_TOKEN字符串";
        String imageType = "BASE64";
        String groupIdList = "3,2";

        // 人脸搜索
        JSONObject res = client.search(image, imageType, groupIdList, options);
        System.out.println(res.toString(2));
    }
    public static void main(String[] args) throws IOException {
        // 初始化一个AipFace
      /*  AipFace client = new AipFace(APP_ID, API_KEY, SECRET_KEY);
        // 可选：设置网络连接参数
        client.setConnectionTimeoutInMillis(2000);
        client.setSocketTimeoutInMillis(60000);
        // 可选：设置代理服务器地址, http和socket二选一，或者均不设置
        // 调用接口
        byte[] imga= FileUtils.readFileByBytes("E:/2.jpg");
        String img=Base64Util.encode(imga);
        String imageType = "BASE64";
        HashMap<String, String> options = new HashMap<String, String>();
        options.put("quality_control", "NORMAL");
        options.put("liveness_control", "LOW");
        options.put("user_id", "1");
        options.put("max_user_num", "1");
        // 人脸检测
        JSONObject res = client.addUser(img, imageType,"face","2",options);
        System.out.println(res.toString(2));
        face face=new face();
        face.simple(client,img);*/

    }
}
