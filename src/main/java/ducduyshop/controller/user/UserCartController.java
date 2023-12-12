package ducduyshop.controller.user;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ducduyshop.dto.CartDto;
import ducduyshop.entity.Account;
import ducduyshop.entity.Bill;
import ducduyshop.entity.BillDetails;
import ducduyshop.entity.Product;
import ducduyshop.service.IBillDetailsService;
import ducduyshop.service.IBillService;
import ducduyshop.service.ICartService;
import ducduyshop.service.IProductService;
import ducduyshop.service.ISizeService;

@Controller
public class UserCartController extends UserBaseController {
	
	@Autowired
	ICartService cartService;
	
	@Autowired
	IBillService billService;
	
	@Autowired
	IBillDetailsService billdetailsService;
	
	@Autowired
	IProductService productService;
	
	@Autowired
	ISizeService sizeService;
	
	@RequestMapping("/cart")
	public ModelAndView Index() {
		mv.setViewName("user/cart/cart");
		mv.addObject("sizes", sizeService.getSizeData());
		return mv;
	}
	
	@RequestMapping(value = "/addcart", method = RequestMethod.GET)
	@ResponseBody
	public int addToCart(HttpSession session, HttpServletRequest request, HttpServletResponse respone) {
		List<CartDto> cart = (List<CartDto>) session.getAttribute("cart");
		Account accountSession = (Account) session.getAttribute("loginsession");
		String username = accountSession.getUsername();
		long id = Long.parseLong(request.getParameter("id"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int size_id = Integer.parseInt(request.getParameter("size"));
		if(cart == null) {
			cart = new ArrayList<CartDto>();
		}
		cart = cartService.addToCart(id, quantity, size_id, cart, username);
		session.setAttribute("cart", cart);
		session.setAttribute("totalQuantity", cartService.totalQuantity(cart));
		session.setAttribute("totalPrice", cartService.totalPrice(cart));
		int size = cartService.getCartsDataByUsername(username).size();
		return size;
	}
	
	@RequestMapping(value = "/edit-item", method = RequestMethod.GET)
	@ResponseBody
	public List<CartDto> editCartItem(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		List<CartDto> cart = (List<CartDto>) session.getAttribute("cart");
		Account accountSession = (Account) session.getAttribute("loginsession");
		String username = accountSession.getUsername();
		long id = Long.parseLong(request.getParameter("id"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int size_id = Integer.parseInt(request.getParameter("size_id"));
		cart = cartService.editCartItem(id, quantity, size_id, cart, username);
		session.setAttribute("cart", cart);
		session.setAttribute("totalQuantity", cartService.totalQuantity(cart));
		session.setAttribute("totalPrice", cartService.totalPrice(cart));
		return cart;
	}
	
	@RequestMapping("delete-item/{id}/{size_id}")
	public String deleteCartItem(HttpSession session, HttpServletRequest request, @PathVariable long id, @PathVariable int size_id) {
		List<CartDto> cart = (List<CartDto>) session.getAttribute("cart");
		Account accountSession = (Account) session.getAttribute("loginsession");
		String username = accountSession.getUsername();
		cart = cartService.deleteCartItem(id, size_id, cart, username);
		session.setAttribute("cart", cart);
		session.setAttribute("totalQuantity", cartService.totalQuantity(cart));
		session.setAttribute("totalPrice", cartService.totalPrice(cart));
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public ModelAndView checkOut(HttpSession session) {
		mv.setViewName("user/cart/checkout");
		Bill bill = new Bill();
		Account loginaccount = (Account) session.getAttribute("loginsession");
		if(loginaccount != null) {
			bill.setUsername(loginaccount.getUsername());
		}
		mv.addObject("bill", bill);
		return mv;
	}
	
	@RequestMapping(value = "/checkout", method = RequestMethod.POST)
	public ModelAndView checkOut(HttpSession session, @ModelAttribute("bill") Bill bill) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/cart/cart");
		mv.addObject("searchobject", new Product());
		mv.addObject("companies", companyService.getCompaniesData());
		Account account = (Account) session.getAttribute("loginsession");
		String username = account.getUsername();
		bill.setQuantity(Integer.parseInt(session.getAttribute("totalQuantity").toString()));
		bill.setTotal(BigDecimal.valueOf(Double.parseDouble(session.getAttribute("totalPrice").toString())).setScale(2,	RoundingMode.HALF_UP));
		bill.setCreateat(formattedCurrentDate());
		String mailUsername = bill.getUsername();
		bill.setUsername(username);
		bill.setStatus(false);
		try {		
			int insert = billService.addBill(bill);
			if(insert > 0) {
				long id = billService.getTheLastBillId();
				List<CartDto> cart = (List<CartDto>)session.getAttribute("cart");
				long k = 0;
				for(CartDto item : cart) {
					BillDetails billdetails = new BillDetails();
					Product product = productService.getProductById(item.getProduct().getId());
					billdetails.setBill_id(id);
					billdetails.setProduct_id(item.getProduct().getId());
					billdetails.setQuantity(item.getQuantity());
					productService.updateQuantity(item.getProduct().getId(), product.getQuantity() - item.getQuantity());
					billdetails.setTotal(item.getTotalPrice());
					billdetailsService.addBillDetails(billdetails);
				}
				sendMail(BigDecimal.valueOf(Double.parseDouble(session.getAttribute("totalPrice").toString())).setScale(2, RoundingMode.HALF_UP), mailUsername);
				session.removeAttribute("cart");
				cartService.deleteCartByUsername(username);
				mv.addObject("success", true);
				return mv;
			}
			return mv;
		}
		catch (Exception e) {
			e.printStackTrace();
			return mv;
		}
	}
	
	public void sendMail(BigDecimal totalPrice, String email) {
		final String username = "duygiaosu2212@gmail.com";
        final String password = "mgtgpilvlgjfuvcv";

        Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS
        
        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        
        try {
        	
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("hiroshop76@gmail.com"));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(email)
            );
            message.setSubject("Đơn hàng của bạn", "utf-8");
            message.setText("Đơn hàng của bạn  " + totalPrice + " vnđ được đặt thành công!" 
                    + "\n\n Please do not spam my email!", "utf-8");

            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
	}
	
	public String formattedCurrentDate() {
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String nowString = now.format(df);
		return nowString;
	}
}
