package com.aticser.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.aticser.dao.CiutadaDAO;
import com.aticser.dao.CiutadaDAOImpl;
import com.aticser.dao.MunicipalityDAO;
import com.aticser.dao.MunicipalityDAOImpl;

@Configuration
@ComponentScan(basePackages = "com.aticser")
@EnableWebMvc
public class MvcConfiguration extends WebMvcConfigurerAdapter {

	@Bean
	public ViewResolver getViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	@Bean
	public DataSource getDataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();

		// dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		// dataSource.setUrl("jdbc:mysql://localhost:3306/tsystemas");
		// dataSource.setUsername("root");
		// dataSource.setPassword("");
		//
		// dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		// dataSource.setUrl("jdbc:mysql://localhost:3306/tsystemas");
		// dataSource.setUsername("root");
		// dataSource.setPassword("Aticser2015");

		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://10.2.0.20:3306/tsystemas");
		dataSource.setUsername("aticser");
		dataSource.setPassword("Aticser.01");

		return dataSource;
	}

	@Bean
	public MunicipalityDAO getMunicipalityDAO() {
		return new MunicipalityDAOImpl(getDataSource());
	}

	@Bean
	public CiutadaDAO getCiutadanoDAO() {
		return new CiutadaDAOImpl(getDataSource());
	}
}