package com.aticser.dao;

import java.util.List;

import com.aticser.model.Municipality;

public interface MunicipalityDAO {

	public Municipality getMunicipality(int municipi_id);
    
    public List<Municipality> listMunicipalities();
	
}
