package com.aticser.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import com.aticser.model.Municipality;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

public class MunicipalityDAOImpl implements MunicipalityDAO {
	
	private JdbcTemplate jdbcTemplate;
	 
    public MunicipalityDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

	@Override
	public Municipality getMunicipality(int municipi_id) {
		String sql = "SELECT * FROM tblmunicipios WHERE MUNICIPI_ID=" + municipi_id;
	    return jdbcTemplate.query(sql, new ResultSetExtractor<Municipality>() {
	 
	        @Override
	        public Municipality extractData(ResultSet rs) throws SQLException,
	                DataAccessException {
	            if (rs.next()) {
	            	Municipality municipality = new Municipality();
	            	municipality.setMunicipi_id(rs.getInt("MUNICIPI_ID"));
	            	municipality.setProvincia_id(rs.getInt("PROVINCIA_ID"));
	            	municipality.setDescripcio(rs.getString("DESCRIPCIO"));
	            	municipality.setCodi_ine(rs.getString("CODI_INE"));
	            	
	                return municipality;
	            }
				return null;
	 
//	            return municipality;
	        }
	 
	    });
	}

	@Override
	public List<Municipality> listMunicipalities() {
		String sql = "SELECT * FROM tblmunicipios ORDER BY DESCRIPCIO";
	    List<Municipality> listMunicipality= jdbcTemplate.query(sql, new RowMapper<Municipality>() {
	 
	        @Override
	        public Municipality mapRow(ResultSet rs, int rowNum) throws SQLException {
	        	Municipality aMuunicipality = new Municipality();
	 
//	            aContact.setsetId(rs.getInt("contact_id"));
//	        	aContact.setName(rs.getString("name"));
//		        aContact.setEmail(rs.getString("email"));
//		        aContact.setAddress(rs.getString("address"));
//		        aContact.setTelephone(rs.getString("telephone"));
		 
	            
	            aMuunicipality.setMunicipi_id(rs.getInt("MUNICIPI_ID"));
	            aMuunicipality.setProvincia_id(rs.getInt("PROVINCIA_ID"));
	            aMuunicipality.setDescripcio(rs.getString("DESCRIPCIO"));
	            aMuunicipality.setCodi_ine(rs.getString("CODI_INE"));
	         
	            return aMuunicipality;
	        }
	 
	    });
	 
	    return listMunicipality;
	}

}
