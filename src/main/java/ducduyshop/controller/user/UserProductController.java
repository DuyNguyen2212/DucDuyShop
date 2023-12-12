package ducduyshop.controller.user;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ducduyshop.dto.PaginationDto;
import ducduyshop.dto.ProductDto;
import ducduyshop.entity.Price;
import ducduyshop.entity.Product;
import ducduyshop.service.IPaginationService;
import ducduyshop.service.IPriceService;
import ducduyshop.service.IProductService;
import ducduyshop.service.ISizeService;

@Controller
public class UserProductController extends UserBaseController {
	@Autowired
	IProductService productService;
	
	@Autowired
	IPaginationService paginationServie;
	
	@Autowired
	ISizeService sizeService;
	
	private final int limit = 12;
	
	@RequestMapping("/all")
	public ModelAndView Index() {
		mv.setViewName("user/product/allproducts");
		int totalData = productService.getAllProductsDistinct().size();
		PaginationDto paginationInfo = new PaginationDto();
		List<ProductDto> pagination = new ArrayList<ProductDto>();
		if(totalData > 0) {
			paginationInfo = paginationServie.getInfoPagination(totalData, limit, 1);
			pagination = productService.getProductsPaginationForAll(paginationInfo.getStart(), limit);
		}
		mv.addObject("paginationinfo", paginationInfo);
		mv.addObject("pagination", pagination);
		return mv;
	}
	
	@RequestMapping("/all/p{current}")
	public ModelAndView IndexPagination(@PathVariable String current) {
		mv.setViewName("user/product/allproducts");
		int totalData = productService.getAllProductsDistinct().size();
		PaginationDto paginationInfo = new PaginationDto();
		List<ProductDto> pagination = new ArrayList<ProductDto>();
		if(totalData > 0) {
			paginationInfo = paginationServie.getInfoPagination(totalData, limit, Integer.parseInt(current));
			pagination = productService.getProductsPaginationForAll(paginationInfo.getStart(), limit);
		}
		mv.addObject("prices", getPrices());
		mv.addObject("paginationinfo", paginationInfo);
		mv.addObject("pagination", pagination);
		return mv;
	}
	
	@RequestMapping("/category{id}")
	public ModelAndView ProductsCategory(@PathVariable String id) {
		mv.setViewName("user/product/category");
		int totalData = productService.getProductsByCategoryId(Integer.parseInt(id)).size();
		PaginationDto paginationInfo = new PaginationDto();
		List<ProductDto> pagination = new ArrayList<ProductDto>();
		if(totalData > 0) {
			paginationInfo = paginationServie.getInfoPagination(totalData, limit, 1);
			pagination = productService.getProductsPaginationForCategory(Integer.parseInt(id), paginationInfo.getStart(), limit);
		}
		mv.addObject("paginationinfo", paginationInfo);
		mv.addObject("pagination", pagination);
		mv.addObject("catid", Integer.parseInt(id));
		mv.addObject("totaldata", totalData);
		mv.addObject("category", categoryService.getCategoryByCatid(Integer.parseInt(id)));
		return mv;
	}
	
	@RequestMapping("/category{id}/p{current}")
	public ModelAndView ProductsCategoryPagination(@PathVariable String id,@PathVariable String current) {
		mv.setViewName("user/product/category");
		int totalData = productService.getProductsByCategoryId(Integer.parseInt(id)).size();
		PaginationDto paginationInfo = new PaginationDto();
		List<ProductDto> pagination = new ArrayList<ProductDto>();
		if(totalData > 0) {
			paginationInfo = paginationServie.getInfoPagination(totalData, limit, Integer.parseInt(current));
			pagination = productService.getProductsPaginationForCategory(Integer.parseInt(id), paginationInfo.getStart(), limit);
		}
		mv.addObject("paginationinfo", paginationInfo);
		mv.addObject("pagination", pagination);
		mv.addObject("catid", Integer.parseInt(id));
		mv.addObject("totaldata", totalData);
		mv.addObject("category", categoryService.getCategoryByCatid(Integer.parseInt(id)));
		return mv;
	}
	
	@RequestMapping(value = "/company{id}", method = RequestMethod.GET)
	public ModelAndView ProductsCompany(@PathVariable String id) {
		mv.setViewName("user/product/company");
		int totalData = productService.getProductsByCompanyId(Integer.parseInt(id)).size();
		PaginationDto paginationInfo = new PaginationDto();
		List<ProductDto> pagination = new ArrayList<ProductDto>();
		if(totalData > 0) {
			paginationInfo = paginationServie.getInfoPagination(totalData, limit, 1);
			pagination = productService.getProductsPaginationForCompany(Integer.parseInt(id), paginationInfo.getStart(), limit);
		}
		mv.addObject("paginationinfo", paginationInfo);
		mv.addObject("pagination", pagination);
		mv.addObject("comid", Integer.parseInt(id));
		mv.addObject("totaldata", totalData);
		mv.addObject("company", companyService.getCompanyByCompanyId(Integer.parseInt(id)));
		return mv;
	}
	
