import java.awt.*;
import java.awt.event.*;
import java.awt.image.*;
import javax.swing.*;
import javax.swing.border.*;
import java.io.*;
import javax.imageio.*;
// import ข้อมูลของ Char ที่ใช้ในการเช็ค
import DataText.*;

public class MMTCharacterChecker 
{
	//***Declare Container***
	public static JFrame myFrame; 
	public static JPanel myPanelCenter;
	public static JPanel myPanelSouth;
	public static JPanel myPanelNorth;
	
	//***Declare Component***
	public static JLabel lblFileName;
	public static JLabel lblImage;
	public static JLabel lblWidth;
	public static JLabel lblHeigth;
	public static JLabel lblText;
	public static JLabel lblImageWidth;
	public static JLabel lblImageHeigth;
	public static JLabel lblnumChar;
	public static JTextField txtWidth;
	public static JTextField txtHeigth;
	public static JTextField txtImageWidth;
	public static JTextField txtImageHeigth;
	public static JTextField txtText;
	public static JTextField txtnumChar;
	public static ImageIcon imiImage;
	public static JButton btnChooseImage;
	public static JFileChooser digChooseImage;	
	public static JFileChooser digSaveFile;	
	public static Image imgImage;
	public static JScrollPane myScrollPane;
	public static JMenuBar myMenubar;
	public static JMenu myMenuFile;
	public static JMenuItem myItemChooseimage;
	public static JMenuItem myItemSavefile;
	public static JMenuItem myItemExit;
	
	//***Declare Other***
	public static Border lineBorder;
	public static File fileImagePathName;
	public static BufferedImage bufImage;
	
	//***Declare Variable***

	public static int widthImage;
	public static int heigthImage;
	public static int[][] matrixImage;
	public static int[][] matrixCharUncut;
	public static int[][] matrixChar;
	public static String pathSaveFile;
	public static int numChar;
	public static int widthChar;
	public static int heigthChar;
	public static int[] firColHave1;
	public static int[] lasColHave1;
	public static String[] consonant ={"ก","ข","ฃ","ค","ฅ","ฆ","ง","จ","ฉ","ช","ซ","ฌ","ญ","ฎ","ฏ","ฐ","ฑ","ฒ","ณ","ด","ต","ถ","ท","ธ","น","บ","ป","ผ","ฝ","พ","ฟ","ภ","ม","ย","ร","ล","ว","ศ","ษ","ส","ห","ฬ","อ","ฮ "};
	
