package com.yun.ai;

/**
 * @author 陈宏阳
 * @date 2020/7/9
 * Yunpan
 */

import com.yun.service.AuthService;
import com.yun.utils.FaceSpot;
import com.yun.utils.GsonUtils;
import com.yun.utils.HttpUtil;


import java.io.File;
import java.io.IOException;
import java.util.*;

import static com.yun.utils.FaceSpot.FileToByte;

/**
 * 人脸注册
 */

public class FaceAdd {

    /**
     * 重要提示代码中所需工具类
     * FileUtil,Base64Util,HttpUtil,GsonUtils请从
     * https://ai.baidu.com/file/658A35ABAB2D404FBF903F64D47C1F72
     * https://ai.baidu.com/file/C8D81F3301E24D2892968F09AE1AD6E2
     * https://ai.baidu.com/file/544D677F5D4E4F17B4122FBD60DB82B3
     * https://ai.baidu.com/file/470B3ACCA3FE43788B5A963BF0B625F3
     * 下载
     */
    public static String add(String img, String faceId) {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/faceset/user/add";
        try {
            Map<String, Object> map = new HashMap<>();
            map.put("image", img);
            map.put("group_id", "face");
            map.put("user_id", faceId);
            map.put("user_info", "yunpan");
            map.put("liveness_control", "NORMAL");
            map.put("image_type", "FACE_TOKEN");
            map.put("quality_control", "LOW");
            String param = GsonUtils.toJson(map);
            // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
            String accessToken = AuthService.getAuth();
            String result = HttpUtil.post(url, accessToken, "application/json", param);
            System.out.println(result);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) throws IOException {

        String file2="E:/2.jpg";

        String img2 = com.yun.utils.Base64Util.encode(FileToByte(new File(file2)));

        byte[] img1=Base64.getDecoder().decode(img2);
        System.out.println(FaceSpot.addUser(img1,"1","1","yunpan"));

    }

}
