package com.aticser.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import javax.validation.Valid;
//import javax.validation.constraints.NotNull;
//
//import org.hibernate.validator.constraints.NotBlank;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.aticser.dao.CiutadaDAO;
import com.aticser.dao.MunicipalityDAO;
import com.aticser.model.Campagna;
import com.aticser.model.Ciutada;
import com.aticser.model.Municipality;
import com.aticser.model.TestModel;
import com.aticser.model.User;
import com.aticser.util.Utils;

//public class MainController extends AbstractController{
//
////	@RequestMapping(value = "/callWebService", method = RequestMethod.POST)
//	@Override
//	protected ModelAndView handleRequestInternal(HttpServletRequest request,
//		HttpServletResponse response) throws Exception {
//
//		ModelAndView model = new ModelAndView("HelloWorldPage");
//		model.addObject("msg", "hello world");
//		
//		String hashedString1 = "";
//		String hashedString2 = "";
//		
//		hashedString1 = Utils.getHashString("1234");
//		hashedString2 = Utils.getHashString("1678");
//		
//		model.addObject("hash1", hashedString1);
//		model.addObject("hash2", hashedString2);
//
//		return model;
//	}
//	
//}

@Controller
public class MainController {

	int counterSur = 0;
	int counterPdf = 0;

	@Autowired
	private MunicipalityDAO municipalityDAO;

	// @Autowired
	// private UserDAO userDAO;

