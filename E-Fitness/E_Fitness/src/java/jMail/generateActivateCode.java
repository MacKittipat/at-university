/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package jMail;

import java.util.Random;

/**
 *
 * @author Ponlavat
 */
public class generateActivateCode {
    private String generateCode;

    /**
     * @return the generateCode
     */
    public String getGenerateCode() {
        return generateCode;
    }

    /**
     * @param generateCode the generateCode to set
     */
    public void setGenerateCode(String username) {
        int charNum = username.length();
        String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String temp_gen = "";
        
        for(int i = 0;i<charNum;i++){
            Random rn = new Random();
            temp_gen = temp_gen + rn.nextInt(10) + alphabet.charAt(rn.nextInt(27));
        }
        this.generateCode = temp_gen;
    }

}
