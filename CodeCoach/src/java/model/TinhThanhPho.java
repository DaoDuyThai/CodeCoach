/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Duy Thai
 */
public class TinhThanhPho {
    private String mattp;
    private String name;
    private String type;

    public TinhThanhPho(String mattp, String name, String type) {
        this.mattp = mattp;
        this.name = name;
        this.type = type;
    }

    public TinhThanhPho() {
    }

    public String getMattp() {
        return mattp;
    }

    public void setMattp(String mattp) {
        this.mattp = mattp;
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

    @Override
    public String toString() {
        return "TinhThanhPho{" + "mattp=" + mattp + ", name=" + name + ", type=" + type + '}';
    }
    
}

