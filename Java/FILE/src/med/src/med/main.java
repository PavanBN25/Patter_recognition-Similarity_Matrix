package med.src.med;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipFile;

public class main 
{
	public static void main(String[] args) throws ZipException, IOException 
	{
				
		  
		//C:\Users\nag8cw\Desktop\SAI\Clustering Similarity Matrix\Code Files\clustering jar    //meddra_19_1_english_open
		//ZipFile zipFile=new ZipFile(new File("C:/Users/MITD7W/Documents/meddra_19_1_english_open.zip"));
		ZipFile zipFile=new ZipFile(new File("C:/Users/nag8cw/Desktop/SAI/Clustering Similarity Matrix/Code Files/clustering jar/meddra_19_1_english_open.zip"));		
		String[] order=new String[]{"meddra_19_1_english/MedAscii/mdhier.asc"};		
		Scanner scanner=null;			
		
		HashMap<Integer,String> lvl1 = new HashMap<Integer,String>();
		HashMap<Integer,String> lvl2 = new HashMap<Integer,String>();
		HashMap<Integer,String> lvl3 = new HashMap<Integer,String>();
		HashMap<Integer,String> lvl4 = new HashMap<Integer,String>();
		//HashMap<Integer,String> lvl5 = new HashMap<Integer,String>();
		
		int num_lvl=4;
		int[] arrlvl=new int[num_lvl];
		int count=0;
		for(int i=0;i<order.length;i++)
		{
			ZipEntry zipEntry=zipFile.getEntry(order[i]);
			InputStream inputStream=zipFile.getInputStream(zipEntry);
			scanner=new Scanner(inputStream);
			if(zipEntry.getName().endsWith("MedAscii/mdhier.asc"))
			{
				while(scanner.hasNextLine())
				{
					String line=scanner.nextLine();
					String[] arr=line.split("\\$");
					count++;
					if(!lvl1.containsValue(arr[4]))
					{
						arrlvl[0]++;
						lvl1.put(arrlvl[0], arr[4]);
					}
					if(!lvl2.containsValue(arr[5]))
					{
						arrlvl[1]++;
						lvl2.put(arrlvl[1], arr[5]);
					}
					if(!lvl3.containsValue(arr[6]))
					{
						arrlvl[2]++;
						lvl3.put(arrlvl[2], arr[6]);
					}
					if(!lvl4.containsValue(arr[7]))
					{
						arrlvl[3]++;
						lvl4.put(arrlvl[3], arr[7]);
					}															
				}
				
			}
			
			//___
			PrintWriter writer2=new PrintWriter("C:/Users/nag8cw/Desktop/SAI/ATContologyTree/AEontoFullMAt2.txt");	
			
			int[][] res =new int[count][4];
			int c=-1;
			zipEntry=zipFile.getEntry(order[i]);
			inputStream=zipFile.getInputStream(zipEntry);
			scanner=new Scanner(inputStream);
			if(zipEntry.getName().endsWith("MedAscii/mdhier.asc"))
			{				
				while(scanner.hasNextLine())
				{
					String line=scanner.nextLine();
					String[] arr=line.split("\\$");
					c++;
																																		
					res[c][3]=Integer.parseInt(arr[3]);	
					if(lvl4.containsValue(arr[7]))
					{
						//writer2.print(lvl4.get(arr[7]));
						
						for(Integer key : lvl4.keySet())
						{
							if(lvl4.get(key).equals(arr[7]))
							{
								//System.out.print(key+"\t");
								writer2.print(key+"\t");
								break;
							}
						}
					}
					
					
					res[c][2]=Integer.parseInt(arr[2]);
					if(lvl3.containsValue(arr[6]))
					{
						//writer2.print(lvl3.get(arr[6]));
						
						for(Integer key : lvl3.keySet())
						{
							if(lvl3.get(key).equals(arr[6]))
							{
								//System.out.print(key+"\t");
								writer2.print(key+"\t");
								break;
							}
						}
					}
					
					
					res[c][1]=Integer.parseInt(arr[1]);
					if(lvl2.containsValue(arr[5]))
					{
						//writer2.print(lvl2.get(arr[5]));
						//System.out.print(lvl2.get(arr[5]));
						
						for(Integer key : lvl2.keySet())
						{
							if(lvl2.get(key).equals(arr[5]))
							{
								//System.out.print(key+"\t");
								writer2.print(key+"\t");
								break;
							}
						}
						
					}	
					
					res[c][0]=Integer.parseInt(arr[0]);	
					if(lvl1.containsValue(arr[4]))
					{
						//writer2.print(lvl1.get(arr[4]));
						//System.out.print(lvl1.get(arr[4]));
						
						for(Integer key : lvl1.keySet())
						{
							if(lvl1.get(key).equals(arr[4]))
							{
								//System.out.print(key+"\t");
								writer2.println(key);
								break;
							}
						}
						
					}
					/*
					writer2.print("\t");
					
					
					writer2.print("\t");
					
					
					writer2.print("\t");*/
					
										
				}
			}
			writer2.close();
			
			System.out.println("lvl1:\t "+arrlvl[0]+" \nlvl2:\t"+arrlvl[1]+"\nlvl3:\t"+arrlvl[2]+"\nlvl4:\t"+arrlvl[3]+" "+"\n count : "+count);
			
			/*
			PrintWriter writer2=new PrintWriter("C:/Users/nag8cw/Desktop/SAI/ATContologyTree/AEontoFullMAt2.txt");		
			for(int j=0;j<c;j++)
			{
				if()
				
				writer2.println(res[j][0]+"\t"+res[j][1]+"\t"+res[j][2]+"\t"+res[j][3]);			
			}
			writer2.close();
			*/
			
			
			
			PrintWriter writer=new PrintWriter("C:/Users/nag8cw/Desktop/SAI/ATContologyTree/AEontoFullMAt.txt");		
			for(int j=0;j<c;j++)
			{
				writer.println(res[j][0]+"\t"+res[j][1]+"\t"+res[j][2]+"\t"+res[j][3]);			
			}
			writer.close();
			//lvl1 details
			PrintWriter writerlvl1=new PrintWriter("C:/Users/nag8cw/Desktop/SAI/ATContologyTree/AEontolvl4.txt");		
			for(Integer key:lvl1.keySet())
			{
				writerlvl1.println(key+"\t"+lvl1.get(key).toLowerCase());
			}
			writerlvl1.close();
			
			//lvl2 details 
			PrintWriter writerlvl2=new PrintWriter("C:/Users/nag8cw/Desktop/SAI/ATContologyTree/AEontolvl3.txt");
			for(Integer key:lvl2.keySet())
			{
				writerlvl2.println(key+"\t"+lvl2.get(key).toLowerCase());
			}
			writerlvl2.close();
			
			//lvl3 details 
			PrintWriter writerlvl3=new PrintWriter("C:/Users/nag8cw/Desktop/SAI/ATContologyTree/AEontolvl2.txt");
			for(Integer key:lvl3.keySet())
			{
				writerlvl3.println(key+"\t"+lvl3.get(key).toLowerCase());
			}
			writerlvl3.close();
			
			//lvl4 details 
			PrintWriter writerlvl4=new PrintWriter("C:/Users/nag8cw/Desktop/SAI/ATContologyTree/AEontolvl1.txt");
			for(Integer key:lvl4.keySet())
			{
					writerlvl4.println(key+"\t"+lvl4.get(key).toLowerCase());
			}
			writerlvl4.close();
		}	
		//
		
	}
	
}
