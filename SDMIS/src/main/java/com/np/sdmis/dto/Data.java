package com.np.sdmis.dto;

import java.io.Serializable;

import com.np.sdmis.model.SchoolData;

public class Data implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	SchoolData result;

	public SchoolData getResult() {
		return result;
	}

	public void setResult(SchoolData result) {
		this.result = result;
	}

	@Override
	public String toString() {
		return "Data [result=" + result + "]";
	}

}
