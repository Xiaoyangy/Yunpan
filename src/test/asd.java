import com.yun.pojo.Sys;
import com.yun.service.SysService;
import com.yun.service.UserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.sql.Date;
import java.text.ParseException;
import java.util.List;

/**
 * @author 陈宏阳
 * @date 2020/7/2
 * Yunpan
 */
public class asd {
    @Autowired
    private SysService sysService;
    @Test
    public void fu() throws ParseException {
        String username="a";
        sysService.loginTime(username);
        List<Sys> sysList=sysService.selectAll();
    }
}
