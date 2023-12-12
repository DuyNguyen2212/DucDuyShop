package ducduyshop.controller.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ducduyshop.dto.ProductDto;
import ducduyshop.entity.Company;
import ducduyshop.service.IBillDetailsService;
import ducduyshop.service.IProductService;
import ducduyshop.service.ISlideService;

@Controller
public class UserHomeController extends UserBaseController {
	
	@Autowired
	private ISlideService slideService;
	
	@Autowired
	private IProductService productService;
	
	@Autowired
	private IBillDetailsService billdetailsDervice;
	
	
	@RequestMapping(value = { "/", "/hompage" })
	public ModelAndView Index() {
		mv.setViewName("user/index");
		productService.updateNewProducts();

		List<Long> topsellProducts = billdetailsDervice.topSellProducts();
		for(Long id : topsellProducts) {
			productService.updateTopSellProducts(id);
		}
		List<Long> notTopSellProducts = billdetailsDervice.notTopSellProducts();
		for(Long id : notTopSellProducts) {
			productService.updateNotTopSellProducts(id);
		}
		
		List<Company> companies = companyService.get6CompaniesRandom();
		HashMap<Integer, Integer> proNumsByCom = new HashMap<Integer, Integer>();
		
		for (Company company : companies) {
			int k = 0;	
			List<ProductDto> products = productService.getProductsByCompanyId(company.getId());
			
			if(products == null) {
				k = 0;
			}
			else {
				k = products.size();
			}
			
			proNumsByCom.put(company.getId(), k);
		}
		
		mv.addObject("homepage", 1);
		mv.addObject("proNum", proNumsByCom);
		mv.addObject("randomCompanies", companies);
		mv.addObject("slides", slideService.getSlidesData());
		mv.addObject("products", productService.get16ProductsDistinct());
		mv.addObject("newproducts", productService.getNewProducts());
		mv.addObject("topsellproducts", productService.getTopSellProducts());
		return mv;
	}
}
