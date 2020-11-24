package util;

import org.springframework.util.DigestUtils;


public class EncryptionMD5 {
    /**
     * MD5方法
     *
     * @param plain 明文
     * @return 密文
     * @throws Exception
     */
    public static String md5(String plain) {
//        加密后的字符串
        try {
            byte[] bytes = plain.getBytes();
            String ciphertext = DigestUtils.md5DigestAsHex(bytes);
            System.out.println("MD5加密后的字符串为:encodeStr="+ciphertext);
            return ciphertext;
        } catch (Exception e) {
            System.out.println("MD5加密出错");
            e.printStackTrace();
        }
        return null;
    }

    /**
     * MD5验证方法
     *
     * @param text 明文
     * @return true/false
     * @throws Exception
     */
    public static boolean verify(String text) throws Exception {
//        //根据传入的密钥进行验证
        return false;
    }
//
    public static void main(String[] args) throws Exception {

        EncryptionMD5.md5("123456");
    }
}