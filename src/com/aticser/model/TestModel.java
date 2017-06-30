package com.aticser.model;

import java.sql.Date;

//import org.hibernate.validator.constraints.NotEmpty;

public class TestModel {

//	@NotEmpty(message = "Please enter your name.")
	private String nombre;
	
//	@NotEmpty(message = "Please enter your surname.")
	private String appelido1;
	
	private String appelido2;
	
//	@NotEmpty(message = "Please enter the type of your document.")
	private String documentIdentification;
	
//	@NotEmpty(message = "Please enter your dni.")
	private String dni;
//	@NotEmpty(message = "Please enter your passport.")
	private String passaporte;
	
//	private String dataNacimento;
//	@NotEmpty(message = "Please enter your birth date.")
	private Date dataNacimento;
	
//	@NotEmpty(message = "Please enter the place where you were empadronamded last.")
	private String MunicipalitiDeUltimoEmpadronamento;
	
	private Boolean isBaja;

	public TestModel() {}
	
	public TestModel(String nombre, String appelido1, String appelido2, String documentIdentification, String dni,
			String passaporte, Date dataNacimento, String municipalitiDeUltimoEmpadronamento) {
		super();
		this.nombre = nombre;
		this.appelido1 = appelido1;
		this.appelido2 = appelido2;
		this.documentIdentification = documentIdentification;
		this.dni = dni;
		this.passaporte = passaporte;
		this.dataNacimento = dataNacimento;
		MunicipalitiDeUltimoEmpadronamento = municipalitiDeUltimoEmpadronamento;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getAppelido1() {
		return appelido1;
	}

	public void setAppelido1(String appelido1) {
		this.appelido1 = appelido1;
	}

	public String getAppelido2() {
		return appelido2;
	}

	public void setAppelido2(String appelido2) {
		this.appelido2 = appelido2;
	}

	public String getDocumentIdentification() {
		return documentIdentification;
	}

	public void setDocumentIdentification(String documentIdentification) {
		this.documentIdentification = documentIdentification;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getPassaporte() {
		return passaporte;
	}

	public void setPassaporte(String passaporte) {
		this.passaporte = passaporte;
	}

	public Date getDataNacimento() {
		return dataNacimento;
	}

	public void setDataNacimento(Date dataNacimento) {
		this.dataNacimento = dataNacimento;
	}

	public String getMunicipalitiDeUltimoEmpadronamento() {
		return MunicipalitiDeUltimoEmpadronamento;
	}

	public void setMunicipalitiDeUltimoEmpadronamento(String municipalitiDeUltimoEmpadronamento) {
		MunicipalitiDeUltimoEmpadronamento = municipalitiDeUltimoEmpadronamento;
	}

	public Boolean getIsBaja() {
		return isBaja;
	}

	public void setIsBaja(Boolean isBaja) {
		this.isBaja = isBaja;
	}
	
	
	
}