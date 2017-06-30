package com.aticser.dao;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.aticser.model.Campagna;
import com.aticser.model.Ciutada;
import com.aticser.model.CiutadaTest;
import com.aticser.model.User;
import com.aticser.util.Utils;

public class CiutadaDAOImpl implements CiutadaDAO {

	private JdbcTemplate jdbcTemplate;

	public CiutadaDAOImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Ciutada> getDataCiutada() {

		String sql = "SELECT * FROM tblciutadano";

		// String sql = "SELECT
		// `CIUTADA_ID`,`NOM_CIUTADA`,`PRIMER_COGNOM_CIUTADA`,`SEGON_COGNOM_CIUTADA`,`TIPUS_DOCUMENT_CIUTADA_ID`,`DOC_IDENTIFICADOR_CIUTADA`,`DATA_NAIXEMENT_CIUTADA`,`MUNICIPI_ULTIM_VEINATGE_ID`,`ID_CAMPAGNA`,`HASH`,`HASHPDF`
		// FROM `tblciutadano`";
		List<Ciutada> listCiutadanos = jdbcTemplate.query("SELECT * FROM tblciutadano", new RowMapper<Ciutada>() {

			@Override
			public Ciutada mapRow(ResultSet rs, int rowNum) throws SQLException {
				Ciutada anCiutadano = new Ciutada();

				anCiutadano.setCiutada_id(rs.getInt("CIUTADA_ID"));
				anCiutadano.setNom_ciutada(rs.getString("NOM_CIUTADA"));
				anCiutadano.setPrimer_cognom_ciutada(rs.getString("PRIMER_COGNOM_CIUTADA"));
				anCiutadano.setSecond_cognom_ciutada(rs.getString("SEGON_COGNOM_CIUTADA"));
				anCiutadano.setTipus_document_ciutada(rs.getInt("TIPUS_DOCUMENT_CIUTADA_ID"));
				anCiutadano.setDoc_identificator_ciutada(rs.getString("DOC_IDENTIFICADOR_CIUTADA"));
				anCiutadano.setGenere_ciutada(rs.getString("GENERE_CIUTADA"));
				anCiutadano.setData_naixament_ciutada(rs.getString("DATA_NAIXEMENT_CIUTADA"));
				anCiutadano.setGenere_ciutada(rs.getString("GENERE_CIUTADA"));
				anCiutadano.setEmail(rs.getString("EMAIL"));
				anCiutadano.setMunicipi_ultim_veinatge_id(rs.getString("MUNICIPI_ULTIM_VEINATGE_ID"));
				anCiutadano.setIdCampagna(rs.getString("ID_CAMPAGNA"));
				anCiutadano.setHash(rs.getString("HASH"));
				anCiutadano.setHashPdf(rs.getString("HASHPDF"));
				return anCiutadano;
			}

		});

		return listCiutadanos;
	}

