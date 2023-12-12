package ducduyshop.controller.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ducduyshop.dto.PaginationDto;
import ducduyshop.entity.Category;
import ducduyshop.service.ICategoryService;
import ducduyshop.service.IImageService;
import ducduyshop.service.IPaginationService;
import ducduyshop.service.IProductService;

@Controller
public class AdminCategoryController extends AdminBaseController {
	@Autowired
	private IProductService productService;
	
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private IImageService imageService;
	
	@Autowired
	private IPaginationService paginationService;
	
	@RequestMapping("/admin/category")
	public ModelAndView Index() {
		mv.setViewName("admin/category/index");
		try {
			int totalData = categoryService.getCategoriesData().size();
			PaginationDto paginationIfo = paginationService.getInfoPagination(totalData, limit, 1);
			List<Category> pagination = categoryService.getCategoriesDataPagination(paginationIfo.getStart(), limit);
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
	
	@RequestMapping("/admin/categoryP{current}")
	public ModelAndView IndexPagination(@PathVariable int current) {
		mv.setViewName("admin/category/index");
		try {
			int totalData = categoryService.getCategoriesData().size();
			PaginationDto paginationIfo = paginationService.getInfoPagination(totalData, limit, current);
			List<Category> pagination = categoryService.getCategoriesDataPagination(paginationIfo.getStart(), limit);
			mv.addObject("paginationinfo", paginationIfo);
			mv.addObject("pagination", pagination);
			return mv;
		}
		catch (Exception e) {
			e.printStackTrace();
			return mv;
		}
	}
	
	@RequestMapping(value = "/admin/createcategory", method = RequestMethod.GET)
	public ModelAndView Create() {
		mv.setViewName("admin/category/create");
		mv.addObject("newcategory", new Category());
		return mv;
	}
	
	@RequestMapping(value="/admin/createcategory", method = RequestMethod.POST)
	public ModelAndView Create(@ModelAttribute("newcategory") Category category, HttpSession s) {
		mv.setViewName("/admin/category/create");
		try {
			categoryService.create(category);
			mv.setViewName("redirect:/admin/category");
			return mv;
		}
		catch (Exception e) {
			e.printStackTrace();
			return mv;
		}
	}
	
	@RequestMapping(value = "/admin/editcategory{id}", method = RequestMethod.GET)
	public ModelAndView Edit(@PathVariable int id) {
		mv.setViewName("/admin/category/edit");
		mv.addObject("editcategory", categoryService.getCategoryByCatid(id));
		return mv;
	}
	
	@RequestMapping(value = "/admin/editcategory{id}", method = RequestMethod.POST)
	public ModelAndView Edit(@PathVariable int id, @ModelAttribute("editcategory") Category category, HttpSession s) {
		mv.setViewName("/admin/category/edit");
		try {
			categoryService.edit(category);
			mv.setViewName("redirect:/admin/category");
			return mv;
		}
		catch (Exception e) {
			e.printStackTrace();
			return mv;
		}
	}
	
	@RequestMapping(value = "/admin/deletecategory{id}", method = RequestMethod.GET)
	public ModelAndView Delete(@PathVariable int id) {
		mv.setViewName("admin/category/delete");
		mv.addObject("deletecategory", categoryService.getCategoryByCatid(id));
		return mv;
	}
	
	@RequestMapping(value = "/admin/deletecategory{id}", method = RequestMethod.POST)
	public ModelAndView Delete(@PathVariable int id, @ModelAttribute("deletecategory") Category category, HttpSession s) {
		mv.setViewName("admin/category/delete");
		try {
			categoryService.delete(id);
			mv.setViewName("redirect:/admin/category");
			return mv;
		}
		catch (Exception e) {
			e.printStackTrace();
			return mv;
		}
	}
}
