package joyou.Group.model;

import java.text.SimpleDateFormat;
import java.sql.Date;

import javax.xml.bind.annotation.adapters.XmlAdapter;

public class SQLDateAdapter extends XmlAdapter<String, Date> {
    String  format1 = "yyyy-MM-dd";
    String  format2 = "yyyy-MM-dd HH:mm:ss";
    private SimpleDateFormat dateFormat = new SimpleDateFormat(format1);

    @Override
    public String marshal(Date v) throws Exception {
        return dateFormat.format(v);
    }

    @Override
    public Date unmarshal(String v) throws Exception {
        return Date.valueOf(v);
    }

}