package com.cglia.model;
/**
 * 
 * @author venkata.marni
 *@since 22-05-2023
 *@version 1.0
 */
public class User {
    private int id;
    private String name;
    private String email;
    private String password;
   /**
    * Empty Constructor
    */
	public User() {
	}
	/**
	 * 
	 * @param id
	 * @param name
	 * @param email
	 * @param password
	 */
	public User(int id, String name, String email, String password) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
	}
    /**
     * 
     * @return returns int value of id
     */
	public int getId() {
		return id;
	}
    /**
     * 
     * @param id-Accepts int value in id
     */
	public void setId(int id) {
		this.id = id;
	}
    /**
     * 
     * @return returns String value in name
     */
	public String getName() {
		return name;
	}
    /**
     * 
     * @param name-accepts String value in name 
     */
	public void setName(String name) {
		this.name = name;
	}
    /**
     * 
     * @return returns String value in email.
     */
	public String getEmail() {
		return email;
	}
    /**
     * 
     * @param email-accepts String value in email
     */
	public void setEmail(String email) {
		this.email = email;
	}
    /**
     * 
     * @return password-Returns String value in password
     */
	public String getPassword() {
		return password;
	}
    /**
     * 
     * @param password-accepts String value in password
     */
	public void setPassword(String password) {
		this.password = password;
	}
	
}