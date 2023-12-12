package ducduyshop.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ducduyshop.dto.PaginationDto;
import ducduyshop.dto.ProductSize;
import ducduyshop.entity.Size;
import ducduyshop.service.IPaginationService;
import ducduyshop.service.IProductService;
import ducduyshop.service.ISizeService;

@Controller
public class AdminProductSizeController extends AdminBaseController {
	@Autowired
	private IPaginationService paginationService;
	
	@Autowired
	private ISizeService sizeService;
	
	@Autowired
	private IProductService productService;
	
	@RequestMapping("/admin/productsize")
	public ModelAndView Index() {
		mv.setViewName("admin/productsize/index");
		try {
			int totalData = sizeService.getProductSize().size();
			PaginationDto paginationIfo = paginationService.getInfoPagination(totalData, limit, 1);
			List<ProductSize> pagination = sizeService.getProductSizePagination(paginationIfo.getStart(), limit);
			mv.addObject("sizes", sizeService.getSizeData());
			mv.addObject("products", productService.getProductsData());
			mv.addObject("paginationinfo", paginationIfo);
			mv.addObject("totaldata", totalData);
			mv.addObject("pagination", pagination);
			return mv;
		}
		catch (Exception e) {
			e.printStackTrace();
			return mv;
		}
	}
	
	@RequestMapping("/admin/productsizeP{current}")
	public ModelAndView IndexPagination(@PathVariable int current) {
		mv.setViewName("admin/productsize/index");
		try {
			int totalData = sizeService.getProductSize().size();
			PaginationDto paginationIfo = paginationService.getInfoPagination(totalData, limit, current);
			List<ProductSize> pagination = sizeService.getProductSizePagination(paginationIfo.getStart(), limit);
			mv.addObject("sizes", sizeService.getSizeData());
			mv.addObject("products", productService.getProductsData());
			mv.addObject("paginationinfo", paginationIfo);
			mv.addObject("pagination", pagination);
			return mv;
		}
		catch (Exception e) {
			e.printStackTrace();
			return mv;
		}
	}
	
	@RequestMapping(value = "/admin/createproductsize", method = RequestMethod.GET)
	public ModelAndView Create() {
		mv.setViewName("admin/productsize/create");
		mv.addObject("newproductsize", new ProductSize());
		return mv;
	}
	
	@RequestMapping(value="/admin/createproductsize", method = RequestMethod.POST)
	public ModelAndView Create(@ModelAttribute("newproductsize") ProductSize size, HttpSession s) {
		mv.setViewName("/admin/productsize/create");
		try {
			sizeService.create(size);
			mv.setViewName("redirect:/admin/productsize");
			return mv;
		}
		catch (Exception e) {
			e.printStackTrace();
			return mv;
		}
	}
	
	@RequestMapping(value = "/admin/editproductsize{id}", method = RequestMethod.GET)
	public ModelAndView Edit(@PathVariable long id) {
		mv.setViewName("/admin/productsize/edit");
		mv.addObject("editproductsize", sizeService.getProductSizeById(id));
		return mv;
	}
	
	@RequestMapping(value = "/admin/editproductsize{id}", method = RequestMethod.POST)
	public ModelAndView Edit(@PathVariable long id, @ModelAttribute("editproductsize") ProductSize size, HttpSession s) {
		mv.setViewName("/admin/productsize/edit");
		try {
			sizeService.edit(size);
			mv.setViewName("redirect:/admin/productsize");
			return mv;
		}
		catch (Exception e) {
			e.printStackTrace();
			return mv;
		}
	}
	
	@RequestMapping(value = "/admin/deleteproductsize{id}", method = RequestMethod.GET)
	public ModelAndView Delete(@PathVariable long id) {
		mv.setViewName("admin/productsize/delete");
		mv.addObject("deleteproductsize", sizeService.getProductSizeById(id));
		return mv;
	}
	
	@RequestMapping(value = "/admin/deleteproductsize{id}", method = RequestMethod.POST)
	public ModelAndView Delete(@PathVariable long id, @ModelAttribute("deleteproductsize") Size size, HttpSession s) {
		mv.setViewName("admin/productsize/delete");
		try {
			sizeService.delete(id);
			mv.setViewName("redirect:/admin/productsize");
			return mv;
		}
		catch (Exception e) {
			e.printStackTrace();
			return mv;
		}
	}
}