	@Autowired
	private CiutadaDAO ciutadaDAO;

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	protected ModelAndView loadTestWeb(ModelMap modelMap) {

		ModelAndView model = new ModelAndView("HelloWorldPage");
		model.addObject("msg", "hello world");

		String hashedString1 = "";
		String hashedString2 = "";

		try {
			hashedString1 = Utils.getHashString("www.gencat.cat/test/ViktorY2754879E20170000A");
			hashedString2 = Utils.getHashString("1678");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addObject("hash1", hashedString1);
		model.addObject("hash2", hashedString2);

		return model;

		// return new ModelAndView("HelloWorldPage", "command", new
		// TestModel());
	}

	@RequestMapping(value = "/process2", method = RequestMethod.GET)
	protected ModelAndView loadProcessData(ModelMap modelMap) {

		List<Ciutada> ciutudaData = ciutadaDAO.getDataCiutada();
		List<Integer> ciutId = new ArrayList<>();
		List<String> ciutName = new ArrayList<>();
		List<String> campagnaId = new ArrayList<>();
		List<String> ciutSurname = new ArrayList<>();
		List<String> ciutDocNum = new ArrayList<>();

		for (int i = 0; i < ciutudaData.size(); i++) {
			int itemCiutId = ciutudaData.get(i).getCiutada_id();
			String itemCiutName = ciutudaData.get(i).getNom_ciutada();
			String itemCampagnaId = ciutudaData.get(i).getIdCampagna();
			String itemCiutSurame = ciutudaData.get(i).getPrimer_cognom_ciutada();
			String itemCiutDocNum = ciutudaData.get(i).getDoc_identificator_ciutada();
			ciutId.add(itemCiutId);
			ciutName.add(itemCiutName);
			campagnaId.add(itemCampagnaId);
			ciutSurname.add(itemCiutSurame);
			ciutDocNum.add(itemCiutDocNum);
		}

		System.out.println(ciutId);
		System.out.println(ciutName);
		System.out.println(campagnaId);

		List<String> ciutIdStr = new ArrayList<String>(ciutId.size());

		for (Integer myInt : ciutId) {
			ciutIdStr.add(String.valueOf(myInt));
		}

		System.out.println(ciutIdStr);

		List<String> dataCiut = new ArrayList<>();
		List<String> dataCiutBaja = new ArrayList<>();
		List<String> dataCiutPdf = new ArrayList<>();

		List<String> hashCiut = new ArrayList<>();
		List<String> hashCiutBaja = new ArrayList<>();
		List<String> hashCiutPdf = new ArrayList<>();

		for (int i = 0; i < ciutIdStr.size(); i++) {
			String triplet = ciutIdStr.get(i) + ciutName.get(i) + campagnaId.get(i);
			String tripletBaja = ciutDocNum.get(i) + ciutId.get(i) + ciutSurname.get(i);
			String tripletPdf = ciutDocNum.get(i) + ciutId.get(i) + ciutSurname.get(i);
			System.out.println("Triplet " + triplet);
			System.out.println("Triplet PDF " + tripletPdf);

			String hashedStr = "";
			String hashedStrBaja = "";
			String hashedStrPdf = "";

			try {
				hashedStr = Utils.getHashString(triplet);
				hashedStrBaja = Utils.getHashString(tripletBaja);
				hashedStrPdf = Utils.getHashString(tripletPdf);

				System.out.println("Hashed string " + hashedStr);
				System.out.println("Hashed string Pdf " + hashedStrPdf);
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// HERE!!!!
			///////////////////////////////////////////
			///////////
			dataCiut.add("http://52.166.60.125:8080/TSystemas/verify?id=" + hashedStr + "&t=A");
			// dataCiutBaja.add("http://localhost:8080/TSystemas/verify?id=" +
			// hashedStrBaja);
			dataCiutPdf.add("http://52.166.60.125:8080/TSystemas/verify?id=" + hashedStrPdf + "&t=B");

			// dataCiut.add("http://81.47.161.55:8080/TSystemas/verify?id=" +
			// hashedStr);
			// dataCiut.add("http://81.47.161.55:8080/TSystemas/verify?baja=" +
			// hashedStrBaja);
			hashCiut.add(hashedStr);
			hashCiutPdf.add(hashedStrPdf);
		}

		System.out.println(dataCiut);

		ciutadaDAO.createHashedLinks(ciutId, dataCiut);

		// // DO NOT DELETE ME!
		// ciutadaDAO.createHashedLinksBaja(ciutId,dataCiutBaja);

		ciutadaDAO.createHashedLinksPdf(ciutId, dataCiutPdf);

		ciutadaDAO.createHashTable(ciutId, hashCiut);

		// // DO NOT DELETE ME!
		// ciutadaDAO.createHashTableBaja(ciutId, hashCiutBaja);

		ciutadaDAO.createHashTablePdf(ciutId, hashCiutPdf);

		ciutadaDAO.updateHashCreated();

		ciutadaDAO.updateEmailEnviado();

		ModelAndView model = new ModelAndView("HelloWorldPage");

		String hashedString1 = "";
		String hashedString2 = "";

		try {
			hashedString1 = Utils.getHashString("www.gencat.cat/test/ViktorY2754879E20170000A");
			hashedString2 = Utils.getHashString("1678");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addObject("hash1", hashedString1);
		model.addObject("hash2", hashedString2);

		return model;

		// return new ModelAndView("HelloWorldPage", "command", new
		// TestModel());
	}

	@RequestMapping(value = "/verify", method = RequestMethod.GET)
	public ModelAndView loadVerification(HttpServletRequest request, ModelMap modelMap) {

		String req = request.getParameter("id");
		System.out.println(" reguest is " + req);

		String type = request.getParameter("t");
		System.out.println(" type is " + type);

		if (type.equals("A")) {
			System.out.println("ONLINE");
		} else if (type.equals("B")) {
			System.out.println("PDF");
		} else {
			System.out.println("ERRRRROOOORRRR!");
		}

		// String reqBaja = request.getParameter("baja");
		// System.out.println(" reguest is " + req);
		// System.out.println(Request.values().toString());

		Ciutada ciut = ciutadaDAO.getCiutada(req);

		// // DO NOT DELETE ME!
		// Ciutada ciutBaja = ciutadaDAO.getCiutadaBaja(reqBaja);

		System.out.println("Ciutada is " + ciut.toString());

		// System.out.println("Ciutada for baja is " + ciutBaja.toString());

		List<Ciutada> ciutudaData = ciutadaDAO.getDataCiutada();

		List<String> ciutHash = new ArrayList<>();
		List<String> ciutHashPdf = new ArrayList<>();

		// List<String> ciutHashBaja = new ArrayList<>();

		// List<String> ciutName = new ArrayList<>();
		// List<String> ciutLastName = new ArrayList<>();
		// List<Integer> ciutTI = new ArrayList<>();
		// List<String> ciutDocNum = new ArrayList<>();
		// List<String> ciutBirthDate = new ArrayList<>();
		// List<String> ciutLastEmpa = new ArrayList<>();

		for (int i = 0; i < ciutudaData.size(); i++) {

			String itemCiutHash = ciutudaData.get(i).getHash().toLowerCase();

			ciutHash.add(itemCiutHash);

			// ciutHashBaja.add(itemCiutHashBaja);

		}

		for (int i = 0; i < ciutudaData.size(); i++) {

			String itemCiutHashPdf = ciutudaData.get(i).getHashPdf().toLowerCase();

			ciutHashPdf.add(itemCiutHashPdf);

			// ciutHashBaja.add(itemCiutHashBaja);

		}

		// System.out.println("Types of documents " + ciutTI);

		if (ciutHash.contains(req)) {
			ModelAndView model = new ModelAndView("verification", "command", new TestModel());

			List<Municipality> listMunicipality = municipalityDAO.listMunicipalities();
			// model.addObject("listMunicipalities", listMunicipality);

			List<String> munName = new ArrayList<>();
			List<String> munCP = new ArrayList<>();
			for (int i = 0; i < listMunicipality.size(); i++) {
				String itemMun = listMunicipality.get(i).getDescripcio();
				String itemMunCP = listMunicipality.get(i).getCodi_ine();
				munName.add(itemMun);
				munCP.add(itemMunCP);
			}

			System.out.println(munName);

			boolean isBaja = false;

			modelMap.addAttribute("hash", req);
			modelMap.addAttribute("isBaja", isBaja);
			modelMap.addAttribute("listMun", munName);
			modelMap.addAttribute("listMunCP", munCP);

			ciutadaDAO.updateEnteredToPlatform(req);

			return model;

		} else if (ciutHashPdf.contains(req)) {

			ModelAndView model = new ModelAndView("pdfVerification", "command", new TestModel());

			List<Municipality> listMunicipality = municipalityDAO.listMunicipalities();
			// model.addObject("listMunicipalities", listMunicipality);

			List<String> munName = new ArrayList<>();
			List<String> munCP = new ArrayList<>();
			for (int i = 0; i < listMunicipality.size(); i++) {
				String itemMun = listMunicipality.get(i).getDescripcio();
				String itemMunCP = listMunicipality.get(i).getCodi_ine();
				munName.add(itemMun);
				munCP.add(itemMunCP);
			}

			System.out.println(munName);

			boolean isBaja = false;

			modelMap.addAttribute("hash", req);
			modelMap.addAttribute("isBaja", isBaja);
			modelMap.addAttribute("listMun", munName);
			modelMap.addAttribute("listMunCP", munCP);

			ciutadaDAO.updateEnteredToPlatform(req);

			return model;

		} else {
			System.out.println("FATAL ERROR");
		}

		return null;

	}

	@RequestMapping(value = "/survey" /* , method = RequestMethod.GET */)
	public ModelAndView doLogin(@ModelAttribute("userForm") TestModel testModel, BindingResult result,
			Map<String, Object> model, ModelMap modelMap, @RequestParam("firstName") String firstName,
			@RequestParam("lastName1") String lastName1, @RequestParam("lastName2") String lastName2,
			@RequestParam("authDocType1") int authDocType1, @RequestParam("authDoc1Value") String authDoc1Value,
			/* @NotBlank */ @RequestParam("birthDate") String birthDate, @RequestParam("municipo") String municipo,
			@RequestParam("acceptem") String envia, @RequestParam("hash") String hash, HttpServletRequest request
	/* @RequestParam("solBaja") Boolean baja */) {

		String dateOfBirth = "";

		if (!birthDate.equals("")) {
			System.out.println("Date of birth: " + birthDate);

			String year = birthDate.substring(6);

			String month = birthDate.substring(3, 5);

			String day = birthDate.substring(0, 2);

			dateOfBirth = year + "-" + month + "-" + day;

			System.out.println("Date now is: " + dateOfBirth);
		} else {
			dateOfBirth = "";
		}

		//
		// System.out.println("Year is: " + year);
		//
		// System.out.println("Month is: " + month);
		//
		// System.out.println("Day is: " + day);
		// System.out.println("LAST NAME IS " + lastName1);
		//
		// System.out.println("LAST NAME 2 IS " + lastName2);

		ModelAndView modelSurv = new ModelAndView("survey");
		modelSurv.addObject("firstName", firstName);

		ModelAndView modelBaja = new ModelAndView("baja");
		modelBaja.addObject("firstName", firstName);

		String isBajaOn = (String) request.getAttribute("solBajaON");

		String isBajaOff = (String) request.getAttribute("solBajaOFF");

		// System.out.println("Is baja on " + isBajaOn);
		//
		// System.out.println("Is baja off " + isBajaOff);
		// if (result.hasErrors()) {
		// return "verification";
		// } else {
		// // TODO code the database connection and checking
		//
		//
		// return "survey";
		// }

		// boolean isBaja = (boolean) request.getAttribute("isBaja");

		// System.out.println("First name " + firstName);

		Ciutada ciut = ciutadaDAO.getCiutada(hash);

		// System.out.println("Ciutada is " + ciut.toString());

		// model.get("isBaja")

		// isBaja = (boolean)testModel.getIsBaja();

		// testModel.getIsBaja()

		// System.out.println("Baja is " + isBaja);

		// List<Ciutada> ciutudanoData = ciutadaDAO.getDataCiutadano();

		// List<String> ciutHash = new ArrayList<>();

		// List<String> ciutName = new ArrayList<>();
		// List<String> ciutLastName = new ArrayList<>();
		// List<Integer> ciutTI = new ArrayList<>();
		// List<String> ciutDocNum = new ArrayList<>();
		// List<String> ciutBirthDate = new ArrayList<>();
		// List<String> ciutLastEmpa = new ArrayList<>();

		// for(int i = 0; i < ciutudanoData.size(); i++) {
		//
		//// String itemCiutHash = ciutudanoData.get(i).getHash().toLowerCase();
		// String itemCiutName =
		// ciutudanoData.get(i).getNom_ciutada().toLowerCase();
		// String itemCiutLastNa =
		// ciutudanoData.get(i).getPrimer_cognom_ciutada().toLowerCase();
		// int itemCiutTI = ciutudanoData.get(i).getTipus_document_ciutada();
		// String itemciutDocNum =
		// ciutudanoData.get(i).getDoc_identificator_ciutada().toLowerCase();
		// String itemciutBirthDate =
		// ciutudanoData.get(i).getData_naixament_ciutada();
		// String itemciutLastEmpa =
		// ciutudanoData.get(i).getMunicipi_ultim_veinatge_id().toLowerCase();
		//// String itemCiutLastNa =
		// ciutudanoData.get(i).getPrimer_cognom_ciutada().toLowerCase();
		//
		//
		//// ciutHash.add(itemCiutHash);
		// ciutName.add(itemCiutName);
		// ciutLastName.add(itemCiutLastNa);
		// ciutTI.add(itemCiutTI);
		// ciutDocNum.add(itemciutDocNum);
		// ciutBirthDate.add(itemciutBirthDate);
		// ciutLastEmpa.add(itemciutLastEmpa);
		// }

		boolean isFirstName = false;
		boolean isLastName = false;
		boolean isLastName2 = false;
		boolean isTypeDocument = false;
		boolean isDocNumber = false;
		boolean isBirthData = false;
		boolean isMunicipio = false;

		boolean isBaja = false;

		// if (baja) {
		// isBaja = true;
		// }

		if (ciut.getNom_ciutada().toLowerCase().equals(firstName.toLowerCase())) {
			isFirstName = true;
		}

		if (ciut.getPrimer_cognom_ciutada().toLowerCase().equals(lastName1.toLowerCase())) {
			isLastName = true;
		}

		if (lastName2.trim().compareTo("") == 0) {
			lastName2 = "empty";
		}

		if (ciut.getSecond_cognom_ciutada() == null || ciut.getSecond_cognom_ciutada().trim().compareTo("") == 0) {
			ciut.setSecond_cognom_ciutada("empty");
		}

		System.out.println("Ciut last name 2 " + ciut.getSecond_cognom_ciutada());
		System.out.println("Now last name 2 " + lastName2);

		if (ciut.getSecond_cognom_ciutada().toLowerCase().equals(lastName2.toLowerCase())) {
			isLastName2 = true;
		}

		if (ciut.getTipus_document_ciutada() == authDocType1) {
			isTypeDocument = true;
		}

		if (ciut.getDoc_identificator_ciutada().toLowerCase().equals(authDoc1Value.toLowerCase())) {
			isDocNumber = true;
		}

		if (ciut.getData_naixament_ciutada().equals(dateOfBirth.toLowerCase())) {
			isBirthData = true;
		}

		if (ciut.getMunicipi_ultim_veinatge_id().equals(municipo.toLowerCase())) {
			isMunicipio = true;
		}

		// if (ciutName.contains(firstName.toLowerCase())) {
		// isFirstName = true;
		// }
		//
		// if (ciutLastName.contains(lastName1.toLowerCase())) {
		// isLastName = true;
		// }
		//
		// final int[] arrayCiutTI = ciutTI.stream().mapToInt(i->i).toArray();
		//
		// isTypeDocument = Utils.contains(arrayCiutTI, authDocType1 );
		//
		//// if (arrayCiutTI.contains(authDocType1)) {
		//// isTypeDocument = true;
		//// }
		//
		// System.out.println("array CiutTI " + arrayCiutTI);
		// System.out.println("authDoc " + authDocType1);
		// System.out.println("Is type of document is " + isTypeDocument);
		//
		// if (ciutDocNum.contains(authDoc1Value.toLowerCase())) {
		// isDocNumber = true;
		// }
		//
		// if (ciutBirthDate.contains(birthDate.toLowerCase())) {
		// isBirthData = true;
		// }
		//
		// if (ciutLastEmpa.contains(municipo.toLowerCase())) {
		// isMunicipio = true;
		// }

		System.out.println("isFirstName " + isFirstName);
		System.out.println("isLastName " + isLastName);
		System.out.println("isLastName2 " + isLastName);
		System.out.println("isTypeDocument " + isTypeDocument);
		System.out.println("isDocNumber " + isDocNumber);
		System.out.println("isBirthData " + isBirthData);
		System.out.println("isMunicipio " + isMunicipio);

		modelMap.addAttribute("hash", hash);

		modelMap.addAttribute("isFirstName", isFirstName);
		modelMap.addAttribute("isLastName", isLastName);
		modelMap.addAttribute("isLastName2", isLastName2);
		modelMap.addAttribute("isTypeDocument", isTypeDocument);
		modelMap.addAttribute("isDocNumber", isDocNumber);
		modelMap.addAttribute("isBirthData", isBirthData);
		modelMap.addAttribute("isMunicipio", isMunicipio);

		modelMap.addAttribute("firstName", firstName);
		modelMap.addAttribute("lastName1", lastName1);
		modelMap.addAttribute("lastName2", lastName2);
		modelMap.addAttribute("authDocType1", authDocType1);
		modelMap.addAttribute("authDoc1Value", authDoc1Value);
		modelMap.addAttribute("birthDate", birthDate);
		modelMap.addAttribute("municipo", municipo);

		// modelMap.addAttribute("listMun", munName);
		// modelMap.addAttribute("listMunCP", munCP);

		if (isFirstName && isLastName && isLastName2 && isTypeDocument && isDocNumber && isBirthData && isMunicipio) {

			if (isBaja == true) {
				ciutadaDAO.updateIsBaja(hash);
				return modelBaja;
			} else {
				ciutadaDAO.updateIsVerificacion(hash);
				ciutadaDAO.updateCiutadaVerified(firstName, authDoc1Value);

				return modelSurv;
			}

		} else {

			counterSur++;
			System.out.println("Counter now is " + counterSur);

			if (counterSur == 5) {
				ModelAndView modelErrorVerf = new ModelAndView("verifail");

				return modelErrorVerf;
			}

			ModelAndView modelVerif = new ModelAndView("rverification", "command", new TestModel());

			List<Municipality> listMunicipality = municipalityDAO.listMunicipalities();
			// model.addObject("listMunicipalities", listMunicipality);

			List<String> munName = new ArrayList<>();
			List<String> munCP = new ArrayList<>();
			for (int i = 0; i < listMunicipality.size(); i++) {
				String itemMun = listMunicipality.get(i).getDescripcio();
				String itemMunCP = listMunicipality.get(i).getCodi_ine();
				munName.add(itemMun);
				munCP.add(itemMunCP);
			}

			// modelMap.addAttribute("isFirstName",isFirstName);
			// modelMap.addAttribute("isLastName",isLastName);
			// modelMap.addAttribute("isTypeDocument",isTypeDocument);
			// modelMap.addAttribute("isDocNumber",isDocNumber);
			// modelMap.addAttribute("isBirthData",isBirthData);
			// modelMap.addAttribute("isMunicipio",isMunicipio);
			//
			// modelMap.addAttribute("firstName",firstName);
			// modelMap.addAttribute("lastName1",lastName1);
			// modelMap.addAttribute("authDocType1",authDocType1);
			// modelMap.addAttribute("authDoc1Value",authDoc1Value);
			// modelMap.addAttribute("birthDate",birthDate);
			// modelMap.addAttribute("municipo",municipo);

			// System.out.println(munName);

			modelMap.addAttribute("listMun", munName);
			modelMap.addAttribute("listMunCP", munCP);

			modelMap.addAttribute("hash", hash);

			System.out.println("FATAL ERROR NOT VERIFIED");

			// if (result.hasErrors()) {
			// return modelVerif;
			// }
			modelMap.addAttribute("counterSur", counterSur);

			return modelVerif;
		}

		// return null;

		// return "survey";
	}

	@RequestMapping(value = "/pdf" /* , method = RequestMethod.GET */)
	public ModelAndView doLoginPdf(@ModelAttribute("userForm") TestModel testModel, BindingResult result,
			Map<String, Object> model, ModelMap modelMap, @RequestParam("firstName") String firstName,
			@RequestParam("lastName1") String lastName1, @RequestParam("lastName2") String lastName2,
			@RequestParam("authDocType1") int authDocType1, @RequestParam("authDoc1Value") String authDoc1Value,
			/* @NotBlank */ @RequestParam("birthDate") String birthDate, @RequestParam("municipo") String municipo,
			@RequestParam("acceptem") String envia, @RequestParam("hash") String hash, HttpServletRequest request
	/* @RequestParam("solBaja") Boolean baja */) {

		String dateOfBirth = "";

		if (!birthDate.equals("")) {
			System.out.println("Date of birth: " + birthDate);

			String year = birthDate.substring(6);

			String month = birthDate.substring(3, 5);

			String day = birthDate.substring(0, 2);

			dateOfBirth = year + "-" + month + "-" + day;

			System.out.println("Date now is: " + dateOfBirth);
		} else {
			dateOfBirth = "";
		}

		System.out.println("LAST NAME IS " + lastName1);

		System.out.println("LAST NAME 2 IS " + lastName2);

		ModelAndView modelPdf = new ModelAndView("pdf");
		modelPdf.addObject("firstName", firstName);

		ModelAndView modelBaja = new ModelAndView("baja");
		modelBaja.addObject("firstName", firstName);

		String isBajaOn = (String) request.getAttribute("solBajaON");

		String isBajaOff = (String) request.getAttribute("solBajaOFF");

		// System.out.println("Is baja on " + isBajaOn);
		//
		// System.out.println("Is baja off " + isBajaOff);
		// if (result.hasErrors()) {
		// return "verification";
		// } else {
		// // TODO code the database connection and checking
		//
		//
		// return "survey";
		// }

		// boolean isBaja = (boolean) request.getAttribute("isBaja");

		System.out.println("First name " + firstName);

		Ciutada ciut = ciutadaDAO.getCiutadaPdf(hash);

		System.out.println("Ciutada is " + ciut.toString());

		// model.get("isBaja")

		// isBaja = (boolean)testModel.getIsBaja();

		// testModel.getIsBaja()

		// System.out.println("Baja is " + isBaja);

		// List<Ciutada> ciutudanoData = ciutadaDAO.getDataCiutadano();

		// List<String> ciutHash = new ArrayList<>();

		// List<String> ciutName = new ArrayList<>();
		// List<String> ciutLastName = new ArrayList<>();
		// List<Integer> ciutTI = new ArrayList<>();
		// List<String> ciutDocNum = new ArrayList<>();
		// List<String> ciutBirthDate = new ArrayList<>();
		// List<String> ciutLastEmpa = new ArrayList<>();

		// for(int i = 0; i < ciutudanoData.size(); i++) {
		//
		//// String itemCiutHash = ciutudanoData.get(i).getHash().toLowerCase();
		// String itemCiutName =
		// ciutudanoData.get(i).getNom_ciutada().toLowerCase();
		// String itemCiutLastNa =
		// ciutudanoData.get(i).getPrimer_cognom_ciutada().toLowerCase();
		// int itemCiutTI = ciutudanoData.get(i).getTipus_document_ciutada();
		// String itemciutDocNum =
		// ciutudanoData.get(i).getDoc_identificator_ciutada().toLowerCase();
		// String itemciutBirthDate =
		// ciutudanoData.get(i).getData_naixament_ciutada();
		// String itemciutLastEmpa =
		// ciutudanoData.get(i).getMunicipi_ultim_veinatge_id().toLowerCase();
		//// String itemCiutLastNa =
		// ciutudanoData.get(i).getPrimer_cognom_ciutada().toLowerCase();
		//
		//
		//// ciutHash.add(itemCiutHash);
		// ciutName.add(itemCiutName);
		// ciutLastName.add(itemCiutLastNa);
		// ciutTI.add(itemCiutTI);
		// ciutDocNum.add(itemciutDocNum);
		// ciutBirthDate.add(itemciutBirthDate);
		// ciutLastEmpa.add(itemciutLastEmpa);
		// }

		boolean isFirstName = false;
		boolean isLastName = false;
		boolean isLastName2 = false;
		boolean isTypeDocument = false;
		boolean isDocNumber = false;
		boolean isBirthData = false;
		boolean isMunicipio = false;

		boolean isBaja = false;

		// if (baja) {
		// isBaja = true;
		// }

		if (ciut.getNom_ciutada().toLowerCase().equals(firstName.toLowerCase())) {
			isFirstName = true;
		}

		if (ciut.getPrimer_cognom_ciutada().toLowerCase().equals(lastName1.toLowerCase())) {
			isLastName = true;
		}

		if (lastName2.trim().compareTo("") == 0) {
			lastName2 = "empty";
		}

		if (ciut.getSecond_cognom_ciutada().trim().compareTo("") == 0 || ciut.getSecond_cognom_ciutada() == null) {
			ciut.setSecond_cognom_ciutada("empty");
		}

		System.out.println("Ciut last name 2 " + ciut.getSecond_cognom_ciutada());
		System.out.println("Now last name 2 " + lastName2);

		if (ciut.getSecond_cognom_ciutada().toLowerCase().equals(lastName2.toLowerCase())) {
			isLastName2 = true;
		}

		if (ciut.getTipus_document_ciutada() == authDocType1) {
			isTypeDocument = true;
		}

		if (ciut.getDoc_identificator_ciutada().toLowerCase().equals(authDoc1Value.toLowerCase())) {
			isDocNumber = true;
		}

		if (ciut.getData_naixament_ciutada().equals(dateOfBirth.toLowerCase())) {
			isBirthData = true;
		}

		if (ciut.getMunicipi_ultim_veinatge_id().equals(municipo.toLowerCase())) {
			isMunicipio = true;
		}

		// if (ciutName.contains(firstName.toLowerCase())) {
		// isFirstName = true;
		// }
		//
		// if (ciutLastName.contains(lastName1.toLowerCase())) {
		// isLastName = true;
		// }
		//
		// final int[] arrayCiutTI = ciutTI.stream().mapToInt(i->i).toArray();
		//
		// isTypeDocument = Utils.contains(arrayCiutTI, authDocType1 );
		//
		//// if (arrayCiutTI.contains(authDocType1)) {
		//// isTypeDocument = true;
		//// }
		//
		// System.out.println("array CiutTI " + arrayCiutTI);
		// System.out.println("authDoc " + authDocType1);
		// System.out.println("Is type of document is " + isTypeDocument);
		//
		// if (ciutDocNum.contains(authDoc1Value.toLowerCase())) {
		// isDocNumber = true;
		// }
		//
		// if (ciutBirthDate.contains(birthDate.toLowerCase())) {
		// isBirthData = true;
		// }
		//
		// if (ciutLastEmpa.contains(municipo.toLowerCase())) {
		// isMunicipio = true;
		// }

		System.out.println("isFirstName " + isFirstName);
		System.out.println("isLastName " + isLastName);
		System.out.println("isLastName2 " + isLastName);
		System.out.println("isTypeDocument " + isTypeDocument);
		System.out.println("isDocNumber " + isDocNumber);
		System.out.println("isBirthData " + isBirthData);
		System.out.println("isMunicipio " + isMunicipio);

		modelMap.addAttribute("hash", hash);

		modelMap.addAttribute("isFirstName", isFirstName);
		modelMap.addAttribute("isLastName", isLastName);
		modelMap.addAttribute("isLastName2", isLastName2);
		modelMap.addAttribute("isTypeDocument", isTypeDocument);
		modelMap.addAttribute("isDocNumber", isDocNumber);
		modelMap.addAttribute("isBirthData", isBirthData);
		modelMap.addAttribute("isMunicipio", isMunicipio);

		modelMap.addAttribute("firstName", firstName);
		modelMap.addAttribute("lastName1", lastName1);
		modelMap.addAttribute("lastName2", lastName2);
		modelMap.addAttribute("authDocType1", authDocType1);
		modelMap.addAttribute("authDoc1Value", authDoc1Value);
		modelMap.addAttribute("birthDate", birthDate);
		modelMap.addAttribute("municipo", municipo);

		// modelMap.addAttribute("listMun", munName);
		// modelMap.addAttribute("listMunCP", munCP);

		if (isFirstName && isLastName && isLastName2 && isTypeDocument && isDocNumber && isBirthData && isMunicipio) {

			if (isBaja == true) {
				ciutadaDAO.updateIsBaja(hash);
				return modelBaja;
			} else {
				ciutadaDAO.updateIsVerificacion(hash);
				ciutadaDAO.updateCiutadaVerified(firstName, authDoc1Value);

				return modelPdf;
			}

		} else {

			counterPdf++;
			System.out.println("Counter pdf now is " + counterPdf);

			if (counterPdf == 5) {
				ModelAndView modelErrorVerf = new ModelAndView("verifail");

				return modelErrorVerf;
			}

			ModelAndView modelVerif = new ModelAndView("pdfRverification", "command", new TestModel());

			List<Municipality> listMunicipality = municipalityDAO.listMunicipalities();
			// model.addObject("listMunicipalities", listMunicipality);

			List<String> munName = new ArrayList<>();
			List<String> munCP = new ArrayList<>();
			for (int i = 0; i < listMunicipality.size(); i++) {
				String itemMun = listMunicipality.get(i).getDescripcio();
				String itemMunCP = listMunicipality.get(i).getCodi_ine();
				munName.add(itemMun);
				munCP.add(itemMunCP);
			}

			// modelMap.addAttribute("isFirstName",isFirstName);
			// modelMap.addAttribute("isLastName",isLastName);
			// modelMap.addAttribute("isTypeDocument",isTypeDocument);
			// modelMap.addAttribute("isDocNumber",isDocNumber);
			// modelMap.addAttribute("isBirthData",isBirthData);
			// modelMap.addAttribute("isMunicipio",isMunicipio);
			//
			// modelMap.addAttribute("firstName",firstName);
			// modelMap.addAttribute("lastName1",lastName1);
			// modelMap.addAttribute("authDocType1",authDocType1);
			// modelMap.addAttribute("authDoc1Value",authDoc1Value);
			// modelMap.addAttribute("birthDate",birthDate);
			// modelMap.addAttribute("municipo",municipo);

			System.out.println(munName);

			modelMap.addAttribute("listMun", munName);
			modelMap.addAttribute("listMunCP", munCP);

			modelMap.addAttribute("hash", hash);

			System.out.println("FATAL ERROR NOT VERIFIED");

			// if (result.hasErrors()) {
			// return modelVerif;
			// }
			modelMap.addAttribute("counterPdf", counterPdf);

			return modelVerif;
		}

		// return null;

		// return "survey";
	}

	@RequestMapping(value = "/municipality", method = RequestMethod.GET)
	public ModelAndView listMunicipality(ModelMap modelMap) {

		ModelAndView model = new ModelAndView("MunicipalityPage");

		List<Municipality> listMunicipality = municipalityDAO.listMunicipalities();
		// model.addObject("listMunicipalities", listMunicipality);

		List<String> munName = new ArrayList<>();
		for (int i = 0; i < listMunicipality.size(); i++) {
			String itemMun = listMunicipality.get(i).getDescripcio();
			munName.add(itemMun);
		}
		model.addObject("listMunicipalities", munName);
		// model.setViewName("home");

		return model;
	}

	@RequestMapping(value = "/redSurv" /* , method = RequestMethod.GET */)
	public ModelAndView redirectToSurvey(@ModelAttribute("userForm") TestModel testModel, BindingResult result,
			Map<String, Object> model, ModelMap modelMap, @RequestParam("hash") String hash) {

		ModelAndView modelRed = new ModelAndView("redSurv");

		ciutadaDAO.updateEncuestado(hash);

		return modelRed;

	}

	// @RequestMapping(value = "/pdf" /*, method = RequestMethod.GET*/)
	// public ModelAndView redirectToPdfSurvey(@ModelAttribute("userForm")
	// TestModel testModel,
	// BindingResult result, Map<String, Object> model, ModelMap modelMap,
	// @RequestParam("hash") String hash) {
	//
	// ModelAndView modelRed = new ModelAndView("pdf");
	//
	// ciutadaDAO.updateEncuestado(hash);
	//
	// return modelRed;
	//
	// }

	@RequestMapping(value = "/login")
	public ModelAndView login(ModelMap modelMap) throws IOException {
		ModelAndView model = new ModelAndView("login");

		model.setViewName("login");

		return model;
	}

	@RequestMapping(value = "/admin" /* , method = RequestMethod.GET */)
	public ModelAndView doLogin(ModelMap modelMap, @RequestParam("username") String username,
			@RequestParam("password") String password) {

		boolean isUser = false;

		boolean isPassword = false;

		List<User> Users = ciutadaDAO.getUsers();

		List<String> usernames = new ArrayList<>();
		List<String> passwords = new ArrayList<>();

		for (int i = 0; i < Users.size(); i++) {
			String itemUsername = Users.get(i).getUsername();
			String itemPassword = Users.get(i).getPassword();

			usernames.add(itemUsername);
			passwords.add(itemPassword);
		}

		if (usernames.contains(username)) {
			isUser = true;
		}

		if (passwords.contains(password)) {
			isPassword = true;
		}

		if (isUser == true && isPassword == true) {
			ModelAndView modelAdmin = new ModelAndView("admin");

			modelAdmin.setViewName("admin");

			modelAdmin.addObject("username", username);

			return modelAdmin;
		} else {
			ModelAndView modelLoginError = new ModelAndView("elogin");

			modelLoginError.setViewName("elogin");

			return modelLoginError;
		}

	}

	@RequestMapping(value = "/gestion")
	public ModelAndView goToGestion(ModelMap modelMap) throws IOException {
		ModelAndView model = new ModelAndView("gestion");

		model.setViewName("gestion");

		return model;
	}

	@RequestMapping(value = "/alta")
	public ModelAndView goToAlta(ModelMap modelMap) throws IOException {
		System.out.println("DEBUG: Esto es Alta");

		ModelAndView model = new ModelAndView("alta");

		model.setViewName("alta");

		return model;
	}

	@RequestMapping(value = "/alta2")
	public ModelAndView goToAltaSecondStep(ModelMap modelMap, @RequestParam("id_campa") String idCampagna,
			@RequestParam("nom_campa") String nombre, @RequestParam("data_ini") String dateIni,
			@RequestParam("data_fin") String dateFin, @RequestParam("hora_ini") String horaIni,
			@RequestParam("hora_fin") String horaFin, @RequestParam("tipo_attach") String typeCampagna,
			@RequestParam("comodin") String comodin, @RequestParam("commentario") String comment) throws IOException {

		System.out.println("DEBUG: Esto es Alta2");
		ciutadaDAO.tableCampagna(idCampagna, nombre, dateIni, dateFin, horaIni, horaFin, typeCampagna, comodin,
				comment);

		ModelAndView model = new ModelAndView("alta2");

		model.setViewName("alta2");

		modelMap.addAttribute("idCampagna", idCampagna);

		return model;
	}

	// @RequestMapping(value = "/altaFinal")
	// public ModelAndView goToAltaFinal(ModelMap modelMap) throws IOException {
	// ModelAndView model = new ModelAndView("altaFinal");
	//
	// model.setViewName("altaFinal");
	//
	// return model;
	// }

	/*
	 * @RequestMapping(value = "/upload", method = RequestMethod.POST) public
	 * ModelAndView singleFileUpload(
	 * 
	 * @RequestParam("csv") MultipartFile file @RequestParam("url_campa") String
	 * urlEnq, RedirectAttributes redirectAttributes) {
	 * 
	 * ModelAndView model = new ModelAndView("upload");
	 * 
	 * model.setViewName("upload");
	 * 
	 * return model;
	 * 
	 * }
	 */

	/*
	 * @RequestMapping(value = "/upload", method = RequestMethod.POST)
	 * // @PostMapping("/upload") // //new annotation since 4.3 // public
	 * ModelAndView singleFileUpload(@RequestParam("csv") MultipartFile // file,
	 * // RedirectAttributes redirectAttributes) { public ModelAndView
	 * singleFileUpload(@RequestParam("csv") File csv) {
	 * 
	 * System.out.println("DEBUG: Esto es upload");
	 * 
	 * FileReader fr = null; BufferedReader br = null; String line = ""; String
	 * cvsSplitBy = ";"; System.out.println("File " + csv.toString() + " :" +
	 * csv.getAbsolutePath() + " Is File?: " + csv.isFile());
	 * 
	 * try { fr = new FileReader(csv); br = new BufferedReader(fr);
	 * ArrayList<CiutadaTest> ciutadansList = new ArrayList<>();
	 * 
	 * br.readLine(); // First line is header, so we do readLine in order // to
	 * increment pointer while ((line = br.readLine()) != null) {
	 * 
	 * // use comma as separator String[] campos = line.split(cvsSplitBy);
	 * 
	 * String date = Utils.transformFormatDate(campos[7]);
	 * 
	 * CiutadaTest ciutada = new CiutadaTest(Integer.parseInt(campos[0]),
	 * campos[1], campos[2], campos[3], campos[4], campos[5], campos[6], date,
	 * campos[8], campos[9]);
	 * 
	 * System.out.println("Ciutada main " + ciutada);
	 * ciutadansList.add(ciutada);
	 * 
	 * } ciutadaDAO.updateCiutada(ciutadansList);
	 * 
	 * } catch (FileNotFoundException e) { e.printStackTrace(); } catch
	 * (IOException e) { e.printStackTrace(); } finally { if (br != null) { try
	 * { br.close(); } catch (IOException e) { e.printStackTrace(); } } }
	 * 
	 * 
	 * if (file.isEmpty()) {
	 * 
	 * redirectAttributes.addFlashAttribute("message",
	 * "Please select a file to upload"); ModelAndView modelAlta = new
	 * ModelAndView("alta2");
	 * 
	 * modelAlta.setViewName("alta2");
	 * 
	 * // modelMap.addAttribute("idCampagna", idCampagna);
	 * 
	 * return modelAlta; }
	 * 
	 * 
	 * ModelAndView model = new ModelAndView("upload");
	 * 
	 * model.setViewName("upload");
	 * 
	 * return model; }
	 */

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public @ResponseBody String singleFileUpload(@RequestParam("csv") MultipartFile file) {

		System.out.println("DEBUG: Esto es upload");
		String name2 = file.getName();

		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				File dir = new File(rootPath + File.separator + "tmpFiles");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath() + File.separator + name2);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				// logger.info("Server File Location=" +
				// serverFile.getAbsolutePath());

				System.out.println("Server File Location=" + serverFile.getAbsolutePath());

				return "You successfully uploaded file=" + name2;
			} catch (Exception e) {
				return "You failed to upload " + name2 + " => " + e.getMessage();
			}
		} else {
			return "You failed to upload " + name2 + " because the file was empty.";
		}
	}