	public MMTCharacterChecker()
	{		
		//***Create Container***
		// Create Main Container
		myFrame = new JFrame("MMT Character Checker");
		// myFrame : BorderLayout for myPanelCenter,myPanelSouth
		myFrame.setLayout(new BorderLayout());
		// myPanelCenter : BorderLayout for lblFileName,lblImage,btnChooseFile
		myPanelCenter = new JPanel(new BorderLayout());
		// myPanelSouth :  GridLayout 5 Row 2 Column for lblWidth,lblHeigth,lblText,txtWidth,txtHeigth,txtText
		myPanelSouth = new JPanel(new GridLayout(6,2));
		// myPanelNorth : BorderLayout for JMenuBar
		myPanelNorth = new JPanel(new BorderLayout());
		
		//***Create Component***
		lblFileName = new JLabel("  Image Name : ");
		lblImage = new JLabel();
		lblWidth = new JLabel("  Text Width (Pixel) : ");
		lblHeigth = new JLabel("  Text Heigth (Pixel) : ");
		lblText = new JLabel("  Text : ");
		lblImageWidth = new JLabel("  Image Width (Pixel) : ");
		lblImageHeigth = new JLabel("  Image Heigth (Pixel) : ");
		lblnumChar = new JLabel("  Number of Character : ");
		txtWidth = new JTextField();
		txtHeigth = new JTextField();
		txtText = new JTextField();
		txtnumChar = new JTextField();
		
		txtImageWidth = new JTextField();
		txtImageHeigth = new JTextField();
		btnChooseImage = new JButton("Choose Image");
		digChooseImage = new JFileChooser();	
		digSaveFile = new JFileChooser();	
		myScrollPane = new JScrollPane();
		myMenubar = new JMenuBar();
		myMenuFile = new JMenu("File");
		myItemChooseimage = new JMenuItem("Choose Image");
		myItemSavefile = new JMenuItem("Save File");
		myItemExit = new JMenuItem("Exit");
	
		//***Create Other***
		lineBorder = new LineBorder(Color.BLACK, 1);
		
		//***Add myMenuFile to myMenubar and myItemChooseimage, myItemSavefile, myItemExist to myMenuFile***		
		myMenubar.add(myMenuFile);
		myMenuFile.add(myItemChooseimage);
		myMenuFile.addSeparator();
		myMenuFile.add(myItemSavefile);
		myMenuFile.addSeparator();
		myMenuFile.add(myItemExit);
				
		//***Add lblImage to myScrollPane***
		myScrollPane.getViewport().add(lblImage);
		
		//***Add Component to myPanelCenter***
		myPanelCenter.add(lblFileName,BorderLayout.NORTH);
		myPanelCenter.add(myScrollPane,BorderLayout.CENTER);
		myPanelCenter.add(btnChooseImage,BorderLayout.SOUTH);
	
		//***Add Component to myPanelSouth***
		myPanelSouth.add(lblImageWidth);
		myPanelSouth.add(txtImageWidth);
		myPanelSouth.add(lblImageHeigth);
		myPanelSouth.add(txtImageHeigth);
		myPanelSouth.add(lblWidth);
		myPanelSouth.add(txtWidth);
		myPanelSouth.add(lblHeigth);
		myPanelSouth.add(txtHeigth);
		myPanelSouth.add(lblnumChar);
		myPanelSouth.add(txtnumChar);
		myPanelSouth.add(lblText);
		myPanelSouth.add(txtText);
		
		//***Add Component to myPanelNorth***		
		myPanelNorth.add(myMenubar);
		
		//***Add myPanelCenter, myPanelSouth, myPanelNorth to myFrame
		myFrame.add(myPanelCenter,BorderLayout.CENTER);
		myFrame.add(myPanelSouth,BorderLayout.SOUTH);
		myFrame.add(myPanelNorth,BorderLayout.NORTH);
		
		//***Set Properties of Main Container***
		myFrame.setSize(500,500);		
		myFrame.setLocationRelativeTo(null);
		myFrame.setVisible(true);
		myFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		//***Set Properties of Container***
		myPanelCenter.setBorder(new TitledBorder("Image"));
		myPanelSouth.setBorder(new TitledBorder("Detail"));
		
		//***Set Properties of Component***
		lblFileName.setBorder(lineBorder);
		lblImage.setBorder(lineBorder);
		lblWidth.setBorder(lineBorder);
		lblHeigth.setBorder(lineBorder);
		lblText.setBorder(lineBorder);
		lblImageWidth.setBorder(lineBorder);
		lblImageHeigth.setBorder(lineBorder);
		lblnumChar.setBorder(lineBorder);
		txtText.setFont(new Font("tahoma", Font.PLAIN, 20));
		
		//***Set Event to Component***
		// Mouse click on btnChooseImage
		btnChooseImage.addMouseListener(new EventClickButtonChooseImage());
		// Mouse click on myItemChooseimage
		myItemChooseimage.addActionListener(new EventClickMenuItemChooseImage());
		// Mouse click on myItemSavefile
		myItemSavefile.addActionListener(new EventClickMenuItemSaveFile());
		// Mouse click on myItemExit
		myItemExit.addActionListener(new EventClickMenuItemExit());

	}
	
