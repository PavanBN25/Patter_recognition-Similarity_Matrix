package atc.src.atc;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
//import java.util.ArrayList;
import java.util.HashMap;
//import java.util.Map;
//import java.util.List;
import java.util.Scanner;



public class main 
{
	public static void main(String[] args) throws FileNotFoundException 
	{
		FileInputStream fileInputStream=new FileInputStream(new File("C:/Users/nag8cw/Desktop/keggOntology.txt"));
		Scanner scanner=new Scanner(fileInputStream);	
		String[][] drugs=new String[12000][3];			
		//____
		//List<Integer> annomalylist = new ArrayList<Integer>();
		
		// Creating a HashMap of int keys and String values
		HashMap<Integer, String> hashmap = new HashMap<Integer, String>();	    	   
		HashMap<Integer, String> hashmaplvl1 = new HashMap<Integer, String>();
		HashMap<Integer, String> hashmaplvl2 = new HashMap<Integer, String>();
		HashMap<Integer, String> hashmaplvl3 = new HashMap<Integer, String>();
		HashMap<Integer, String> hashmaplvl4 = new HashMap<Integer, String>();
		HashMap<Integer, String> hashmaplvl5 = new HashMap<Integer, String>();
		HashMap<Integer, String> distincthashmaplvl5 = new HashMap<Integer, String>();
		int dcount=0;
	    //numLvl specifies number of levels in the ontology tree 
	    //Note: lvl 6 is ignored here // considering only lvl 1,3,4,5 and lvl 7
	    int numLvl=5;
	    int[] lvlData=new int[numLvl];	    
	    for(int i=0;i<numLvl;i++)
	    {
	    	lvlData[i]=0;
	    }	    
		//____		
		int count=0;
		while (scanner.hasNextLine()) 
		{
			String line=scanner.nextLine();			
			String[] elements=line.split("\\t");
			String atcCode=elements[0];
			String genericName=elements[1].replaceAll("[\"]","");			
			count++;
			drugs[count][0]= atcCode;
			drugs[count][1]= genericName;
			drugs[count][2]= elements[2];													
		}	
		int test1[][]=new int[count+1][2];
		
		for(int i=1;i<=count;i++)
		{			
			test1[i][0]=Integer.parseInt(drugs[i][2]);
			test1[i][1]=0;
		}
		int val=test1[1][0];		
		int count2=0;
		for(int i=2;i<=count;i++)
		{
			int flag=0;
			int val2=test1[i][0];
			if((val==1) || (val==7))
			{
				if((val2!=val)||(val2==7))
				{
					test1[i-1][1]=1;					
					flag=1;
				}
			}
			else if((val==3)||(val==4)||(val==5))
			{
				if(val2>val)
				{
					test1[i-1][1]=1;					
					flag=1;
				}
				else
				{
					val=val2;					
					hashmap.put((i-1), drugs[i-1][1]);
					count2++;					
				}
			}			
			if(flag==1)
			{
				val=val2;
				flag=0;
			}								
		}					
		System.out.println(count2);						
		int value=0;		
		for(int i=1;i<=count;i++)
		{			
				value = Integer.parseInt(drugs[i][2]);
				if(value==1)
				{
					lvlData[0]++;
					hashmaplvl1.put(lvlData[0],drugs[i][1]);
				}
				else if(value==3)
				{
					lvlData[1]++;	
					hashmaplvl2.put(lvlData[1],drugs[i][1]);
				}
				else if(value==4)
				{
					lvlData[2]++;
					hashmaplvl3.put(lvlData[2],drugs[i][1]);
				}
				else if(value==5)
				{
					lvlData[3]++;
					hashmaplvl4.put(lvlData[3],drugs[i][1]);
				}
				else if(value==7)
				{
					lvlData[4]++;
					hashmaplvl5.put(lvlData[4],drugs[i][1]);
					if(!distincthashmaplvl5.containsValue(drugs[i][1]))
					{
						dcount++;
						distincthashmaplvl5.put(dcount, drugs[i][1]);						
					}					
				}			
		}			
		int[][] res=new int[lvlData[4]+1][numLvl+1];		
		int[] reslvl=new int[numLvl];	    
	    for(int i=0;i<numLvl;i++)
	    {
	    	reslvl[i]=0;
	    }
		System.out.println("count="+count);
		for(int i=0;i<count;i++)
		{
			value = Integer.parseInt(drugs[i+1][2]);
			if(value==1)
			{
				reslvl[0]++;
			}
			else if(value==3)
			{
				reslvl[1]++;
			}
			else if(value==4)
			{
				reslvl[2]++;
			}
			else if(value==5)
			{
				reslvl[3]++;
			}
			else if(value==7)
			{
				
				int resvalue=reslvl[4];	
				reslvl[4]++;
				res[resvalue][0]= reslvl[0];//Integer.parseInt(hashmaplvl1.get(reslvl[0]));
				res[resvalue][1]= reslvl[1];//Integer.parseInt(hashmaplvl2.get(reslvl[1]));
				res[resvalue][2]= reslvl[2];//Integer.parseInt(hashmaplvl3.get(reslvl[2]));
				res[resvalue][3]= reslvl[3];//Integer.parseInt(hashmaplvl4.get(reslvl[3]));
				res[resvalue][4]= reslvl[4];//Integer.parseInt(hashmaplvl5.get(reslvl[4]+1));
				
				String drugname=hashmaplvl5.get(reslvl[4]);
				for(Integer key : distincthashmaplvl5.keySet())
				{
					if(distincthashmaplvl5.get(key).equals(drugname))
					{
						res[resvalue][5]= key;
					}
				}
				
				//res[resvalue][5]= Integer.parseInt(distincthashmaplvl5.get(drugname));
				
			}
		}
				
		//System.out.println("lvl1 "+reslvl[0]+"\t lvl2 "+reslvl[1]+"\t lvl3 "+reslvl[2]+"\t lvl4 "+reslvl[3]+"\t lvl5 "+reslvl[5]+"\t base lvl5 "+reslvl[4]);
		PrintWriter writer1=new PrintWriter("C:/Users/nag8cw/Desktop/SAI/ATContologyTree/res1txt2.txt");
		for(int j=0;j<reslvl[4];j++)
		{
			writer1.println(res[j][0]+"\t"+res[j][1]+"\t"+res[j][2]+"\t"+res[j][3]+"\t"+res[j][5]+"\t"+res[j][4]);
		}
		writer1.close();
		
		
		/*
		for(Integer key:hashmaplvl1.keySet())
		{
			System.out.println(key+"\t"+hashmaplvl1.get(key).toLowerCase());
		}*/
		
		//lvl1 details
		PrintWriter writerlvl1=new PrintWriter("C:/Users/nag8cw/Desktop/SAI/ATContologyTree/lvl1.txt");		
		for(Integer key:hashmaplvl1.keySet())
		{
			writerlvl1.println(key+"\t"+hashmaplvl1.get(key).toLowerCase());
		}
		writerlvl1.close();
		
		//lvl2 details 
		PrintWriter writerlvl2=new PrintWriter("C:/Users/nag8cw/Desktop/SAI/ATContologyTree/lvl2.txt");
		for(Integer key:hashmaplvl2.keySet())
		{
			writerlvl2.println(key+"\t"+hashmaplvl2.get(key).toLowerCase());
		}
		writerlvl2.close();
		
		//lvl3 details 
		PrintWriter writerlvl3=new PrintWriter("C:/Users/nag8cw/Desktop/SAI/ATContologyTree/lvl3.txt");
		for(Integer key:hashmaplvl3.keySet())
		{
			writerlvl3.println(key+"\t"+hashmaplvl3.get(key).toLowerCase());
		}
		writerlvl3.close();
		
		//lvl4 details 
		PrintWriter writerlvl4=new PrintWriter("C:/Users/nag8cw/Desktop/SAI/ATContologyTree/lvl4.txt");
		for(Integer key:hashmaplvl4.keySet())
		{
				writerlvl4.println(key+"\t"+hashmaplvl4.get(key).toLowerCase());
		}
		writerlvl4.close();
		System.out.println(dcount);
		//lvl5 details 
				PrintWriter writerlvl5=new PrintWriter("C:/Users/nag8cw/Desktop/SAI/ATContologyTree/lvl5.txt");
				for(Integer key:distincthashmaplvl5.keySet())
				{
						writerlvl5.println(key+"\t"+distincthashmaplvl5.get(key).toLowerCase());
				}
				writerlvl5.close();
	}
}