	// @GetMapping("/uploadStatus")
	// public String uploadStatus() {
	// return "uploadStatus";
	// }

	@RequestMapping(value = "/modificacion")
	public ModelAndView goToModificacion(ModelMap modelMap) throws IOException {
		ModelAndView model = new ModelAndView("modificacion");

		model.setViewName("modificacion");

		return model;
	}

	@RequestMapping(value = "/gracias")
	public ModelAndView agradecer(ModelMap modelMap) throws IOException {
		ModelAndView model = new ModelAndView("gracias");

		model.setViewName("gracias");

		return model;
	}

	@RequestMapping(value = "/mailing")
	public ModelAndView mailing(ModelMap modelMap) throws IOException {
		ModelAndView model = new ModelAndView("mailing");

		model.setViewName("mailing");

		List<Campagna> campagnas = ciutadaDAO.getCampagnas();

		List<String> campagnaIds = new ArrayList<>();

		for (int i = 0; i < campagnas.size(); i++) {
			String itemCampagna = campagnas.get(i).getIdCampagna();

			campagnaIds.add(itemCampagna);
		}

		modelMap.addAttribute("campagnas", campagnaIds);

		return model;
	}

	@RequestMapping(value = "/report")
	public ModelAndView goToReport(ModelMap modelMap) throws IOException {
		ModelAndView model = new ModelAndView("report");

		model.setViewName("report");

		List<Campagna> campagnas = ciutadaDAO.getCampagnas();

		List<String> campagnaIds = new ArrayList<>();

		for (int i = 0; i < campagnas.size(); i++) {
			String itemCampagna = campagnas.get(i).getIdCampagna();

			campagnaIds.add(itemCampagna);
		}

		modelMap.addAttribute("campagnas", campagnaIds);

		return model;
	}

