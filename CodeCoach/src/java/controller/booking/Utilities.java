package controller.booking;

import java.text.Normalizer;
import java.util.Calendar;
import java.util.Date;
import java.util.regex.Pattern;

public class Utilities {
    public static String convertToNonDiacritics(String input) {
        String decomposed = Normalizer.normalize(input, Normalizer.Form.NFD);
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        return pattern.matcher(decomposed).replaceAll("");
    }

    public static int getStartDayOfWeek(Calendar calendar){
        calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        return calendar.get(Calendar.DAY_OF_MONTH);
    }

    public static void main(String[] args) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
        System.out.println("Current date: " + calendar.getTime());
        System.out.println(getStartDayOfWeek(calendar));
    }
}
