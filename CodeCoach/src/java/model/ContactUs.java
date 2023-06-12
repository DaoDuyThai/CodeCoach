/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author NGHIA
 */
public class ContactUs {
    private int id; 
    private String infor; 
    private String href; 

    public ContactUs() {
    }

    public ContactUs(int id, String infor, String href) {
        this.id = id;
        this.infor = infor;
        this.href = href;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getInfor() {
        return infor;
    }

    public void setInfor(String infor) {
        this.infor = infor;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }
    @Override
    public String toString() {
        return "ContactUs{" + "id=" + id + ", infor=" + infor + ", href=" + href + '}';
    }
}
