package com.aticser.model;

//import java.sql.Date;

//import javax.validation.constraints.NotNull;
//import javax.validation.constraints.Past;
//
import org.hibernate.validator.constraints.NotEmpty;
//import org.springframework.format.annotation.DateTimeFormat;

public class CiutadaTest {

	private int ciutada_id;
	@NotEmpty(message = "Please enter your name.")
	private String nom_ciutada;
	@NotEmpty(message = "Please enter your surname.")
	private String primer_cognom_ciutada;
	private String second_cognom_ciutada;
	@NotEmpty(message = "Please enter the type of your document.")
	private String tipus_document_ciutada;
	@NotEmpty(message = "Please enter your id number of the document.")
	private String doc_identificator_ciutada;
	private String genere_ciutada;
	// private Date data_naixament_ciutada;
	/* @DateTimeFormat(pattern="yyyy/mm/dd") */
	// @NotNull @Past
	@NotEmpty(message = "Please enter your birth date.")
	private String data_naixament_ciutada;
	private String email;
	@NotEmpty(message = "Please enter the place where you were empadronamded last.")
	private String municipi_ultim_veinatge_id;
	// private Boolean isBaja = false;
	private String id_Campagna;
	// private String cL;

	private String comodin;

	public CiutadaTest() {
	}

	public CiutadaTest(int ciutada_id, String nom_ciutada, String primer_cognom_ciutada, String second_cognom_ciutada,
			String tipus_document_ciutada, String doc_identificator_ciutada, String genere_ciutada,
			String data_naixament_ciutada, String municipi_ultim_veinatge_id, String comodin) {
		super();
		this.ciutada_id = ciutada_id;
		this.nom_ciutada = nom_ciutada;
		this.primer_cognom_ciutada = primer_cognom_ciutada;
		this.second_cognom_ciutada = second_cognom_ciutada;
		this.tipus_document_ciutada = tipus_document_ciutada;
		this.doc_identificator_ciutada = doc_identificator_ciutada;
		this.genere_ciutada = genere_ciutada;
		this.data_naixament_ciutada = data_naixament_ciutada;
		this.municipi_ultim_veinatge_id = municipi_ultim_veinatge_id;
		this.comodin = comodin;
	}

	// public Ciutada(int ciutada_id, String nom_ciutada, String
	// primer_cognom_ciutada, String second_cognom_ciutada,
	// int tipus_document_ciutada, String doc_identificator_ciutada, String
	// genere_ciutada,
	// String data_naixament_ciutada, String email, String
	// municipi_ultim_veinatge_id, String id_campagne,
	// String hash, String hashPdf) {
	// super();
	// this.ciutada_id = ciutada_id;
	// this.nom_ciutada = nom_ciutada;
	// this.primer_cognom_ciutada = primer_cognom_ciutada;
	// this.second_cognom_ciutada = second_cognom_ciutada;
	// this.tipus_document_ciutada = tipus_document_ciutada;
	// this.doc_identificator_ciutada = doc_identificator_ciutada;
	// this.genere_ciutada = genere_ciutada;
	// this.data_naixament_ciutada = data_naixament_ciutada;
	// this.email = email;
	// this.municipi_ultim_veinatge_id = municipi_ultim_veinatge_id;
	// this.id_campagne = id_campagne;
	// // this.cL = cL;
	// this.hash = hash;
	// this.hashPdf = hashPdf;
	// }

	public int getCiutada_id() {
		return ciutada_id;
	}

	public void setCiutada_id(int ciutada_id) {
		this.ciutada_id = ciutada_id;
	}

	public String getNom_ciutada() {
		return nom_ciutada;
	}

	public void setNom_ciutada(String nom_ciutada) {
		this.nom_ciutada = nom_ciutada;
	}

	public String getPrimer_cognom_ciutada() {
		return primer_cognom_ciutada;
	}

	public void setPrimer_cognom_ciutada(String primer_cognom_ciutada) {
		this.primer_cognom_ciutada = primer_cognom_ciutada;
	}

	public String getSecond_cognom_ciutada() {
		return second_cognom_ciutada;
	}

	public void setSecond_cognom_ciutada(String second_cognom_ciutada) {
		this.second_cognom_ciutada = second_cognom_ciutada;
	}

	public String getTipus_document_ciutada() {
		return tipus_document_ciutada;
	}

	public void setTipus_document_ciutada(String tipus_document_ciutada) {
		this.tipus_document_ciutada = tipus_document_ciutada;
	}

	public String getDoc_identificator_ciutada() {
		return doc_identificator_ciutada;
	}

	public void setDoc_identificator_ciutada(String doc_identificator_ciutada) {
		this.doc_identificator_ciutada = doc_identificator_ciutada;
	}

	public String getGenere_ciutada() {
		return genere_ciutada;
	}

	public void setGenere_ciutada(String genere_ciutada) {
		this.genere_ciutada = genere_ciutada;
	}

	public String getData_naixament_ciutada() {
		return data_naixament_ciutada;
	}

	public void setData_naixament_ciutada(String data_naixament_ciutada) {
		this.data_naixament_ciutada = data_naixament_ciutada;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMunicipi_ultim_veinatge_id() {
		return municipi_ultim_veinatge_id;
	}

	public void setMunicipi_ultim_veinatge_id(String municipi_ultim_veinatge_id) {
		this.municipi_ultim_veinatge_id = municipi_ultim_veinatge_id;
	}

	public String getIdCampagna() {
		return id_Campagna;
	}

	public void setIdCampagna(String id_campagne) {
		this.id_Campagna = id_campagne;
	}

	// public String getcL() {
	// return cL;
	// }
	//
	// public void setcL(String cL) {
	// this.cL = cL;
	// }

	// public Boolean getIsBaja() {
	// return isBaja;
	// }
	//
	// public void setIsBaja(Boolean isBaja) {
	// this.isBaja = isBaja;
	// }

	// public String getHashBaja() {
	// return hashBaja;
	// }
	//
	// public void setHashBaja(String hashBaja) {
	// this.hashBaja = hashBaja;
	// }

	public String getId_Campagna() {
		return id_Campagna;
	}

	public void setId_Campagna(String id_Campagna) {
		this.id_Campagna = id_Campagna;
	}

	public String getComodin() {
		return comodin;
	}

	public void setComodin(String comodin) {
		this.comodin = comodin;
	}

	@Override
	public String toString() {
		return "Ciutada [nom_ciutada=" + nom_ciutada + ", primer_cognom_ciutada=" + primer_cognom_ciutada
				+ ", second_cognom_ciutada=" + second_cognom_ciutada + ", tipus_document_ciutada="
				+ tipus_document_ciutada + ", doc_identificator_ciutada=" + doc_identificator_ciutada
				+ ", genere_ciutada=" + genere_ciutada + ", data_naixament_ciutada=" + data_naixament_ciutada
				+ ", email=" + email + ", municipi_ultim_veinatge_id=" + municipi_ultim_veinatge_id + ", id_Campagna="
				+ id_Campagna + "]";
	}

}
