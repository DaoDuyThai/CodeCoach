/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Duy Thai
 */
public class Ppat {
    private int id;
    private int type;
    private String summary;
    private String content;

    public Ppat() {
    }

    public Ppat(int id, int type, String summary, String content) {
        this.id = id;
        this.type = type;
        this.summary = summary;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "PPAT{" + "id=" + id + ", type=" + type + ", summary=" + summary + ", content=" + content + '}';
    }
    
}
