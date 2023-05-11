package com.enactor.training.trainingCustomer;


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

import java.util.Map;
import java.util.List;

import com.enactor.core.utilities.Logger;
import com.enactor.core.application.process.IApplicationProcessDataType;
import com.enactor.core.application.process.ApplicationProcessDataType;	

/**
 * Add comments for the MockCustomer entity implementation here
 *
 * Last Generated at: 13-04-2023 09:52:32
 * @author Enactor
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "MockCustomer", namespace=com.enactor.training.PackageInfo.NSURI_TRAINING, propOrder = {
	"customerName",
	"customerNumber"
})

@XmlRootElement(name = MockCustomer.ENTITY_NAME, namespace=com.enactor.training.PackageInfo.NSURI_TRAINING)
public class MockCustomer implements IMockCustomer {

	/** My logger instance */
	@SuppressWarnings("unused")
	private static final Logger logger = Logger.getLogger(MockCustomer.class);
	
	/** serialVersionUID */
	private static final long serialVersionUID = 1L;
	
	/** Entity name. */
	public static final String ENTITY_NAME = "mockCustomer";
	
	/** Entity QName */
	public static final QName ENTITY_QNAME = new QName(com.enactor.training.PackageInfo.NSURI_TRAINING, ENTITY_NAME, com.enactor.training.PackageInfo.PREFIX_TRAINING);

	/** Entity application data type name */
	public static final String ENTITY_DATA_TYPE_NAME = "enactor.training.trainingCustomer.MockCustomer";
	
	/** Entity application data type */
	public static final IApplicationProcessDataType ENTITY_DATA_TYPE = new ApplicationProcessDataType(ENTITY_DATA_TYPE_NAME, IMockCustomer.class.getName());	
		
	/** The CustomerName field */
	
	@XmlElement(required = true, type = Name.class)
	private IName customerName = new Name();
	
	/** The CustomerNumber field */
	private String customerNumber = null;

	/**************************************************************************
	 * MockCustomer Interface
	 **************************************************************************/
	
	@Override
	public void setCustomerName(IName customerName) throws PropertyValidationException {
		this.customerName = customerName;
	}
	
	@Override
	public IName getCustomerName() {
		return customerName;
	}
	
	@Override
	public void setCustomerNumber(String customerNumber) throws PropertyValidationException {
		this.customerNumber = customerNumber;
	}
	
	@Override
	public String getCustomerNumber() {
		return (customerNumber == null) ? "" : customerNumber;
	}
	
	@Override
	public QName getEntityQName() {
		return ENTITY_QNAME;
	}

}