	public static void scanImage(File f) throws IOException
	{
		// Get width of image
		widthImage = imgImage.getWidth(null);
		// Get heigth of image 
		heigthImage = imgImage.getHeight(null);
		// สร้าง bufImage เพื่อใช้ในการนำไปสร้าง matrixImage ต่อ
		BufferedImage bufImage = ImageIO.read(f);
		// กำหนดขนาดให้ matrixImage ซึ่งเป็น Array ที่เก็บ 0-1 ของรูปภาพ
		matrixImage = new int[heigthImage][widthImage];
		
		// Call createMatrixImage : สร้าง matrixImage
		createMatrixImage(bufImage);
		// Call findFirstAndLastColHave1 : หาจำนวนตัวอักษร และตำแหน่งแรกและท้ายที่มีสีดำ
		numChar = findFirstAndLastColHave1();
		// Set numChar to txtnumChar
		txtnumChar.setText(Integer.toString(numChar));
		// Call getChar : แยกทีละอักษรออกจาก MatrixImage มาเป็น matrixCharUncut 
		getChar();
		// Set Char Width and Heigth 
		if(numChar==1) // ถ้ามีอีกษรตัวเดียวให้แสดง Width and Heigth ถ้ามีมากกว่า 1 ก็ไม่ต้องแสดง
		{
			txtWidth.setText(Integer.toString(widthChar));
			txtHeigth.setText(Integer.toString(heigthChar));
		}
		else
		{
			
		}
	}
	// สร้าง matrixImage
	public static void createMatrixImage(BufferedImage bufImage)
	{		
		int x=0,y=0;
		// Get 0,1 to matrixImage
		 for(int i=0; i<=widthImage-1; i++) // (Column) widthImage-1=number of column
		 {
			 for(int j=0; j<=heigthImage-1; j++) // (Row) heightImage-1=number of row
			 {
				 x=i; // Distance in x coordinate
				 y=j; // Distance in y coordinate
				 int clr =  bufImage.getRGB(x,y); 
		    	 int red   = (clr & 0x00ff0000) >> 16;
		    	 int green = (clr & 0x0000ff00) >> 8;
		    	 int blue  =  clr & 0x000000ff;
		    	 // If color is white (255,255,255) will set 0 ,if not will set 1
		    	 if(red<255 && green<255 && blue<255)
		    	 {
		    		 matrixImage[j][i] = 1;
		    	 }
		    	 else if(red==255 && green==255 && blue==255)
		    	 {
		    		 matrixImage[j][i] = 0;
		    	 }   	
			 }
		 }	 
/*		 // Print matrixImage : Start by row (ทีละแถว)
		 for(int j=0; j<=heigthImage-1; j++) 
		 {
			 for(int i=0; i<=widthImage-1; i++)
		     {
		    	System.out.print(matrixImage[j][i]);
		     }
		     System.out.println();
		 }
*/
	}
	
