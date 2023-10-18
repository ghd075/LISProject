package kr.or.lis.frontcontroller;
public class ViewResolver {
   public static String makeView(String nextPage) {
	   return nextPage+".jsp";
   }
}
