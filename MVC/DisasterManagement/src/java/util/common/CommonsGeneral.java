/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util.common;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author joseph
 */
public class CommonsGeneral {

    public static String getMonth(int monthcode) {
        String month = "";
        switch (monthcode) {
            case 1:
                month = "January";
                break;
            case 2:
                month = "February";
                break;
            case 3:
                month = "March";
                break;
            case 4:
                month = "April";
                break;
            case 5:
                month = "May";
                break;
            case 6:
                month = "June";
                break;
            case 7:
                month = "July";
                break;
            case 8:
                month = "August";
                break;
            case 9:
                month = "September";
                break;
            case 10:
                month = "October";
                break;
            case 11:
                month = "November";
                break;
            case 12:
                month = "December";
                break;
        }
        return month;
    }

//    public String getDays(Timestamp prevdate, Timestamp call_date) throws ParseException, java.text.ParseException {
//        SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
//        SimpleDateFormat checkFormat = new SimpleDateFormat("yyyy-mm-dd");
//        if (checkFormat.parse(prevdate.toString()).compareTo(checkFormat.parse(call_date.toString())) == 0) {
//            SimpleDateFormat checkFormatHours = new SimpleDateFormat("HH:mm:ss");
//            Date date1 = checkFormatHours.parse(prevdate.toString().substring(11, 19));
//            Date date2 = checkFormatHours.parse(call_date.toString().substring(11, 19));
//            long diffHours = date1.getTime() - date2.getTime();
//            return TimeUnit.HOURS.convert(Math.abs(diffHours), TimeUnit.MILLISECONDS) + " Hour(s)";
//        }
//        LocalDate date11 = LocalDate.parse(prevdate.toString().substring(0, 10));
//        LocalDate date12 = LocalDate.parse(call_date.toString().substring(0, 10));
////        long days = Days.daysBetween(date11, date12).getDays();
////long days = Days
//
////        return Math.abs(days) + "Day(s)";
//        return "0 Days";
//    }
//
//    public ArrayList<String> dayscalculation(List<Call_Log> call_list_date) {
//        int i = 0;
//        ArrayList<String> days1 = new ArrayList();
//        Timestamp prevdate = null;
//        int call_list_length = call_list_date.size();
//        for (Call_Log c : call_list_date) {
//            if (i == 0) {
//                prevdate = c.getCall_date();
//                i++;
//                continue;
//            }
//            try {
//                days1.add(getDays(prevdate, c.getCall_date()));
//            } catch (Exception e) {
//                System.out.println("E: dayscalculation: in for loop: " + e.toString());
//            }
//            i++;
//            prevdate = c.getCall_date();
//        }
//        Collections.reverse(days1);
//        return days1;
//    }

}