	// หาตำแหน่งแรกและท้ายของ col ของขอบเขตแต่ละอักษร ที่มี 1
	public static int findFirstAndLastColHave1()
	{

		int count0=0,countCol0=0;
		// นับจำนวน column ที่เป็น 0 หมด	/ scan ทีละ column
		for(int i=0;i<=widthImage-1;i++)
		{		
			for(int j=0;j<=heigthImage-1;j++)
			{
				if(matrixImage[j][i]==0)
				{
					count0++; 
				}
				if(count0==heigthImage) // ถ้า count0==heigthImage คือ column นั้นเป็น 0 หมด
				{
					countCol0++;
				}
			}
			count0=0;
		}
		// เก็บตำแหน่ง column ที่เป็น 0 หมดลง Array
		int[] columnAll0 = new int[countCol0];
		count0=0; countCol0=0;
		for(int i=0;i<=widthImage-1;i++)
		{		
			for(int j=0;j<=heigthImage-1;j++)
			{
				if(matrixImage[j][i]==0)
				{
					count0++;
				}
				if(count0==heigthImage)
				{
					columnAll0[countCol0] = i;
					//System.out.println(columnAll0[countCol0]);
					countCol0++;
				}
			}
			count0=0;
		}		
		
		// นับจำนวนตำแหน่งที่มี 1 อันแแรกในแต่ column ของแต่ละอักษร
		int countFirstColHave1=0;	
		for(int i=0;i<=columnAll0.length-2;i++)
		{
			if(columnAll0[i+1]-columnAll0[i]>1)
			{
				//System.out.println(columnAll0[i]+1);	
				countFirstColHave1++;
			}
		}		
		int[] firstColHave1 = new int[countFirstColHave1];
		int k=0;
		// เก็บตำแหน่งที่มี 1 อันแแรกในแต่ column ของแต่ละอักษรลง array
		for(int i=0;i<=columnAll0.length-2;i++)
		{
			if(columnAll0[i+1]-columnAll0[i]>1)
			{
				//System.out.println(columnAll0[i]+1);
				firstColHave1[k]=columnAll0[i]+1;
				k++;
			}
		}	
		
		// นับจำนวนตำแหน่งที่มี 1 อันท้ายในแต่ column ของแต่ละอักษร
		int countLastColHave1=0;	
		for(int i=columnAll0.length-1;i>=1;i--)
		{
			//System.out.println(columnAll0[i]);
			//System.out.println(columnAll0[i]-columnAll0[i-1]);
			if(columnAll0[i]-columnAll0[i-1]>1)
			{
				countLastColHave1++;		
			}
		}
		int[] lastColHave1 = new int[countFirstColHave1];
		k=0;
		// เก็บตำแหน่งที่มี 1 อันท้ายในแต่ column ของแต่ละอักษร
		for(int i=columnAll0.length-1;i>=1;i--)
		{
			//System.out.println(columnAll0[i]);
			//System.out.println(columnAll0[i]-columnAll0[i-1]);
			if(columnAll0[i]-columnAll0[i-1]>1)
			{
				//System.out.println(columnAll0[i]-1);			
				lastColHave1[k]=columnAll0[i]-1;
				k++;
			}
		}
		// reverse lastColHave1 เพื่อให้เลขที่มีค่าน้อยมาอยู่ตำแหน่งแรกของ array
		int[] rlastColHave1 = new int[lastColHave1.length];
		int last=lastColHave1.length-1;
		// reverse array 
		for(int i=0;i<=lastColHave1.length-1;i++)
		{
			rlastColHave1[i] = lastColHave1[last];
			last--;
		}
		
		//กำหนดค่าให้ firColHave1 และ lasColHave1 เป็น array เก็บตำแหน่งแรกและท้ายที่มี 1
		firColHave1 = firstColHave1;
		lasColHave1 = rlastColHave1;
		
		// return จำนวนอักษรกลับไป
		return countFirstColHave1;
	//END findFirstAndLastColHave1()
	}
	
