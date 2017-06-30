package com.aticser.model;

public class Municipality {
	
	private int municipi_id;
	private int provincia_id;
	private String codi_ine;
	private String descripcio;
	
	public Municipality() {}
	
	public Municipality(int municipi_id, int provincia_id, String codi_ine, String descripcio) {
		super();
		this.municipi_id = municipi_id;
		this.provincia_id = provincia_id;
		this.codi_ine = codi_ine;
		this.descripcio = descripcio;
	}

	public int getMunicipi_id() {
		return municipi_id;
	}

	public void setMunicipi_id(int municipi_id) {
		this.municipi_id = municipi_id;
	}

	public int getProvincia_id() {
		return provincia_id;
	}

	public void setProvincia_id(int provincia_id) {
		this.provincia_id = provincia_id;
	}

	public String getCodi_ine() {
		return codi_ine;
	}

	public void setCodi_ine(String codi_ine) {
		this.codi_ine = codi_ine;
	}

	public String getDescripcio() {
		return descripcio;
	}

	public void setDescripcio(String descripcio) {
		this.descripcio = descripcio;
	}
	
	
}
