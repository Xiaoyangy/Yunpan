/**
 * @author 陈宏阳
 * @date 2020/7/7
 * Yunpan
 */
public class dsa extends asd{
    public String publicField="子类变量";
    public void r(){
    System.out.println("子类函数");
    }
    public static void main(String[] args){
        asd asd=new dsa();
         System.out.println(asd.publicField);
         asd.r();
    }
}
