/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Duy Thai
 */
public class Users {

    private int userId;
    private String email;
    private String password;
    private String fName;
    private String lName;
    private String gender;
    private String phoneNum;
    private int roleId;
    private int statusId;
    private String address;
    private String maqh;
    private String facebook;

    public Users(String fName, String lName, String gender, String email, String phoneNum, String address, String facebook,String password) {
        this.email = email;
        this.password = password;
        this.fName = fName;
        this.lName = lName;
        this.gender = gender;
        this.phoneNum = phoneNum;
        this.address = address;
        this.facebook = facebook;
    }

    public Users(int userId, String email, String password, String fName, String lName, String gender, String phoneNum, int roleId, int statusId, String address, String maqh, String facebook) {
        this.userId = userId;
        this.email = email;
        this.password = password;
        this.fName = fName;
        this.lName = lName;
        this.gender = gender;
        this.phoneNum = phoneNum;
        this.roleId = roleId;
        this.statusId = statusId;
        this.address = address;
        this.maqh = maqh;
        this.facebook = facebook;
    }

    public Users() {
    }

    @Override
    public String toString() {
        return "Users{" + "userId=" + userId + ", email=" + email + ", password=" + password + ", fName=" + fName + ", lName=" + lName + ", gender=" + gender + ", phoneNum=" + phoneNum + ", roleId=" + roleId + ", statusId=" + statusId + ", address=" + address + ", maqh=" + maqh + ", facebook=" + facebook + '}';
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMaqh() {
        return maqh;
    }

    public void setMaqh(String maqh) {
        this.maqh = maqh;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }
}
