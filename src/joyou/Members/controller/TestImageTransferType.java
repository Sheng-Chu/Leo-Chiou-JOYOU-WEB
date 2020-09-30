package joyou.Members.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

public class TestImageTransferType {
	public static final String JPG = "jpg";
	public static final String GIF = "gif";
	public static final String PNG = "png";
	public static final String BMP = "bmp";

	public static void main(String[] args) {

		String memberAccount = "acc6797";
		String sourceFile = "C:\\WorkDataSource\\workspace\\JoYouProject\\WebContent\\up_NoUsed\\" + memberAccount
				+ "." + PNG;
//		new TestImageTransferType().Conversion(JPG, PNG, sourceFile, memberAccount);// JPG轉成PNG
		new TestImageTransferType().Conversion(PNG, JPG, sourceFile, memberAccount);// PNG轉成JPG
//		new TestImageTransferType().Conversion(JPG, GIF, sourceFile, memberAccount);// JPG轉成GIF
//		new TestImageTransferType().Conversion(JPG, BMP, sourceFile, memberAccount);// JPG轉成BMP

	}


	// 原始副檔名,輸出副檔名,原始檔案路徑,輸出檔名
	public void Conversion(String inputFormat, String outputFormat, String sourceFile, String fileName) {
		try {
			File inputFile = new File(sourceFile);
			BufferedImage bim = ImageIO.read(inputFile);
			File outputFile = new File(
					"C:\\WorkDataSource\\workspace\\JoYouProject\\WebContent\\up_NoUsed\\"
							+ fileName + "." + outputFormat);
			ImageIO.write(bim, outputFormat, outputFile);
			System.out.println("finish");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
