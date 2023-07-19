/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author kienb
 */
public class SlotDTO {
    private int totalSlots;
    private int totalHours;

    public SlotDTO() {
    }

    public SlotDTO(int totalSlots, int totalHours) {
        this.totalSlots = totalSlots;
        this.totalHours = totalHours;
    }

    public int getTotalSlots() {
        return totalSlots;
    }

    public void setTotalSlots(int totalSlots) {
        this.totalSlots = totalSlots;
    }

    public int getTotalHours() {
        return totalHours;
    }

    public void setTotalHours(int totalHours) {
        this.totalHours = totalHours;
    }
    
    
}
