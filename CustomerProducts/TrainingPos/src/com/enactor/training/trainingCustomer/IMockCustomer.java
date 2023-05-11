package com.enactor.training.trainingCustomer;

import com.enactor.core.entities.IEntity;
import com.enactor.core.entities.IXMLSerializable;
import com.enactor.core.entities.PropertyValidationException;


import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;

import javax.xml.bind.annotation.XmlElement;

import javax.xml.bind.annotation.XmlRootElement;

import javax.xml.bind.annotation.XmlType;
import javax.xml.namespace.QName;

import com.enactor.core.entities.PropertyValidationException;
import com.enactor.core.entities.IEntityKey;
import com.enactor.mfc.name.IName;
import com.enactor.mfc.name.Name;

/**
 * Add comments for the MockCustomer entity interface here
 *
 * Last Generated at: 13-04-2023 09:52:32
 * @author Enactor
 */
public interface IMockCustomer extends IEntity {

	
	/**
	 * Set the CustomerName
	 *
	 * @param customerName
	 * @throws PropertyValidationException
	 */
	public void setCustomerName(IName customerName) throws PropertyValidationException;
	
	/**
	 * Get the CustomerName
	 *
	 * @return customerName
	 */
	public IName getCustomerName();
	
	
	/**
	 * Set the CustomerNumber
	 *
	 * @param customerNumber
	 * @throws PropertyValidationException
	 */
	public void setCustomerNumber(String customerNumber) throws PropertyValidationException;
	
	/**
	 * Get the CustomerNumber
	 *
	 * @return customerNumber
	 */
	public String getCustomerNumber();
	
	
}
