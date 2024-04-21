package com.cglia.model;
/**
 * 
 * @author venkata.marni.
 * @since 22-05-2023
 * @version 1.0
 *
 */
public class Cart extends Product{
	private int quantity;
	/**
	 * default constructor 
	 */
	public Cart() {
	}
    /**
     * 
     * @return integer value of quantity.
     */
	public int getQuantity() {
		return quantity;
	}
    /**
     * 
     * @param int-value to set no of quantity.
     */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}
