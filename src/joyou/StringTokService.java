package joyou;

import java.io.Serializable;
import java.util.StringTokenizer;

public class StringTokService implements Serializable {
	private static int[] foot= new int [9];
	private static int[] tree= new int [10];
	
	private int[] footff;
	private int[] treee;
	
	private static int count = 0;
	private static String a ="12";
	private static String b ="23";
	private static String c ="24";
	private static String d ="25";
	private static String e ="26";
	private static String f ="27";
	private static String g ="46";
	private static String h ="56";
	private static String i ="68";
	private static String j ="89";
	
	public static int[] getTree() {
		return tree;
	}




	public static void setTree(int[] tree) {
		StringTokService.tree = tree;
	}




	public int[] getTreee() {
		return tree;
	}




	public void setTreee(int[] treee) {
		this.treee = treee;
	}




	public StringTokService(){}
	
	
	
	
	public static int[] getFoot() {
		return foot;
	}


	public static void setFoot(int[] foot) {
		StringTokService.foot = foot;
	}




	public int[] getFootff() {
		return foot;
	}


	public void setFootff(int[] footff) {
		this.footff = footff;
	}


	static {
		//最後 select 所有使用者
		//String s2 =findAllUserFeet();
		String s1 ="123.124.125.12689.1268.126.127.125689.124689.12468";
		StringTokService tok = new StringTokService();
		
		
		
		tok.tok(s1);
		
		for(int i=0;i<9;i++) {
			
			foot[i]=(foot[i]*100)/count;
		}
		System.out.println(tree[8]);
		System.out.println(tree[9]);
		
		
	}
//	
//	public static void main(String[] args) {
//		// TODO Auto-generated method stub
//		String s1 ="123.14568.147.164289";
//		StringTok tok = new StringTok();
//		
//		
//		
//		tok.tok(s1);
//		for(int i =0;i<9;i++) {
//			System.out.println(i+1+":"+foot[i]);
//		}
//		
//		
//	}




	

	
	
	//分割
	public void tok(String s1) {
		StringTokenizer st = new StringTokenizer(s1, ".");
		while (st.hasMoreElements()) {
//			System.out.println("Token:" + st.nextToken());
			count++;
			String s =st.nextToken();
			
			eql(s);
			
			sub(s);
		}
	}
	
	
	//桑基圖
	public void sub(String s1) {
		for(int k=0;k<s1.length()-1;k++) {
			String s =s1.substring(k, k+2);
			if(s.equals(a)) {
				tree[0]++;
			}
			if(s.equals(b)) {
				tree[1]++;
			}
			if(s.equals(c)) {
				tree[2]++;
			}
			if(s.equals(d)) {
				tree[3]++;
			}
			if(s.equals(e)) {
				tree[4]++;
			}
			if(s.equals(f)) {
				tree[5]++;
			}
			if(s.equals(g)) {
				tree[6]++;
			}
			if(s.equals(h)) {
				tree[7]++;
			}
			if(s.equals(i)) {
				tree[8]++;
			}
			if(s.equals(j)) {
				tree[9]++;
			}
			
		}
	}
	
	//轉換漏斗
	public void eql(String s1) {
		for(int i=0;i< s1.length();i++) {
			
			char s =s1.charAt(i);
			char ch = s;int a = ch - 48;
			switch(a) {
			case 1:
				foot[0]++;
				break;
			case 2:
				foot[1]++;
				break;	
			case 3:
				foot[2]++;
				break;
			case 4:
				foot[3]++;
				break;
			case 5:
				foot[4]++;
				break;
			case 6:
				foot[5]++;
				break;
			case 7:
				foot[6]++;
				break;
			case 8:
				foot[7]++;
				break;
			case 9:
				foot[8]++;
				break;
			}
		}
	}
}
