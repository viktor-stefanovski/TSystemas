package com.aticser.dao;

import java.sql.ResultSet;
import java.util.List;

import com.aticser.model.Campagna;
import com.aticser.model.Ciutada;
import com.aticser.model.CiutadaTest;
import com.aticser.model.User;

public interface CiutadaDAO {

	public ResultSet getDataCiutadano(String idCampagna);

	public List<Ciutada> getDataCiutada();

	public List<Ciutada> getDataCiutadaRep(String idCampagna);

	public Ciutada getCiutada(String hash);

	public Ciutada getCiutadaPdf(String hash);

	// public Ciutada getCiutadaBaja(String hashBaja);

	public void createHashTable(List<Integer> ciutIds, List<String> ciutHash);

	public void createHashTableBaja(List<Integer> ciutIds, List<String> ciutHashBaja);

	public void createHashTablePdf(List<Integer> ciutIds, List<String> ciutHash);

	public void createHashedLinksPdf(List<Integer> ciutIds, List<String> ciutHashedData);

	public void createHashedLinks(List<Integer> ciutIds, List<String> ciutHashedData);

	public void createHashedLinksBaja(List<Integer> ciutIds, List<String> ciutHashedDataBaja);

	public void updateEmailEnviado();

	public void updateHashCreated();

	public void updateEnteredToPlatform(String requestString);

	public void updateIsVerificacion(String hash);

	public void updateIsBaja(String hash);

	public void updateCiutadaVerified(String firstName, String documentId);

	public void updateEncuestado(String hash);

	public List<User> getUsers();

	public List<Campagna> getCampagnas();

	public void updateEncuestaConExito();

	public void tableCampagna(String idCampagna, String nombre, String dateIni, String dateFin, String horaIni,
			String horaFin, String typeCampagna, String comodin, String comment);

	public void updateCiutada(List<CiutadaTest> ciutada);

}