	@RequestMapping("/company{id}/p{current}")
	public ModelAndView ProductsCompanyPagination(@PathVariable String id,@PathVariable String current) {
		mv.setViewName("user/product/company");
		int totalData = productService.getProductsByCompanyId(Integer.parseInt(id)).size();
		PaginationDto paginationInfo = new PaginationDto();
		List<ProductDto> pagination = new ArrayList<ProductDto>();
		if(totalData > 0) {
			paginationInfo = paginationServie.getInfoPagination(totalData, limit, Integer.parseInt(current));
			pagination = productService.getProductsPaginationForCompany(Integer.parseInt(id), paginationInfo.getStart(), limit);
		}
		mv.addObject("paginationinfo", paginationInfo);
		mv.addObject("pagination", pagination);
		mv.addObject("comid", Integer.parseInt(id));
		mv.addObject("totaldata", totalData);
		return mv;
	}
	
	@RequestMapping(value = "/price{id}_{from}_{to}", method = RequestMethod.GET)
	public ModelAndView ProductsPrice(@PathVariable int id, @PathVariable int from, @PathVariable int to) {
		mv.setViewName("user/product/price");
		int totalData = productService.getProductsByPrice(from, to).size();
		PaginationDto paginationInfo = new PaginationDto();
		List<Product> pagination = new ArrayList<Product>();
		if(totalData > 0) {
			paginationInfo = paginationServie.getInfoPagination(totalData, limit, 1);
			pagination = productService.getProductsByPriceForPagination(from, to, paginationInfo.getStart(), limit);
		}
		mv.addObject("paginationinfo", paginationInfo);
		mv.addObject("pagination", pagination);
		mv.addObject("priceid", id);
		mv.addObject("price", priceService.getPriceById(id));
		mv.addObject("totaldata", totalData);
		return mv;
	}
	
	@RequestMapping("/price{id}_{from}_{to}/p{current}")
	public ModelAndView ProductsPricePagination(@PathVariable int id, @PathVariable int from, @PathVariable int to, @PathVariable int current) {
		mv.setViewName("user/product/price");
		int totalData = productService.getProductsByPrice(from, to).size();
		PaginationDto paginationInfo = new PaginationDto();
		List<Product> pagination = new ArrayList<Product>();
		if(totalData > 0) {
			paginationInfo = paginationServie.getInfoPagination(totalData, limit, current);
			pagination = productService.getProductsByPriceForPagination(from, to, paginationInfo.getStart(), limit);
		}
		mv.addObject("paginationinfo", paginationInfo);
		mv.addObject("pagination", pagination);
		mv.addObject("priceid", id);
		mv.addObject("totaldata", totalData);
		return mv;
	}
	
	@RequestMapping("/details/{id}")
	public ModelAndView ProductDetails(@PathVariable long id) {
		mv.setViewName("user/product/details");
		int catid = productService.getTheProductById(id).getCategory_id();
		mv.addObject("productdetails", productService.getTheProductById(id));
		mv.addObject("productimages", productService.getImagesOfTheProduct(id));
		mv.addObject("relatedproducts", productService.getRelatedProductByCategoryId(catid, id));
		mv.addObject("sizes", sizeService.getSizeByProductsId(id));
		mv.addObject("listsize", sizeService.getSizeData());
		return mv;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public ModelAndView searchProducts(@ModelAttribute("searchobject") Product product) {
		mv.setViewName("user/product/search");
		try {
			String searchString = product.getName().trim();
			List<Product> all = productService.getProductsData();
			List<Product> search = productService.searchProducts(searchString);
			if(all.size() == search.size()) {
				searchString = "";
			}
			int totalData = productService.searchProducts(searchString).size();
			PaginationDto paginationInfo = paginationServie.getInfoPagination(totalData, limit, 1);
			List<Product> pagination = productService.searchProductsPagination(searchString, paginationInfo.getStart(), limit);
			mv.addObject("paginationinfo", paginationInfo);
			mv.addObject("pagination", pagination);
			mv.addObject("totaldata", totalData);
			mv.addObject("searchstring", searchString);
			return mv;
		}
		catch (Exception e) {
			e.printStackTrace();
			return mv;
		}
	}
	
	@RequestMapping(value = "/search{searchString}/p{current}", method = RequestMethod.GET)
	public ModelAndView searchProductsPagination(@PathVariable String searchString, @PathVariable int current) {
		mv.setViewName("user/product/search");
		int totalData = productService.searchProducts(searchString).size();
		PaginationDto paginationInfo = paginationServie.getInfoPagination(totalData, limit, current);
		List<Product> pagination = productService.searchProductsPagination(searchString, paginationInfo.getStart(), limit);
		mv.addObject("paginationinfo", paginationInfo);
		mv.addObject("pagination", pagination);
		mv.addObject("totaldata", totalData);
		return mv;
	}
	
	private List<Price> getPrices() {
		return priceService.getPrices();
	}
}