	public static void getChar()
	{	
		int ii=0,jj=0;
		// แยกทีละอักษรมาเก็บใน matrixCharUncut เพื่อนำทีละอักษรไปเช้คว่าเป็นอัการอะไรในขั้นต่อๆไป
		for(int k=0;k<=numChar-1;k++)
		{
			jj=0;
			matrixCharUncut = new int[heigthImage][(lasColHave1[k]-firColHave1[k])+1];
			for(int j=0;j<=heigthImage-1;j++)
			{
				ii=0;
				for(int i=firColHave1[k];i<=lasColHave1[k];i++)
				{
					matrixCharUncut[jj][ii] = matrixImage[j][i];
					ii++;
				}
				jj++;
			}
			// Call getCharCut เพื่อตัดส่วนเกินคือสีขาวออกให้เหลือแค่ส่วนของ matrixChar 
			getCharCut(matrixCharUncut);
					
/* 			print matrixCharUncut ทีละอักษรที่ถูกแยกออกมา
			for(int j=0;j<=matrixCharUncut.length-1;j++)
			{
				for(int i=0;i<=matrixCharUncut[0].length-1;i++)
				{
					System.out.print(matrixCharUncut[j][i]);
				}
				System.out.println();
			}
*/	
		}
	//END getChar()
	}
	// ตัดส่วนเกินที่เป็นสีขาวออกมให้เหลือแค่ matrixChar
	public static void getCharCut(int[][] matrixCharUncut)
	{
		// หา Width ทีละอักษร
		//int widthChar = matrixCharUncut[0].length;
		
		int x1w=0,y1w=0;
		 for(int i=0; i<=matrixCharUncut[0].length-1; i++) // Scan ทีละ Col จากซ้ายไปขวา
		 {
			 for(int j=0; j<=heigthImage-1; j++)
		     {
		    		 if(matrixCharUncut[j][i]==1 && x1w==0 && y1w==0) // ไม่มี matrixCharUncut[j][i-1]==0 เพราะอยู่ติดขอบ
		    		 {
		    			 x1w=i;
		    			 y1w=j;
		    			 break;
		    		 }
		     }
		 }
		 int x2w=0,y2w=0;
		 for(int i=matrixCharUncut[0].length-1; i>=0; i--) // Scan ทีละ Col จากขวาไปซ้าย
		 {
			 for(int j=0; j<=heigthImage-1; j++)
			 {
	    		 if(matrixCharUncut[j][i]==1 && x2w==0 && y2w==0)
	    		 {
	    			 x2w=i;
	    			 y2w=j;
	    			 break;
	    		 }
			 }
		 }
		 widthChar = (x2w-x1w)+1;
		 //System.out.println(widthChar + " " + x2w + " " + x1w);
		int x1h=0,y1h=0;
		// หา Heigth ทีละอักษร
		for(int j=0;j<=matrixCharUncut.length-1;j++) // Scan ทีละ Row จากบนลงล่าง
		{
			for(int i=0;i<=matrixCharUncut[0].length-1;i++)
			{
				if(matrixCharUncut[j][i]==1 && matrixCharUncut[j-1][i]==0 && x1h==0 && y1h==0)
				{
					 x1h=i;
	    			 y1h=j;
	    			 break;
				}
			}
		}
		int x2h=0,y2h=0;
		for(int j=heigthImage-1; j>=0; j--) // Scan ทีละ Row จากล่างขึ้นบน
		{
			for(int i=0; i<=matrixCharUncut[0].length-1; i++) 
			{
	    		if(matrixCharUncut[j][i]==1 && matrixCharUncut[j+1][i]==0 && x2h==0 && y2h==0)
	    		{
	    			x2h=i;
	    			y2h=j;
	    			break;
	    		}
			}
		}
		heigthChar = y2h-y1h+1;		
		
		//System.out.println("Width = " + widthChar + "\n" + "Heigth = " + heigthChar);	
		
		//ตัดส่วนเกินออกให้เหลือแค่ matrixChar
		matrixChar = new int[heigthChar][widthChar];
		for(int j=0; j<=heigthChar-1; j++) 
		 {
			 for(int i=0; i<=widthChar-1; i++)
		     {
				 //matrixImage[j+y1h][i+x1w] Start at top-left corner of Char at (y1h,x1w)
				 matrixChar[j][i] = matrixCharUncut[j+y1h][i+x1w];
		     }
		 }
		
		//Call checkChar() เช็คว่าเป้นอักษรใด
		checkChar();
		
/*		// Print matrixChar
		 for(int j=0; j<=heigthChar-1; j++) 
		 {
			 for(int i=0; i<=widthChar-1; i++)
		     {
		    	System.out.print(matrixChar[j][i]);
		     }
		     System.out.println();
		 }
*/	

	}
	
