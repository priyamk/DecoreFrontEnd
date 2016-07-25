package com.homedecore.decore.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.homedecore.decore.dao.CategoryDAO;
import com.homedecore.decore.dao.ProductDAO;
import com.homedecore.decore.dao.SupplierDAO;
import com.homedecore.decore.model.Category;
import com.homedecore.decore.model.Product;
import com.homedecore.decore.model.Supplier;

@Controller
public class ProductController {

	@Autowired(required=true)
	private ProductDAO productDAO;

	@Autowired(required = true)
	private CategoryDAO categoryDAO;

	@Autowired(required = true)
	private SupplierDAO supplierDAO;

	
	@RequestMapping(value = "/products", method = RequestMethod.GET)
	public String listProducts(Model model) {
		model.addAttribute("isProductClicked", "TRUE");
		model.addAttribute("product", new Product());
		model.addAttribute("category", new Category());
		model.addAttribute("supplier", new Supplier());
		model.addAttribute("productList", this.productDAO.list());
		model.addAttribute("categoryList", this.categoryDAO.list());
		model.addAttribute("supplierList", this.supplierDAO.list());
		return "adminHome";
	}

	// For add and update product both
	@RequestMapping(value = "/product/add", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product ,HttpServletRequest request) {

		Category category = categoryDAO.getByName(product.getCategory().getName());
		categoryDAO.saveOrUpdate(category);  // why to save??

		Supplier supplier = supplierDAO.getByName(product.getSupplier().getName());
		supplierDAO.saveOrUpdate(supplier); // Why to save??
		
		
		
		product.setCategory(category);
		product.setSupplier(supplier);
		
		product.setCategory_id(category.getId());
		product.setSupplier_id(supplier.getId());
		productDAO.saveOrUpdate(product);
		System.out.println("controller");
		 MultipartFile productImage = product.getProductImage();
		 
		 String path = "C:/Users/priyam/workspace/Project/DecoreFrontEnd/src/main/webapp/resources/images/" + product.getId() +".jpg";
 
	        if(productImage != null && !productImage.isEmpty()){
	            try {
	            	File imgDirectory = new File(path);
	            	if(!imgDirectory.exists())
	            	{
	            		imgDirectory.mkdir();
	            	}
	                productImage.transferTo(imgDirectory);
	            } catch (Exception ex){
	                ex.printStackTrace();
	                throw new RuntimeException("Product image saving failed", ex);
	            }
	        }

		return "redirect:/products";

	}

	@RequestMapping("product/remove/{id}")
	public String removeProduct(@PathVariable("id") String id, ModelMap model, HttpServletRequest request) throws Exception {
		 
		
		 String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		Path path = Paths.get(rootDirectory + "/resources/images/" + id + ".png");
		
		if(Files.exists(path)){
	            try {
	                Files.delete(path);
	            } catch (Exception ex){
	                ex.printStackTrace();
	            }
	        }
		try {
			productDAO.delete(id);
			model.addAttribute("message", "Successfully Deleted");
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
		}
		// redirectAttrs.addFlashAttribute(arg0, arg1)
		return "redirect:/products";
	}

	@RequestMapping("product/edit/{id}")
	public String editProduct(@PathVariable("id") String id, Model model) {
		System.out.println("editProduct");
		model.addAttribute("isProductClicked", "TRUE");
		model.addAttribute("product", this.productDAO.get(id));
		model.addAttribute("productList", this.productDAO.list());
		model.addAttribute("categoryList", this.categoryDAO.list());
		model.addAttribute("supplierList", this.supplierDAO.list());
	
		return "adminHome";
	}
	
	@RequestMapping("product/get/{id}")
	public String getSelectedProduct(@PathVariable("id") String id, Model model) {
	
		model.addAttribute("selectedProduct", this.productDAO.get(id));
		model.addAttribute("categoryList", this.categoryDAO.list());
	
		return "userHome";
	
	}
	
	@RequestMapping("product/getMul/{id}")
	public String getProductByCategory(@PathVariable("id") String id, Model model) {
		
		model.addAttribute("products", this.productDAO.getByCategory(id));
		model.addAttribute("selectedCategory", this.categoryDAO.get(id));
		model.addAttribute("categoryList", this.categoryDAO.list());
	
		return "userHome";
	
	}
}
