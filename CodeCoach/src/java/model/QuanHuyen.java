/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Duy Thai
 */
public class QuanHuyen {
    private String maqh;
    private String name;
    private String type;
    private String mattp;

    public QuanHuyen() {
    }

    public QuanHuyen(String maqh, String name, String type, String mattp) {
        this.maqh = maqh;
        this.name = name;
        this.type = type;
        this.mattp = mattp;
    }

    public String getMaqh() {
        return maqh;
    }

    public void setMaqh(String maqh) {
        this.maqh = maqh;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMattp() {
        return mattp;
    }

    public void setMattp(String mattp) {
        this.mattp = mattp;
    }

    @Override
    public String toString() {
        return "QuanHuyen{" + "maqh=" + maqh + ", name=" + name + ", type=" + type + ", mattp=" + mattp + '}';
    }
    
}