	// เช็คว่า matrixChar เป้นอักษรใด
	public static void checkChar()
	{
		// Call Method setChar for check char and set char to TextField
		setChar(DataTextTahoma14.Tahoma14); // ส่ง argument ไปเป็นตัวเปรียบเทียบ
		setChar(DataTextTahoma16.Tahoma16);
		setChar(DataTextTahoma18.Tahoma18);
		setChar(DataTextTahoma20.Tahoma20);
		setChar(DataTextAngsanaNew14.AngsanaNew14);
		setChar(DataTextAngsanaNew16.AngsanaNew16);
		setChar(DataTextAngsanaNew18.AngsanaNew18);
		setChar(DataTextAngsanaNew20.AngsanaNew20);
		setChar(DataTextTimesNewRoman14.TimesNewRoman14);
		setChar(DataTextTimesNewRoman16.TimesNewRoman16);
		setChar(DataTextTimesNewRoman18.TimesNewRoman18);
		setChar(DataTextTimesNewRoman20.TimesNewRoman20);
		
	}
	// set อักษรที่เช็คไปที่ txtText
	public static void setChar(int dataText[][][])
	{
		int countEqual=0;
		// k=0 is ก ,k=1 is ข,...
		for(int k=0;k<=43;k++)
		{
			// j is row
			for(int j=0; j<=heigthChar-1; j++) 
			{
				// i is column
				for(int i=0; i<=widthChar-1; i++)
				{
					// Use try...catch because it have a chance to error (index out of bound if matrixText[j][i] != DataTextTahoma.size20[k][j][i],Ex : Image ก but check DataTextTahoma.size20[k][j][i] ข then size of matrix not equal)
					// มีโอกาส error เพราะ ถ้าใส่รูป ข แล้วเช็คที่ k=0 คือ ก ,matrixText ของ ก และ ข มีความกว้างและสุงไม่เ่ท่ากันจึงเกิด error ได้
					try
					{
						if(matrixChar[j][i] == dataText[k][j][i])
						 {
							 countEqual++;
						 }
					}
					catch(ArrayIndexOutOfBoundsException e)
					{
						
					}
				}
			}	
						
			// ถ้า countEqual==(heigthText)*(widthText) เช่น ใส่รูป ก (array matrixText)แล้วเช้คที่ลูป k=0 จะเช็ค  DataTextTahoma.size20[k][j][i] ของ ก ดังนี้น countEqual ต้องเท่ากันกว้างคูณสูงของรูป(countEqual เช้คจำนวนตำแหน่งของ  array ที่เท่ากัน) ถึงจะเช็คได้ว่าเป็นอักษร ก เพราะ matrixText[j][i] และ DataTextTahoma.size20[k][j][i] มีค่าเหมือนกันทุกตำแหน่ง 
 			if(countEqual==(heigthChar)*(widthChar) && dataText[k][0].length == widthChar && dataText[k].length == heigthChar )	//มี else ไม่ได้เพระถ้าเป็นรูป ข ในรอบแรกจะเช็คว่าเป็น ก หรือไม่ และทำที่ else พอรอบ2 เช็ค ข จึงทำif แต่รอบถัดไปจนถึง43จะทำ else ตลอดเพราะไม่ใช่ ข แต่เป็น ค,ฅ,...
			{																													//dataText[k][0].length == widthText && dataText[k].length == heigthText ใช้เช็ตดูว่าความกว้างและสูงของรูปที่ input มา ต้องเท่ากับความกว้างและสูงของตัวที่ใช้เปรียบเทียบ(DataText)ด้วย
				// Set text to txtText
 				String txt = MMTCharacterChecker.txtText.getText();
				MMTCharacterChecker.txtText.setText((txt + consonant[k]).trim());
				// เจอแล้วหยุดค้นหา
				break;
			}
 			// Reset countEqual for new count
			countEqual=0;
		}
	}
	
	// Save file
	public static void saveFile() throws IOException
	{
		// Create BufferedWriter fpr Write file to Text
		BufferedWriter bufWriter = new BufferedWriter(new FileWriter(pathSaveFile));
		bufWriter.write("Image name 	: " + MMTCharacterChecker.digChooseImage.getName(MMTCharacterChecker.digChooseImage.getSelectedFile()));
		bufWriter.newLine();
		bufWriter.write("Image Width 	: " + widthImage);
		bufWriter.newLine();
		bufWriter.write("Image Heigth 	: " + heigthImage);
		if (numChar==1)
		{
			bufWriter.newLine();
			bufWriter.write("Char Width 	: " + widthChar);
			bufWriter.newLine();
			bufWriter.write("Char Heigth 	: " + heigthChar);
		}
		else
		{
			
		}
		bufWriter.newLine();	
		bufWriter.write("Number of Char	: " + txtnumChar.getText());		
		bufWriter.newLine();
		bufWriter.write("Text		: " + txtText.getText());
		
		bufWriter.newLine();
		// Write Matrix Text
		if (numChar==1) //ถ้ามีอักษรแค่ 1 ให้ใส่ matrixChar ลงใน file ด้วย
		{
			bufWriter.write("Matrix Character     : ");
			bufWriter.newLine();
			for(int j=0; j<=heigthChar-1; j++) 
			{
				for(int i=0; i<=widthChar-1; i++)
				{			
					bufWriter.write(Integer.toString(matrixChar[j][i]));
				}
			 bufWriter.newLine();
			}
		}
		
		// Close bufWriter
		bufWriter.close();
	}
	
