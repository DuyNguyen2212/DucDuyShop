package ducduyshop.controller.user;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import ducduyshop.entity.Product;
import ducduyshop.service.ICategoryService;
import ducduyshop.service.ICompanyService;
import ducduyshop.service.IPriceService;

@Controller
public class UserBaseController {
	public ModelAndView mv = new ModelAndView();
	
	@Autowired
	public ICategoryService categoryService;
	
	@Autowired
	public ICompanyService companyService;
	
	@Autowired
	public IPriceService priceService;
	
	@PostConstruct
	public ModelAndView init() {
		mv.addObject("categories", categoryService.getCategoriesData());
		mv.addObject("companies", companyService.getCompaniesData());
		mv.addObject("prices", priceService.getPrices());
		mv.addObject("searchobject", new Product());
		return mv;
	}
}