	@RequestMapping(value = "/downloadCSV")
	public void downloadCSV(@RequestParam("idCampagna") String idCampagna, HttpServletResponse response,
			ModelMap modelMap) throws IOException, SQLException {

		// if (idCampagna.equals("0")) {
		//
		// } else {
		String csvFileName = "report.csv";

		response.setContentType("text/csv");

		// String reportName = "CSV_Report_Name.csv";
		// response.setHeader("Content-disposition",
		// "attachment;filename="+reportName);

		String headerKey = "Content-Disposition";
		String headerValue = String.format("attachment; filename=\"%s\"", csvFileName);
		response.setHeader(headerKey, headerValue);

		// String csv = "data.csv";
		// CSVWriter writer = new CSVWriter(new FileWriter(csv));

		// ICsvBeanWriter csvWriter = new
		// CsvBeanWriter(response.getWriter(),
		// CsvPreference.STANDARD_PREFERENCE);

		String headers = "\"CIUTADA_ID\";\"ID_CAMPAGNA\";\"HASHGENERADO\";\"MAILENVIADO\";\"ENTRADO\";\"ISVALIDACION\";\"ISBAJA\";\"VERIFICADO\";\"ENCUESTADO\";\"ECNUESTACONEXITO\"";
		// csvWriter.writeHeader(header);
		//
		List<Ciutada> ciutadanos = ciutadaDAO.getDataCiutadaRep(idCampagna);

		List<String> listCiut = new ArrayList<>();

		ArrayList<String> rows = new ArrayList<String>();

		for (int i = 0; i < ciutadanos.size(); i++) {
			Ciutada ciut = ciutadanos.get(i);
			String anciut = Utils.toStringControl(ciut);
			// System.out.println("Ciutadano " + ciut);
			listCiut.add(anciut);
			System.out.println("Ciutadano campagna " + ciut.getIdCampagna());
			rows.add(anciut);
		}

		// ResultSet result = ciutadaDAO.getDataCiutadano(idCampagna);

		// writer.writeAll(result, true);

		// for (Ciutada aCiutada : ciutadanos) {
		// csvWriter.write(aCiutada, header);
		//
		// writer.writeAll(result, true);
		// }
		// csvWriter.close();

		response.getOutputStream().print(headers);
		response.getOutputStream().print("\n");

		Iterator<String> iter = rows.iterator();
		while (iter.hasNext()) {
			String outputString = iter.next();
			response.getOutputStream().print(outputString);
			response.getOutputStream().print("\n");
		}

		response.getOutputStream().flush();

		// List<Campagna> campagnas = ciutadaDAO.getCampagnas();
		//
		// List<String> campagnaIds = new ArrayList<>();
		//
		// for (int i = 0; i < campagnas.size(); i++) {
		// String itemCampagna = campagnas.get(i).getIdCampagna();
		//
		// campagnaIds.add(itemCampagna);
		// }

		// }

	}

