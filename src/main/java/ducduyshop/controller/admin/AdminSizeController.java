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
import ducduyshop.entity.Size;
import ducduyshop.service.IPaginationService;
import ducduyshop.service.ISizeService;

@Controller
public class AdminSizeController extends AdminBaseController {
	
	@Autowired
	private IPaginationService paginationService;
	
	@Autowired
	private ISizeService sizeService;
	
	@RequestMapping("/admin/size")
	public ModelAndView Index() {
		mv.setViewName("admin/size/index");
		try {
			int totalData = sizeService.getSizeData().size();
			PaginationDto paginationIfo = paginationService.getInfoPagination(totalData, limit, 1);
			List<Size> pagination = sizeService.getSizePagination(paginationIfo.getStart(), limit);
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
	
	@RequestMapping("/admin/sizeP{current}")
	public ModelAndView IndexPagination(@PathVariable int current) {
		mv.setViewName("admin/size/index");
		try {
			int totalData = sizeService.getSizeData().size();
			PaginationDto paginationIfo = paginationService.getInfoPagination(totalData, limit, current);
			List<Size> pagination = sizeService.getSizePagination(paginationIfo.getStart(), limit);
			mv.addObject("paginationinfo", paginationIfo);
			mv.addObject("pagination", pagination);
			return mv;
		}
		catch (Exception e) {
			e.printStackTrace();
			return mv;
		}
	}
	
	@RequestMapping(value = "/admin/createsize", method = RequestMethod.GET)
	public ModelAndView Create() {
		mv.setViewName("admin/size/create");
		mv.addObject("newsize", new Size());
		return mv;
	}
	
	@RequestMapping(value="/admin/createsize", method = RequestMethod.POST)
	public ModelAndView Create(@ModelAttribute("newsize") Size size, HttpSession s) {
		mv.setViewName("/admin/size/create");
		try {
			sizeService.create(size);
			mv.setViewName("redirect:/admin/size");
			return mv;
		}
		catch (Exception e) {
			e.printStackTrace();
			return mv;
		}
	}
	
	@RequestMapping(value = "/admin/editsize{id}", method = RequestMethod.GET)
	public ModelAndView Edit(@PathVariable int id) {
		mv.setViewName("/admin/size/edit");
		mv.addObject("editsize", sizeService.getSizeById(id));
		return mv;
	}
	
	@RequestMapping(value = "/admin/editsize{id}", method = RequestMethod.POST)
	public ModelAndView Edit(@PathVariable int id, @ModelAttribute("editsize") Size size, HttpSession s) {
		mv.setViewName("/admin/size/edit");
		try {
			sizeService.edit(size);
			mv.setViewName("redirect:/admin/size");
			return mv;
		}
		catch (Exception e) {
			e.printStackTrace();
			return mv;
		}
	}
	
	@RequestMapping(value = "/admin/deletesize{id}", method = RequestMethod.GET)
	public ModelAndView Delete(@PathVariable int id) {
		mv.setViewName("admin/size/delete");
		mv.addObject("deletesize", sizeService.getSizeById(id));
		return mv;
	}
	
	@RequestMapping(value = "/admin/deletesize{id}", method = RequestMethod.POST)
	public ModelAndView Delete(@PathVariable int id, @ModelAttribute("deletesize") Size size, HttpSession s) {
		mv.setViewName("admin/size/delete");
		try {
			sizeService.delete(id);
			mv.setViewName("redirect:/admin/size");
			return mv;
		}
		catch (Exception e) {
			e.printStackTrace();
			return mv;
		}
	}
}
