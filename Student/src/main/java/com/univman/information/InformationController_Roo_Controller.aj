// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.univman.information;

import com.univman.information.Information;
import com.univman.information.InformationController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect InformationController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String InformationController.create(@Valid Information information, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, information);
            return "informations/create";
        }
        uiModel.asMap().clear();
        information.persist();
        return "redirect:/informations/" + encodeUrlPathSegment(information.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String InformationController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Information());
        return "informations/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String InformationController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("information", Information.findInformation(id));
        uiModel.addAttribute("itemId", id);
        return "informations/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String InformationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("informations", Information.findInformationEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Information.countInformations() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("informations", Information.findAllInformations(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "informations/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String InformationController.update(@Valid Information information, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, information);
            return "informations/update";
        }
        uiModel.asMap().clear();
        information.merge();
        return "redirect:/informations/" + encodeUrlPathSegment(information.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String InformationController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Information.findInformation(id));
        return "informations/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String InformationController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Information information = Information.findInformation(id);
        information.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/informations";
    }
    
    void InformationController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("information_informationdate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void InformationController.populateEditForm(Model uiModel, Information information) {
        uiModel.addAttribute("information", information);
        addDateTimeFormatPatterns(uiModel);
    }
    
    String InformationController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