	@RequestMapping(value = "/downloadMailList")
	public void downloadMailList(@RequestParam("idCampagna") String idCampagna, HttpServletResponse response,
			ModelMap modelMap) throws IOException, SQLException {

		// if (idCampagna.equals("0")) {
		//
		// } else {
		String csvFileName = "report.csv";

		response.setContentType("text/csv");

		// String reportName = "CSV_Report_Name.csv";
		// response.setHeader("Content-disposition",
		// "attachment;filename="+reportName);

		String headerKey = "Content-Disposition";
		String headerValue = String.format("attachment; filename=\"%s\"", csvFileName);
		response.setHeader(headerKey, headerValue);

		// String csv = "data.csv";
		// CSVWriter writer = new CSVWriter(new FileWriter(csv));

		// ICsvBeanWriter csvWriter = new
		// CsvBeanWriter(response.getWriter(),
		// CsvPreference.STANDARD_PREFERENCE);

		String linkHash = "";
		String anciut = "";

		if (idCampagna.contains("A")) {
			linkHash = "\"LINK_HASH\"";
		} else if (idCampagna.contains("B")) {
			linkHash = "\"LINK_HASH_PDF\"";
		}

		// String headers =
		// "\"CIUTADA_ID\";\"ID_CAMPAGNA\";\"HASHGENERADO\";\"MAILENVIADO\";\"ENTRADO\";\"ISVALIDACION\";\"ISBAJA\";\"VERIFICADO\";\"ENCUESTADO\";\"ECNUESTACONEXITO\"";
		String headers = "\"NOM_CIUTADA\";\"PRIMER_COGNOM_CIUTADA\";\"EMAIL\";" + linkHash;

		// String headers =
		// "\"CIUTADA_ID\";\"ID_CAMPAGNA\";\"HASHGENERADO\";\"MAILENVIADO\";\"ENTRADO\";\"ISVALIDACION\";\"ISBAJA\";\"VERIFICADO\";\"ENCUESTADO\";\"ECNUESTACONEXITO\"";
		// csvWriter.writeHeader(header);
		//
		List<Ciutada> ciutadanos = ciutadaDAO.getDataCiutadaRep(idCampagna);

		List<String> listCiut = new ArrayList<>();

		ArrayList<String> rows = new ArrayList<String>();

		for (int i = 0; i < ciutadanos.size(); i++) {
			Ciutada ciut = ciutadanos.get(i);
			if (idCampagna.contains("A")) {
				anciut = Utils.toStringHashLink(ciut);
			} else if (idCampagna.contains("B")) {
				anciut = Utils.toStringHashLinkPdf(ciut);
			}

			// System.out.println("Ciutadano " + ciut);
			listCiut.add(anciut);
			System.out.println("Ciutadano campagna " + ciut.getNom_ciutada());
			rows.add(anciut);
		}

		// ResultSet result = ciutadaDAO.getDataCiutadano(idCampagna);

		// writer.writeAll(result, true);

		// for (Ciutada aCiutada : ciutadanos) {
		// csvWriter.write(aCiutada, header);
		//
		// writer.writeAll(result, true);
		// }
		// csvWriter.close();

		response.getOutputStream().print(headers);
		response.getOutputStream().print("\n");

		Iterator<String> iter = rows.iterator();
		while (iter.hasNext()) {
			String outputString = iter.next();
			response.getOutputStream().print(outputString);
			response.getOutputStream().print("\n");
		}

		response.getOutputStream().flush();

		// List<Campagna> campagnas = ciutadaDAO.getCampagnas();
		//
		// List<String> campagnaIds = new ArrayList<>();
		//
		// for (int i = 0; i < campagnas.size(); i++) {
		// String itemCampagna = campagnas.get(i).getIdCampagna();
		//
		// campagnaIds.add(itemCampagna);
		// }

		// }

	}

}
