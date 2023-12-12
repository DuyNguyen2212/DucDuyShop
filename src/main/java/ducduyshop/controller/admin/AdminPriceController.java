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
import ducduyshop.entity.Price;
import ducduyshop.service.IPaginationService;
import ducduyshop.service.IPriceService;

@Controller
public class AdminPriceController extends AdminBaseController {
	
	@Autowired
	private IPriceService priceService;
	
	@Autowired
	private IPaginationService paginationService;
	
	@RequestMapping("/admin/price")
	public ModelAndView Index() {
		mv.setViewName("admin/price/index");
		try {
			int totalData = priceService.getPrices().size();
			PaginationDto paginationIfo = paginationService.getInfoPagination(totalData, limit, 1);
			List<Price> pagination = priceService.getPricesPagination(paginationIfo.getStart(), limit);
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
	
	@RequestMapping("/admin/priceP{current}")
	public ModelAndView IndexPagination(@PathVariable int current) {
		mv.setViewName("admin/price/index");
		try {
			int totalData = priceService.getPrices().size();
			PaginationDto paginationIfo = paginationService.getInfoPagination(totalData, limit, current);
			List<Price> pagination = priceService.getPricesPagination(paginationIfo.getStart(), limit);
			mv.addObject("paginationinfo", paginationIfo);
			mv.addObject("pagination", pagination);
			return mv;
		}
		catch (Exception e) {
			e.printStackTrace();
			return mv;
		}
	}
	
	@RequestMapping(value = "/admin/createprice", method = RequestMethod.GET)
	public ModelAndView Create() {
		mv.setViewName("admin/price/create");
		mv.addObject("newprice", new Price());
		return mv;
	}
	
	@RequestMapping(value="/admin/createprice", method = RequestMethod.POST)
	public ModelAndView Create(@ModelAttribute("newprice") Price price, HttpSession s) {
		mv.setViewName("/admin/price/create");
		try {
			priceService.create(price);
			mv.setViewName("redirect:/admin/price");
			return mv;
		}
		catch (Exception e) {
			e.printStackTrace();
			return mv;
		}
	}
	
	@RequestMapping(value = "/admin/editprice{id}", method = RequestMethod.GET)
	public ModelAndView Edit(@PathVariable int id) {
		mv.setViewName("/admin/price/edit");
		mv.addObject("editprice", priceService.getPriceById(id));
		return mv;
	}
	
	@RequestMapping(value = "/admin/editprice{id}", method = RequestMethod.POST)
	public ModelAndView Edit(@PathVariable int id, @ModelAttribute("editprice") Price price, HttpSession s) {
		mv.setViewName("/admin/price/edit");
		try {
			priceService.edit(price);
			mv.setViewName("redirect:/admin/price");
			return mv;
		}
		catch (Exception e) {
			e.printStackTrace();
			return mv;
		}
	}
	
	@RequestMapping(value = "/admin/deleteprice{id}", method = RequestMethod.GET)
	public ModelAndView Delete(@PathVariable int id) {
		mv.setViewName("admin/price/delete");
		mv.addObject("deleteprice", priceService.getPriceById(id));
		return mv;
	}
	
	@RequestMapping(value = "/admin/deleteprice{id}", method = RequestMethod.POST)
	public ModelAndView Delete(@PathVariable int id, @ModelAttribute("deleteprice") Price price, HttpSession s) {
		mv.setViewName("admin/price/delete");
		try {
			priceService.delete(id);
			mv.setViewName("redirect:/admin/price");
			return mv;
		}
		catch (Exception e) {
			e.printStackTrace();
			return mv;
		}
	}
}