	public static void main(String args[])
	{
		new MMTCharacterChecker();
	}
// End MMTCharacterChecker Class
}

//EventClickButtonChooseImage for click button Choose Image
class EventClickButtonChooseImage implements MouseListener
{
	@Override
	public void mouseClicked(MouseEvent e) 
	{
		//set filter 
		MMTCharacterChecker.digChooseImage.setFileFilter(new TXTfilter2());	
		// Show digChooseImage for choose Image
		int result = MMTCharacterChecker.digChooseImage.showDialog(MMTCharacterChecker.myFrame, "Choose Image");
		// Do when click Choose Image in digChooseImage
		if(result != JFileChooser.CANCEL_OPTION)
		{
			// Show Image Name In lblFileName
			MMTCharacterChecker.lblFileName.setText("  Image Name : " + MMTCharacterChecker.digChooseImage.getName(MMTCharacterChecker.digChooseImage.getSelectedFile()));			
			// Create ImageIcon 
			MMTCharacterChecker.imiImage = new ImageIcon(MMTCharacterChecker.digChooseImage.getCurrentDirectory() + "\\" + MMTCharacterChecker.digChooseImage.getName(MMTCharacterChecker.digChooseImage.getSelectedFile()));
			// Create Image and getImage for get Width and Heigth of Image
			MMTCharacterChecker.imgImage = new ImageIcon(MMTCharacterChecker.digChooseImage.getCurrentDirectory() + "\\" + MMTCharacterChecker.digChooseImage.getName(MMTCharacterChecker.digChooseImage.getSelectedFile())).getImage();
			// Set ImageIcon to lblImage
			MMTCharacterChecker.lblImage.setIcon(MMTCharacterChecker.imiImage);
			// Set Image Path Name to fileImageName
			MMTCharacterChecker.fileImagePathName = new File(MMTCharacterChecker.digChooseImage.getCurrentDirectory() + "\\" + MMTCharacterChecker.digChooseImage.getName(MMTCharacterChecker.digChooseImage.getSelectedFile()));
			// Set Image Width
			MMTCharacterChecker.txtImageWidth.setText(Integer.toString(MMTCharacterChecker.imgImage.getWidth(null)));
			// Set Image Heigth
			MMTCharacterChecker.txtImageHeigth.setText(Integer.toString(MMTCharacterChecker.imgImage.getHeight(null)));
			// Clear text in txtText txtHeigth txtWidth before call getTextWidthHeight (ลบ text อันก่อนหน้านี้)
			MMTCharacterChecker.txtText.setText(" ");	
			MMTCharacterChecker.txtHeigth.setText(" ");
			MMTCharacterChecker.txtWidth.setText(" ");
			try 
			{
				// Call scanText
				MMTCharacterChecker.scanImage(MMTCharacterChecker.fileImagePathName);
			} catch (IOException e1) 
			{
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		else 
		{
			// Empty
		}
	}

	@Override
	public void mouseEntered(MouseEvent e) 
	{
		// TODO Auto-generated method stub
	}

	@Override
	public void mouseExited(MouseEvent e) 
	{
		// TODO Auto-generated method stub
	}

	@Override
	public void mousePressed(MouseEvent e) 
	{
		// TODO Auto-generated method stub
	}

	@Override
	public void mouseReleased(MouseEvent e) 
	{
		// TODO Auto-generated method stub
	}
}

//EventClickMenuItemChooseImage for click menu Choose Image
class EventClickMenuItemChooseImage implements ActionListener
{

	@Override
	public void actionPerformed(ActionEvent e) 
	{
		//set filter 
		MMTCharacterChecker.digChooseImage.setFileFilter(new TXTfilter2());	
		// Show digChooseImage for choose Image
		int result = MMTCharacterChecker.digChooseImage.showDialog(MMTCharacterChecker.myFrame, "Choose Image");
		// Do when click Choose Image in digChooseImage
		if(result != JFileChooser.CANCEL_OPTION)
		{
			// Show Image Name In lblFileName
			MMTCharacterChecker.lblFileName.setText("  Image Name : " + MMTCharacterChecker.digChooseImage.getName(MMTCharacterChecker.digChooseImage.getSelectedFile()));
			// Create ImageIcon 
			MMTCharacterChecker.imiImage = new ImageIcon(MMTCharacterChecker.digChooseImage.getCurrentDirectory() + "\\" + MMTCharacterChecker.digChooseImage.getName(MMTCharacterChecker.digChooseImage.getSelectedFile()));
			// Create Image and getImage for get Width and Heigth of Image
			MMTCharacterChecker.imgImage = new ImageIcon(MMTCharacterChecker.digChooseImage.getCurrentDirectory() + "\\" + MMTCharacterChecker.digChooseImage.getName(MMTCharacterChecker.digChooseImage.getSelectedFile())).getImage();
			// Set ImageIcon to lblImage
			MMTCharacterChecker.lblImage.setIcon(MMTCharacterChecker.imiImage);
			// Set Image Path Name to fileImageName
			MMTCharacterChecker.fileImagePathName = new File(MMTCharacterChecker.digChooseImage.getCurrentDirectory() + "\\" + MMTCharacterChecker.digChooseImage.getName(MMTCharacterChecker.digChooseImage.getSelectedFile()));
			// Set Image Width
			MMTCharacterChecker.txtImageWidth.setText(Integer.toString(MMTCharacterChecker.imgImage.getWidth(null)));
			// Set Image Heigth
			MMTCharacterChecker.txtImageHeigth.setText(Integer.toString(MMTCharacterChecker.imgImage.getHeight(null)));
			// Clear text in txtText before call getTextWidthHeight (ลบ text อันก่อนหน้านี้)
			MMTCharacterChecker.txtText.setText(" ");
			// Call scanText
			try 
			{
				MMTCharacterChecker.scanImage(MMTCharacterChecker.fileImagePathName);
			} catch (IOException e1) 
			{
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}

		else 
		{
			// Empty
		}
	}
}

//EventClickSaveFile for click menu Save File
class EventClickMenuItemSaveFile implements ActionListener
{
	@Override
	public void actionPerformed(ActionEvent e) 
	{
		// Show digSaveFile 
		MMTCharacterChecker.digSaveFile.setFileFilter(new TXTfilter());
		// Set txt filter in digSaveFile
		MMTCharacterChecker.digSaveFile.showSaveDialog(MMTCharacterChecker.myFrame);
		// get path + filename + filter to pathSaveFile
		MMTCharacterChecker.pathSaveFile = MMTCharacterChecker.digSaveFile.getSelectedFile() + ".txt";
		try 
		{
			MMTCharacterChecker.saveFile();
		} catch (IOException e1) 
		{
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
}

// EventClickMenuItemExit for click menu Exit
class EventClickMenuItemExit implements ActionListener
{
	@Override
	public void actionPerformed(ActionEvent e) 
	{
		// Exit 
		System.exit(0);
	}
}

// Set .txt filter in digSaveFile
class TXTfilter extends javax.swing.filechooser.FileFilter 
{
    public boolean accept(File f) 
    {
        return f.isDirectory() || f.getName().toLowerCase().endsWith(".txt"); 
    }
    public String getDescription() 
    {
        return "Text File (.*txt)";
    }
}

//Set .txt filter in digSaveFile
class TXTfilter2 extends javax.swing.filechooser.FileFilter 
{
    public boolean accept(File f) 
    {
        return f.isDirectory() || f.getName().toLowerCase().endsWith(".png"); 
    }
    public String getDescription() 
    {
        return "PNG (.*png)";
    }
}
