package controller;

import dao.UserDAO;

public class check {
    public static void main(String [] args){
        //UserDAO.getCardBeanbyUid("2017001");

        //UserDAO.findUserByID("2017001");

        String number="";




        for (int i = 0;i<100;i++) {
            int num = (int) (Math.random() * 10);

            while (num==0){
                num = (int) (Math.random() * 10);
            }

            System.out.println(num);
        }
//        for(int i=0;i<7;i++){
//            int num = (int)(Math.random()*10);
//            number+=""+num;
//        }




    }
}