	@Override
	public ResultSet getDataCiutadano(String idCampagna) {

		Connection conn = null;

		Ciutada anCiutada = new Ciutada();

		String sql = "SELECT * FROM tblciutadano WHERE ID_CAMPAGNA=?";

		try {
			conn = jdbcTemplate.getDataSource().getConnection();

			PreparedStatement ptstm = conn.prepareStatement(sql);

			ptstm.setString(1, idCampagna);

			ResultSet rs = ptstm.executeQuery();

			ptstm.close();
			rs.close();

			return rs;

		} catch (SQLException e) {
			throw new RuntimeException(e);

		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	@Override
	public List<Ciutada> getDataCiutadaRep(String idCampagna) {

		String sql = "SELECT * FROM tblciutadano WHERE ID_CAMPAGNA=?";

		List<Ciutada> listCiutadanos = jdbcTemplate.query(sql, new Object[] { idCampagna }, new RowMapper<Ciutada>() {

			@Override
			public Ciutada mapRow(ResultSet rs, int rowNum) throws SQLException {
				Ciutada anCiutadano = new Ciutada();

				anCiutadano.setCiutada_id(rs.getInt("CIUTADA_ID"));
				anCiutadano.setIdCampagna(rs.getString("ID_CAMPAGNA"));
				anCiutadano.setHashGenerado(rs.getInt("HASHGENERADO"));
				anCiutadano.setMailEnviado(rs.getInt("MAILENVIADO"));
				anCiutadano.setEntrado(rs.getInt("ENTRADO"));
				anCiutadano.setIsValidacion(rs.getInt("ISVALIDACION"));
				anCiutadano.setIsBaja(rs.getInt("ISBAJA"));
				anCiutadano.setVerificado(rs.getInt("VERIFICADO"));
				anCiutadano.setEncuestado(rs.getInt("ENCUESTADO"));
				anCiutadano.setEncuestadoConExito(rs.getInt("ECNUESTACONEXITO"));
				anCiutadano.setNom_ciutada(rs.getString("NOM_CIUTADA"));
				anCiutadano.setPrimer_cognom_ciutada(rs.getString("PRIMER_COGNOM_CIUTADA"));
				anCiutadano.setEmail(rs.getString("EMAIL"));
				anCiutadano.setHashLink(rs.getString("LINK_HASH"));
				anCiutadano.setHashLinkPdf(rs.getString("LINK_HASH_PDF"));
				return anCiutadano;
			}

		});

		return listCiutadanos;
	}

	@Override
	public void createHashedLinks(List<Integer> ciutIds, List<String> ciutHashedData) {

		Connection conn = null;

		String query = "CREATE TABLE IF NOT EXISTS `tblhashlink` (" + "`CIUT_ID` int(11) NOT NULL, "
				+ "`HASH` varchar(255) NOT NULL " + ")";

		String insertQuery = "INSERT INTO tblhashlink Values(?,?)";

		String sql = "UPDATE " + " tblciutadano a " + " INNER JOIN tblhashlink b ON a.CIUTADA_ID = b.CIUT_ID "
				+ " SET a.LINK_HASH = b.HASH" + " WHERE a.LINK_HASH =''";

		// String sql = "UPDATE tableA, tableB
		// SET tableA.columnToBeUpdated = tableB.columnSourceOfData
		// WHERE tableA.id = tableB.idOfTableA

		try {
			conn = jdbcTemplate.getDataSource().getConnection();

			Statement stm = conn.createStatement();

			// stm.execute(query);

			PreparedStatement ptstm = conn.prepareStatement(insertQuery);
			for (int i = 0; i < ciutIds.size(); i++) {
				ptstm.setInt(1, ciutIds.get(i));
				ptstm.setString(2, ciutHashedData.get(i));
				ptstm.executeUpdate();
			}

			stm.execute(sql);

			// conn = dataSource.getConnection();
			// PreparedStatement ps = conn.prepareStatement(sql);
			////
			// for (int i = 0; i < ciutHashedData.size(); i++) {
			// ps.setString(1, ciutHashedData.get(i));
			// ps.executeUpdate();
			// System.out.println("New entry in the database");
			// }
			ptstm.close();
			stm.close();
			// ps.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);

		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	@Override
	public void createHashedLinksBaja(List<Integer> ciutIds, List<String> ciutHashedData) {

		Connection conn = null;

		String query = "CREATE TABLE IF NOT EXISTS `tblhashlinkbaja` (" + "`CIUT_ID` int(11) NOT NULL, "
				+ "`HASH` varchar(255) NOT NULL " + ")";

		String insertQuery = "INSERT INTO tblhashlinkbaja Values(?,?)";

		String sql = "UPDATE " + " tblciutadano a " + " INNER JOIN tblhashlinkbaja b ON a.CIUTADA_ID = b.CIUT_ID "
				+ " SET a.LINK_HASH_BAJA = b.HASH" + " WHERE a.LINK_HASH_BAJA =''";

		// String sql = "UPDATE tableA, tableB
		// SET tableA.columnToBeUpdated = tableB.columnSourceOfData
		// WHERE tableA.id = tableB.idOfTableA

		try {
			conn = jdbcTemplate.getDataSource().getConnection();

			Statement stm = conn.createStatement();

			// stm.execute(query);

			PreparedStatement ptstm = conn.prepareStatement(insertQuery);
			for (int i = 0; i < ciutIds.size(); i++) {
				ptstm.setInt(1, ciutIds.get(i));
				ptstm.setString(2, ciutHashedData.get(i));
				ptstm.executeUpdate();
			}

			stm.execute(sql);

			// conn = dataSource.getConnection();
			// PreparedStatement ps = conn.prepareStatement(sql);
			////
			// for (int i = 0; i < ciutHashedData.size(); i++) {
			// ps.setString(1, ciutHashedData.get(i));
			// ps.executeUpdate();
			// System.out.println("New entry in the database");
			// }
			ptstm.close();
			stm.close();
			// ps.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);

		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	@Override
	public void createHashedLinksPdf(List<Integer> ciutIds, List<String> ciutHashedData) {

		Connection conn = null;

		String query = "CREATE TABLE IF NOT EXISTS `tblhashlinkpdf` (" + "`CIUT_ID` int(11) NOT NULL, "
				+ "`HASH` varchar(255) NOT NULL " + ")";

		String insertQuery = "INSERT INTO tblhashlinkpdf Values(?,?)";

		String sql = "UPDATE " + " tblciutadano a " + " INNER JOIN tblhashlinkpdf b ON a.CIUTADA_ID = b.CIUT_ID "
				+ " SET a.LINK_HASH_PDF = b.HASH" + " WHERE a.LINK_HASH_PDF =''";

		// String sql = "UPDATE tableA, tableB
		// SET tableA.columnToBeUpdated = tableB.columnSourceOfData
		// WHERE tableA.id = tableB.idOfTableA

		try {
			conn = jdbcTemplate.getDataSource().getConnection();

			Statement stm = conn.createStatement();

			// stm.execute(query);

			PreparedStatement ptstm = conn.prepareStatement(insertQuery);
			for (int i = 0; i < ciutIds.size(); i++) {
				ptstm.setInt(1, ciutIds.get(i));
				ptstm.setString(2, ciutHashedData.get(i));
				ptstm.executeUpdate();
			}

			stm.execute(sql);

			// conn = dataSource.getConnection();
			// PreparedStatement ps = conn.prepareStatement(sql);
			////
			// for (int i = 0; i < ciutHashedData.size(); i++) {
			// ps.setString(1, ciutHashedData.get(i));
			// ps.executeUpdate();
			// System.out.println("New entry in the database");
			// }
			ptstm.close();
			stm.close();
			// ps.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);

		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	@Override
	public void createHashTable(List<Integer> ciutIds, List<String> ciutHash) {

		Connection conn = null;

		String query = "CREATE TABLE IF NOT EXISTS `tblhash` (" + "`CIUT_ID` int(11) NOT NULL, "
				+ "`HASH` varchar(255) NOT NULL " + ")";

		String insertQuery = "INSERT INTO tblhash Values(?,?)";

		String sql = "UPDATE " + " tblciutadano a " + " INNER JOIN tblhash b ON a.CIUTADA_ID = b.CIUT_ID "
				+ " SET a.HASH = b.HASH" + " WHERE a.HASH =''";

		// String sql = "UPDATE tableA, tableB
		// SET tableA.columnToBeUpdated = tableB.columnSourceOfData
		// WHERE tableA.id = tableB.idOfTableA

		// String sql = " Update tblciutadano SET LINK_HASH = ?";
		// + " values (?)";

		try {
			conn = jdbcTemplate.getDataSource().getConnection();

			Statement stm = conn.createStatement();

			stm.execute(query);

			PreparedStatement ptstm = conn.prepareStatement(insertQuery);
			for (int i = 0; i < ciutIds.size(); i++) {
				ptstm.setInt(1, ciutIds.get(i));
				ptstm.setString(2, ciutHash.get(i));
				ptstm.executeUpdate();
			}

			stm.execute(sql);

			// conn = dataSource.getConnection();
			// PreparedStatement ps = conn.prepareStatement(sql);
			////
			// for (int i = 0; i < ciutHashedData.size(); i++) {
			// ps.setString(1, ciutHashedData.get(i));
			// ps.executeUpdate();
			// System.out.println("New entry in the database");
			// }
			ptstm.close();
			stm.close();
			// ps.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);

		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	@Override
	public void createHashTableBaja(List<Integer> ciutIds, List<String> ciutHash) {

		Connection conn = null;

		String query = "CREATE TABLE IF NOT EXISTS `tblhashbaja` (" + "`CIUT_ID` int(11) NOT NULL, "
				+ "`HASH` varchar(255) NOT NULL " + ")";

		String insertQuery = "INSERT INTO tblhashbaja Values(?,?)";

		String sql = "UPDATE " + " tblciutadano a " + " INNER JOIN tblhashbaja b ON a.CIUTADA_ID = b.CIUT_ID "
				+ " SET a.HASHBAJA = b.HASH" + " WHERE a.HASHBAJA =''";

		// String sql = "UPDATE tableA, tableB
		// SET tableA.columnToBeUpdated = tableB.columnSourceOfData
		// WHERE tableA.id = tableB.idOfTableA

		// String sql = " Update tblciutadano SET LINK_HASH = ?";
		// + " values (?)";

		try {
			conn = jdbcTemplate.getDataSource().getConnection();

			Statement stm = conn.createStatement();

			stm.execute(query);

			PreparedStatement ptstm = conn.prepareStatement(insertQuery);
			for (int i = 0; i < ciutIds.size(); i++) {
				ptstm.setInt(1, ciutIds.get(i));
				ptstm.setString(2, ciutHash.get(i));
				ptstm.executeUpdate();
			}

			stm.execute(sql);

			// conn = dataSource.getConnection();
			// PreparedStatement ps = conn.prepareStatement(sql);
			////
			// for (int i = 0; i < ciutHashedData.size(); i++) {
			// ps.setString(1, ciutHashedData.get(i));
			// ps.executeUpdate();
			// System.out.println("New entry in the database");
			// }
			ptstm.close();
			stm.close();
			// ps.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);

		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	@Override
	public void createHashTablePdf(List<Integer> ciutIds, List<String> ciutHash) {

		Connection conn = null;

		String query = "CREATE TABLE IF NOT EXISTS `tblhashpdf` (" + "`CIUT_ID` int(11) NOT NULL, "
				+ "`HASH` varchar(255) NOT NULL " + ")";

		String insertQuery = "INSERT INTO tblhashpdf Values(?,?)";

		String sql = "UPDATE " + " tblciutadano a " + " INNER JOIN tblhashPdf b ON a.CIUTADA_ID = b.CIUT_ID "
				+ " SET a.HASHPDF = b.HASH" + " WHERE a.HASHPDF =''";

		// String sql = "UPDATE tableA, tableB
		// SET tableA.columnToBeUpdated = tableB.columnSourceOfData
		// WHERE tableA.id = tableB.idOfTableA

		// String sql = " Update tblciutadano SET LINK_HASH = ?";
		// + " values (?)";

		try {
			conn = jdbcTemplate.getDataSource().getConnection();

			Statement stm = conn.createStatement();

			stm.execute(query);

			PreparedStatement ptstm = conn.prepareStatement(insertQuery);
			for (int i = 0; i < ciutIds.size(); i++) {
				ptstm.setInt(1, ciutIds.get(i));
				ptstm.setString(2, ciutHash.get(i));
				ptstm.executeUpdate();
			}

			stm.execute(sql);

			// conn = dataSource.getConnection();
			// PreparedStatement ps = conn.prepareStatement(sql);
			////
			// for (int i = 0; i < ciutHashedData.size(); i++) {
			// ps.setString(1, ciutHashedData.get(i));
			// ps.executeUpdate();
			// System.out.println("New entry in the database");
			// }
			ptstm.close();
			stm.close();
			// ps.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);

		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	@Override
	public void updateEnteredToPlatform(String requestString) {

		Connection conn = null;

		String sql = "UPDATE tblciutadano SET ENTRADO = 1 WHERE HASH = ?";

		try {
			conn = jdbcTemplate.getDataSource().getConnection();

			PreparedStatement ptstm = conn.prepareStatement(sql);

			ptstm.setString(1, requestString);
			ptstm.executeUpdate();

			System.out.println("Prepared statement EXECUTED");

			ptstm.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);

		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	@Override
	public void updateCiutadaVerified(String firstName, String documentId) {

		Connection conn = null;

		String sql = "UPDATE tblciutadano SET VERIFICADO = 1 WHERE NOM_CIUTADA = ? AND DOC_IDENTIFICADOR_CIUTADA = ?";

		try {
			conn = jdbcTemplate.getDataSource().getConnection();

			PreparedStatement ptstm = conn.prepareStatement(sql);

			ptstm.setString(1, firstName.toLowerCase());
			ptstm.setString(2, documentId.toLowerCase());
			ptstm.executeUpdate();

			ptstm.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);

		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	@Override
	public Ciutada getCiutada(String hash) {

		Connection conn = null;

		Ciutada anCiutada = new Ciutada();

		String sql = "SELECT * FROM tblciutadano WHERE HASH=?";

		try {
			conn = jdbcTemplate.getDataSource().getConnection();

			PreparedStatement ptstm = conn.prepareStatement(sql);

			ptstm.setString(1, hash);

			ResultSet rs = ptstm.executeQuery();

			if (rs.next()) {

				anCiutada.setCiutada_id(rs.getInt("CIUTADA_ID"));
				anCiutada.setNom_ciutada(rs.getString("NOM_CIUTADA"));
				anCiutada.setPrimer_cognom_ciutada(rs.getString("PRIMER_COGNOM_CIUTADA"));
				anCiutada.setSecond_cognom_ciutada(rs.getString("SEGON_COGNOM_CIUTADA"));
				anCiutada.setTipus_document_ciutada(rs.getInt("TIPUS_DOCUMENT_CIUTADA_ID"));
				anCiutada.setDoc_identificator_ciutada(rs.getString("DOC_IDENTIFICADOR_CIUTADA"));
				anCiutada.setGenere_ciutada(rs.getString("GENERE_CIUTADA"));
				anCiutada.setEmail(rs.getString("EMAIL"));
				anCiutada.setMunicipi_ultim_veinatge_id(rs.getString("MUNICIPI_ULTIM_VEINATGE_ID"));
				anCiutada.setIdCampagna(rs.getString("ID_CAMPAGNA"));
				anCiutada.setData_naixament_ciutada(rs.getString("DATA_NAIXEMENT_CIUTADA"));
				// anCiutada.setcL(rs.getString("CL"));
				anCiutada.setHash(rs.getString("HASH"));
				// anCiutada.setHashPdf(rs.getString("HASHPDF"));
				// anCiutadano.setData_naixament_ciutada(rs.getString("DATA_NAIXEMENT_CIUTADA"));
				// anCiutadano.setData_naixament_ciutada(rs.getString("DATA_NAIXEMENT_CIUTADA"));
				// anCiutadano.setData_naixament_ciutada(rs.getString("DATA_NAIXEMENT_CIUTADA"));
				// anCiutadano.setData_naixament_ciutada(rs.getString("DATA_NAIXEMENT_CIUTADA"));

			}

			ptstm.close();
			rs.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);

		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}

		return anCiutada;
	}

	@Override
	public Ciutada getCiutadaPdf(String hash) {

		Connection conn = null;

		Ciutada anCiutada = new Ciutada();

		String sql = "SELECT * FROM tblciutadano WHERE HASHPDF=?";

		try {
			conn = jdbcTemplate.getDataSource().getConnection();

			PreparedStatement ptstm = conn.prepareStatement(sql);

			ptstm.setString(1, hash);

			ResultSet rs = ptstm.executeQuery();

			if (rs.next()) {

				anCiutada.setCiutada_id(rs.getInt("CIUTADA_ID"));
				anCiutada.setNom_ciutada(rs.getString("NOM_CIUTADA"));
				anCiutada.setPrimer_cognom_ciutada(rs.getString("PRIMER_COGNOM_CIUTADA"));
				anCiutada.setSecond_cognom_ciutada(rs.getString("SEGON_COGNOM_CIUTADA"));
				anCiutada.setTipus_document_ciutada(rs.getInt("TIPUS_DOCUMENT_CIUTADA_ID"));
				anCiutada.setDoc_identificator_ciutada(rs.getString("DOC_IDENTIFICADOR_CIUTADA"));
				anCiutada.setGenere_ciutada(rs.getString("GENERE_CIUTADA"));
				anCiutada.setEmail(rs.getString("EMAIL"));
				anCiutada.setMunicipi_ultim_veinatge_id(rs.getString("MUNICIPI_ULTIM_VEINATGE_ID"));
				anCiutada.setIdCampagna(rs.getString("ID_CAMPAGNA"));
				anCiutada.setData_naixament_ciutada(rs.getString("DATA_NAIXEMENT_CIUTADA"));
				// anCiutada.setcL(rs.getString("CL"));
				// anCiutada.setHash(rs.getString("HASH"));
				anCiutada.setHashPdf(rs.getString("HASHPDF"));
				// anCiutadano.setData_naixament_ciutada(rs.getString("DATA_NAIXEMENT_CIUTADA"));
				// anCiutadano.setData_naixament_ciutada(rs.getString("DATA_NAIXEMENT_CIUTADA"));
				// anCiutadano.setData_naixament_ciutada(rs.getString("DATA_NAIXEMENT_CIUTADA"));
				// anCiutadano.setData_naixament_ciutada(rs.getString("DATA_NAIXEMENT_CIUTADA"));
				// anCiutadano.setData_naixament_ciutada(rs.getString("DATA_NAIXEMENT_CIUTADA"));

			}

			ptstm.close();
			rs.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);

		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}

		return anCiutada;
	}

	/*
	 * @Override public Ciutada getCiutadaBaja(String hashBaja) {
	 * 
	 * Connection conn = null;
	 * 
	 * Ciutada anCiutada = new Ciutada();
	 * 
	 * String sql = "SELECT * FROM tblciutadano WHERE HASHBAJA=?";
	 * 
	 * try { conn = jdbcTemplate.getDataSource().getConnection();
	 * 
	 * PreparedStatement ptstm = conn.prepareStatement(sql);
	 * 
	 * ptstm.setString(1, hashBaja);
	 * 
	 * 
	 * ResultSet rs = ptstm.executeQuery();
	 * 
	 * if (rs.next()) {
	 * 
	 * anCiutada.setCiutada_id(rs.getInt("CIUTADA_ID"));
	 * anCiutada.setNom_ciutada(rs.getString("NOM_CIUTADA"));
	 * anCiutada.setPrimer_cognom_ciutada(rs.getString("PRIMER_COGNOM_CIUTADA"))
	 * ;
	 * anCiutada.setSecond_cognom_ciutada(rs.getString("SEGON_COGNOM_CIUTADA"));
	 * anCiutada.setTipus_document_ciutada(rs.getInt("TIPUS_DOCUMENT_CIUTADA_ID"
	 * )); anCiutada.setDoc_identificator_ciutada(rs.getString(
	 * "DOC_IDENTIFICADOR_CIUTADA"));
	 * anCiutada.setGenere_ciutada(rs.getString("GENERE_CIUTADA"));
	 * anCiutada.setEmail(rs.getString("EMAIL"));
	 * anCiutada.setMunicipi_ultim_veinatge_id(rs.getString(
	 * "MUNICIPI_ULTIM_VEINATGE_ID"));
	 * anCiutada.setId_campagne(rs.getString("ID_CAMPAGNA"));
	 * anCiutada.setData_naixament_ciutada(rs.getString("DATA_NAIXEMENT_CIUTADA"
	 * )); anCiutada.setcL(rs.getString("CL"));
	 * anCiutada.setHash(rs.getString("HASH"));
	 * anCiutada.setHashPdf(rs.getString("HASHPDF")); //
	 * anCiutadano.setData_naixament_ciutada(rs.getString(
	 * "DATA_NAIXEMENT_CIUTADA")); //
	 * anCiutadano.setData_naixament_ciutada(rs.getString(
	 * "DATA_NAIXEMENT_CIUTADA")); //
	 * anCiutadano.setData_naixament_ciutada(rs.getString(
	 * "DATA_NAIXEMENT_CIUTADA")); //
	 * anCiutadano.setData_naixament_ciutada(rs.getString(
	 * "DATA_NAIXEMENT_CIUTADA")); //
	 * anCiutadano.setData_naixament_ciutada(rs.getString(
	 * "DATA_NAIXEMENT_CIUTADA"));
	 * 
	 * }
	 * 
	 * 
	 * 
	 * ptstm.close(); rs.close();
	 * 
	 * } catch (SQLException e) { throw new RuntimeException(e);
	 * 
	 * } finally { if (conn != null) { try { conn.close(); } catch (SQLException
	 * e) {} } }
	 * 
	 * return anCiutada; }
	 */

	@Override
	public void updateEncuestado(String hash) {

		Connection conn = null;

		String sql = "UPDATE tblciutadano SET ENCUESTADO = 1 WHERE HASH = ?";

		try {
			conn = jdbcTemplate.getDataSource().getConnection();

			PreparedStatement ptstm = conn.prepareStatement(sql);

			ptstm.setString(1, hash.toLowerCase());
			ptstm.executeUpdate();

			ptstm.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);

		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	@Override
	public void updateEmailEnviado() {

		Connection conn = null;

		String sql = "UPDATE tblciutadano SET MAILENVIADO = 1 WHERE EMAIL != ''";

		try {
			conn = jdbcTemplate.getDataSource().getConnection();

			Statement stm = conn.createStatement();

			stm.execute(sql);

			stm.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);

		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	@Override
	public void updateHashCreated() {

		Connection conn = null;

		String sql = " Update tblciutadano SET HASHGENERADO = 1 WHERE LINK_HASH != ''";

		try {
			conn = jdbcTemplate.getDataSource().getConnection();

			Statement stm = conn.createStatement();

			stm.execute(sql);

			stm.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);

		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	@Override
	public void updateIsVerificacion(String hash) {

		Connection conn = null;

		String sql = "UPDATE tblciutadano SET ISVALIDACION = 1 WHERE HASH = ?";

		try {
			conn = jdbcTemplate.getDataSource().getConnection();

			PreparedStatement ptstm = conn.prepareStatement(sql);

			ptstm.setString(1, hash.toLowerCase());
			ptstm.executeUpdate();

			ptstm.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);

		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	@Override
	public void updateIsBaja(String hash) {

		Connection conn = null;

		Ciutada anCiutada = new Ciutada();

		anCiutada = getCiutada(hash);

		// int ciutID = anCiutadano.getCiutada_id();
		// String ciutIDStr = String.valueOf(ciutID);
		String nom = anCiutada.getNom_ciutada();
		String cognom1 = anCiutada.getPrimer_cognom_ciutada();
		String cognom2 = anCiutada.getSecond_cognom_ciutada();
		// int typDoc = anCiutadano.getTipus_document_ciutada();
		// String typDocStr = String.valueOf(typDoc);
		String docNum = anCiutada.getDoc_identificator_ciutada();
		String gender = anCiutada.getGenere_ciutada();
		String dataNaix = anCiutada.getData_naixament_ciutada();
		String email = anCiutada.getEmail();
		String municip = anCiutada.getMunicipi_ultim_veinatge_id();

		try {
			// String hashedCiutID = Utils.getHashString(ciutIDStr);
			// System.out.println("hash ciut id " + hashedCiutID);
			String hashedNom = Utils.getHashString(nom);
			String hashedCognom1 = Utils.getHashString(cognom1);
			// String hashedCognom2 = Utils.getHashString(cognom2);
			// String hashedTypeDoc = Utils.getHashString(typDocStr);
			String hashedNumDoc = Utils.getHashString(docNum);
			String hashedGender = Utils.getHashString(gender);
			String hashedDataNaix = Utils.getHashString(dataNaix);
			String hashedemail = Utils.getHashString(email);
			String hashedMunicip = Utils.getHashString(municip);

			// String sql = "UPDATE tblciutadano SET ISBAJA = 1, SET NOM_CIUTADA
			// = ?, SET PRIMER_COGNOM_CIUTADA = ?,SET SEGON_COGNOM_CIUTADA =
			// ?,SET DOC_IDENTIFICADOR_CIUTADA = ?,SET EMAIL = ?, SET
			// MUNICIPI_ULTIM_VEINATGE_ID = ? WHERE HASH = ?";

			// String sqlBaja = "UPDATE tblciutadano SET ISBAJA = 1 AND SET
			// TIPUS_DOCUMENT_CIUTADA_ID = 0 AND SET GENERE_CIUTADA = 'X' AND
			// SET DATA_NAIXEMENT_CIUTADA = '0000-00-00' WHERE HASH = ?";

			String sqlBaja = "UPDATE tblciutadano SET ISBAJA = 1 WHERE HASH = ?";

			String sqlTypDoc = "UPDATE tblciutadano  SET TIPUS_DOCUMENT_CIUTADA_ID = 0 WHERE HASH = ?";

			String sqlGenre = "UPDATE tblciutadano  SET GENERE_CIUTADA = 'X' WHERE HASH = ?";

			String sqlDataNaix = "UPDATE tblciutadano  SET DATA_NAIXEMENT_CIUTADA = '1999-01-01' WHERE HASH = ?";

			String sqlNom = "UPDATE tblciutadano SET NOM_CIUTADA = ? WHERE HASH = ?";

			String sqlCognom1 = "UPDATE tblciutadano SET PRIMER_COGNOM_CIUTADA = ? WHERE HASH = ?";

			// String sqlCognom2 = "UPDATE tblciutadano SET SEGON_COGNOM_CIUTADA
			// = ? WHERE HASH = ?";

			String sqlDoc = "UPDATE tblciutadano SET DOC_IDENTIFICADOR_CIUTADA = ? WHERE HASH = ?";

			String sqlEmail = "UPDATE tblciutadano SET EMAIL = ? WHERE HASH = ?";

			String sqlMunicipi = "UPDATE tblciutadano SET MUNICIPI_ULTIM_VEINATGE_ID = ? WHERE HASH = ?";

			try {
				conn = jdbcTemplate.getDataSource().getConnection();

				PreparedStatement ptstmBaja = conn.prepareStatement(sqlBaja);

				PreparedStatement ptstmTypDoc = conn.prepareStatement(sqlTypDoc);

				PreparedStatement ptstmGenre = conn.prepareStatement(sqlGenre);

				PreparedStatement ptstmDataNaix = conn.prepareStatement(sqlDataNaix);

				PreparedStatement ptstmNom = conn.prepareStatement(sqlNom);

				PreparedStatement ptstmCognom1 = conn.prepareStatement(sqlCognom1);

				// PreparedStatement ptstmCognom2 =
				// conn.prepareStatement(sqlCognom2);

				PreparedStatement ptstmDoc = conn.prepareStatement(sqlDoc);

				PreparedStatement ptstmEmail = conn.prepareStatement(sqlEmail);

				PreparedStatement ptstmMunic = conn.prepareStatement(sqlMunicipi);

				// ptstm.setString(1, hashedNom.toLowerCase());
				// ptstm.setString(2, hashedCognom1.toLowerCase());
				// ptstm.setString(3, hashedCognom2.toLowerCase());
				// ptstm.setString(4, hashedNumDoc.toLowerCase());
				// ptstm.setString(5, hashedemail.toLowerCase());
				// ptstm.setString(6, hashedMunicip.toLowerCase());
				// ptstm.setString(7, hash.toLowerCase());

				ptstmBaja.setString(1, hash.toLowerCase());

				ptstmTypDoc.setString(1, hash.toLowerCase());

				ptstmGenre.setString(1, hash.toLowerCase());

				ptstmDataNaix.setString(1, hash.toLowerCase());

				ptstmNom.setString(1, hashedNom.toLowerCase());
				ptstmNom.setString(2, hash.toLowerCase());

				ptstmCognom1.setString(1, hashedCognom1.toLowerCase());
				ptstmCognom1.setString(2, hash.toLowerCase());

				// ptstmCognom2.setString(1, hashedCognom2.toLowerCase());
				// ptstmCognom2.setString(2, hash.toLowerCase());

				ptstmDoc.setString(1, hashedNumDoc.toLowerCase());
				ptstmDoc.setString(2, hash.toLowerCase());

				ptstmEmail.setString(1, hashedemail.toLowerCase());
				ptstmEmail.setString(2, hash.toLowerCase());

				ptstmMunic.setString(1, hashedMunicip.toLowerCase());
				ptstmMunic.setString(2, hash.toLowerCase());

				// ptstm.setString(8, hashedMunicip.toLowerCase());
				// ptstm.setString(9, hash.toLowerCase());
				// ptstm.setString(10, hashedMunicip.toLowerCase());
				// ptstm.setString(11, hash.toLowerCase());

				ptstmBaja.executeUpdate();
				ptstmTypDoc.executeUpdate();
				ptstmGenre.executeUpdate();
				ptstmDataNaix.executeUpdate();
				ptstmNom.executeUpdate();
				ptstmCognom1.executeUpdate();
				// ptstmCognom2.executeUpdate();
				ptstmDoc.executeUpdate();
				ptstmEmail.executeUpdate();
				ptstmMunic.executeUpdate();

				ptstmBaja.close();
				ptstmNom.close();
				ptstmCognom1.close();
				// ptstmCognom2.close();
				ptstmDoc.close();
				ptstmEmail.close();
				ptstmMunic.close();

			} catch (SQLException e) {
				throw new RuntimeException(e);

			} finally {
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
					}
				}
			}

		} catch (NoSuchAlgorithmException e1) {
			e1.printStackTrace();
		}

	}

	@Override
	public List<User> getUsers() {

		String sql = "SELECT * FROM tbluser";
		List<User> listUsers = jdbcTemplate.query(sql, new RowMapper<User>() {

			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();

				user.setUsername(rs.getString("USERNAME"));
				user.setPassword(rs.getString("PASSWORD"));

				return user;
			}

		});

		return listUsers;
	}

	@Override
	public void updateEncuestaConExito() {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Campagna> getCampagnas() {

		List<Campagna> campagnas = new ArrayList<>();

		campagnas = jdbcTemplate.query("SELECT DISTINCT ID_CAMPAGNA FROM tblciutadano", new RowMapper<Campagna>() {

			@Override
			public Campagna mapRow(ResultSet rs, int rowNum) throws SQLException {
				Campagna campagna = new Campagna();

				campagna.setIdCampagna(rs.getString("ID_CAMPAGNA"));

				return campagna;
			}

		});

		return campagnas;
	}

	@Override
	public void tableCampagna(String idCampagna, String nombre, String dateIni, String dateFin, String horaIni,
			String horaFin, String typeCampagna, String comodin, String comment) {
		// TODO Auto-generated method stub

		Connection conn = null;

		String query = "CREATE TABLE IF NOT EXISTS `tblCampagna` (" + "`IDCAMPAGNA` varchar(255) NOT NULL, "
				+ "`NOMBRE` varchar(255) NOT NULL, " + "`DATAINICI` DATE NOT NULL, " + "`DATAFIN` DATE NOT NULL, "
				+ "`HORAINICI` Time  NOT NULL, " + "`HORAFIN` Time  NOT NULL, " + "`TYPE` varchar(255) NOT NULL, "
				+ "`COMODIN` varchar(255), " + "`COMMENTARIO` varchar(255) NOT NULL " + ")";

		String insertQuery = "INSERT INTO tblCampagna Values(?,?,?,?,?,?,?,?,?)";

		// String sql = "UPDATE tableA, tableB
		// SET tableA.columnToBeUpdated = tableB.columnSourceOfData
		// WHERE tableA.id = tableB.idOfTableA

		try {
			conn = jdbcTemplate.getDataSource().getConnection();

			Statement stm = conn.createStatement();

			stm.execute(query);

			System.out.println("Table campgana created!");

			PreparedStatement ptstm = conn.prepareStatement(insertQuery);

			ptstm.setString(1, idCampagna);
			ptstm.setString(2, nombre);
			ptstm.setString(3, dateIni);
			ptstm.setString(4, dateFin);
			ptstm.setString(5, horaIni);
			ptstm.setString(6, horaFin);
			ptstm.setString(7, typeCampagna);
			ptstm.setString(8, comodin);
			ptstm.setString(9, comment);
			ptstm.executeUpdate();

			System.out.println("Values inserted into the table campagna!");

			ptstm.close();
			stm.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);

		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}

	}

	@Override
	public void updateCiutada(List<CiutadaTest> ciutadaList) {

		Connection conn = null;

		/*
		 * String query = "CREATE TABLE IF NOT EXISTS`tblciutadano` (" +
		 * "`CIUTADA_ID` int(11) NOT NULL," +
		 * " `NOM_CIUTADA` varchar(100) NOT NULL, " +
		 * "`PRIMER_COGNOM_CIUTADA` varchar(200) NOT NULL, " +
		 * " `SEGON_COGNOM_CIUTADA` varchar(200) DEFAULT NULL, " +
		 * "`TIPUS_DOCUMENT_CIUTADA_ID` int(11) NOT NULL, " +
		 * "`DOC_IDENTIFICADOR_CIUTADA` varchar(200) NOT NULL, " +
		 * "`GENERE_CIUTADA` char(1) NOT NULL, " +
		 * "`DATA_NAIXEMENT_CIUTADA` date NOT NULL, " +
		 * "`EMAIL` varchar(400) DEFAULT NULL, " +
		 * "`MUNICIPI_ULTIM_VEINATGE_ID` varchar(200) NOT NULL, " +
		 * "`ID_CAMPAGNA` varchar(50) NOT NULL, " +
		 * "`LINK_HASH` varchar(255) NOT NULL, " +
		 * "`HASH` varchar(255) NOT NULL, " +
		 * "`LINK_HASH_PDF` varchar(255) NOT NULL, " +
		 * "`HASHPDF` varchar(255) NOT NULL DEFAULT '0', " +
		 * "`HASHGENERADO` tinyint(4) NOT NULL, " +
		 * "`MAILENVIADO` tinyint(4) NOT NULL, " +
		 * "`ENTRADO` tinyint(4) NOT NULL, " +
		 * "`ISVALIDACION` tinyint(4) NOT NULL, " +
		 * "`ISBAJA` tinyint(4) NOT NULL, " +
		 * "`VERIFICADO` tinyint(4) NOT NULL, " +
		 * "`ENCUESTADO` tinyint(4) NOT NULL, " +
		 * "`ECNUESTACONEXITO` tinyint(4) NOT NULL " +
		 * ") ENGINE=InnoDB DEFAULT CHARSET=utf8; ";
		 */

		// // TODO: No necesario crear de nuevo tabla
		// String query = "CREATE TABLE IF NOT EXISTS`tblciutada` (" + "
		// `NOM_CIUTADA` varchar(100) NOT NULL, "
		// + "`PRIMER_COGNOM_CIUTADA` varchar(200) NOT NULL, "
		// + " `SEGON_COGNOM_CIUTADA` varchar(200) DEFAULT NULL, "
		// + "`TIPUS_DOCUMENT_CIUTADA_ID` varchar(200) NOT NULL, "
		// + "`DOC_IDENTIFICADOR_CIUTADA` varchar(200) NOT NULL, " +
		// "`GENERE_CIUTADA` char(1) NOT NULL, "
		// + "`DATA_NAIXEMENT_CIUTADA` date NOT NULL, " + "`EMAIL` varchar(400)
		// DEFAULT NULL, "
		// + "`MUNICIPI_ULTIM_VEINATGE_ID` varchar(200) NOT NULL, " + "`COMODIN`
		// varchar(200) NOT NULL) "
		// + "ENGINE=InnoDB DEFAULT CHARSET=utf8; ";

		String query = "CREATE TABLE IF NOT EXISTS `tblciutada` ( " + "`CIUTADA_ID` int(11) NOT NULL, "
				+ "`NOM_CIUTADA` varchar(100) NOT NULL, " + "`PRIMER_COGNOM_CIUTADA` varchar(200) NOT NULL, "
				+ "`SEGON_COGNOM_CIUTADA` varchar(200) DEFAULT '', "
				+ "`TIPUS_DOCUMENT_CIUTADA_ID` varchar(200) NOT NULL, "
				+ "`DOC_IDENTIFICADOR_CIUTADA` varchar(200) NOT NULL, " + "`GENERE_CIUTADA` varchar(200) NOT NULL, "
				+ "`DATA_NAIXEMENT_CIUTADA` date NOT NULL, " + "`EMAIL` varchar(400) DEFAULT NULL, "
				+ "`MUNICIPI_ULTIM_VEINATGE_ID` varchar(200) NOT NULL, "
				+ "`ID_CAMPAGNA` varchar(50) NOT NULL DEFAULT '', " + "`LINK_HASH` varchar(255) DEFAULT '', "
				+ "`HASH` varchar(255) DEFAULT '', " + "`LINK_HASH_PDF` varchar(255) DEFAULT '',"
				+ "`HASHPDF` varchar(255) NOT NULL DEFAULT '0', " + "`COMODIN` varchar(255) NOT NULL DEFAULT 'A', "
				+ "`HASHGENERADO` tinyint(4) DEFAULT 0, " + "`MAILENVIADO` tinyint(4) DEFAULT 0, "
				+ "`ENTRADO` tinyint(4) DEFAULT 0, " + "`ISVALIDACION` tinyint(4) DEFAULT 0, "
				+ "`ISBAJA` tinyint(4) DEFAULT 0, " + "`VERIFICADO` tinyint(4) DEFAULT 0, "
				+ "`ENCUESTADO` tinyint(4) DEFAULT 0, " + "`ECNUESTACONEXITO` tinyint(4) DEFAULT 0 "
				+ ")ENGINE=InnoDB DEFAULT CHARSET=utf8; ";

		String insertQuery = "INSERT INTO tblCiutada (NOM_CIUTADA, PRIMER_COGNOM_CIUTADA, SEGON_COGNOM_CIUTADA, TIPUS_DOCUMENT_CIUTADA_ID, DOC_IDENTIFICADOR_CIUTADA, DATA_NAIXEMENT_CIUTADA, MUNICIPI_ULTIM_VEINATGE_ID, COMODIN) Values(?,?,?,?,?,?,?,?)";

		try {
			conn = jdbcTemplate.getDataSource().getConnection();

			Statement stm = conn.createStatement();

			stm.execute(query);

			System.out.println("Table ciutada created!");

			PreparedStatement ptstm = null;

			for (int i = 0; i < ciutadaList.size(); i++) {

				CiutadaTest ciutada = ciutadaList.get(i);

				// ptstm = conn.prepareStatement(insertQuery);
				//
				// ptstm.setString(1, ciutada.getNom_ciutada());
				// ptstm.setString(2, ciutada.getPrimer_cognom_ciutada());
				// ptstm.setString(3, ciutada.getSecond_cognom_ciutada());
				// ptstm.setString(4, ciutada.getTipus_document_ciutada());
				// ptstm.setString(5, ciutada.getDoc_identificator_ciutada());
				// ptstm.setString(6, ciutada.getData_naixament_ciutada());
				// ptstm.setString(7, ciutada.getMunicipi_ultim_veinatge_id());
				// ptstm.setString(8, ciutada.getComodin());
				//
				// ptstm.executeUpdate();

				String insertStatement = "INSERT INTO tblCiutada ("
						+ "CIUTADA_ID,NOM_CIUTADA, PRIMER_COGNOM_CIUTADA, SEGON_COGNOM_CIUTADA, "
						+ "TIPUS_DOCUMENT_CIUTADA_ID, DOC_IDENTIFICADOR_CIUTADA,GENERE_CIUTADA, "
						+ "DATA_NAIXEMENT_CIUTADA, MUNICIPI_ULTIM_VEINATGE_ID, COMODIN) " + "Values(" + "\'"
						+ ciutada.getCiutada_id() + "\', \'" + ciutada.getNom_ciutada() + "\', \'"
						+ ciutada.getPrimer_cognom_ciutada() + "\', " + "\'" + ciutada.getSecond_cognom_ciutada()
						+ "\'," + "\'" + ciutada.getTipus_document_ciutada() + "\'," + "\'"
						+ ciutada.getDoc_identificator_ciutada() + "\'," + "\'" + ciutada.getGenere_ciutada() + "\',"
						+ "\'" + ciutada.getData_naixament_ciutada() + "\'," + "\'"
						+ ciutada.getMunicipi_ultim_veinatge_id() + "\'," + "\'" + ciutada.getComodin() + "\')";

				System.out.println("Insert statement: " + insertStatement);
				stm.execute(insertStatement);
			}

			// ptstm.close();
			System.out.println("Values inserted into the tablecampayna!");
			stm.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);

		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}

	}

}
