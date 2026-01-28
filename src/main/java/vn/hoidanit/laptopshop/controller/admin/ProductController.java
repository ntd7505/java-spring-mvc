package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;

@Controller
public class ProductController {
    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    // Home
    @GetMapping("/admin/product")
    public String getDashboard(Model model, @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
        Pageable pageable = PageRequest.of(page - 1, 2);
        Page<Product> prs = this.productService.gellALlProducts(pageable);
        List<Product> listProduct = prs.getContent();
        model.addAttribute("product", prs.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPage", prs.getTotalPages());
        return "/admin/product/show";
    }

    // form register
    @GetMapping("/admin/product/create")
    public String getCreateProduct(Model model) {
        model.addAttribute("newProducts", new Product());
        return "/admin/product/create";
    }

    // Save product
    @PostMapping(value = "/admin/product/create")
    public String saveProducts(Model model, @ModelAttribute("newProducts") @Valid Product newProduct,
                               BindingResult newProductsBindingResult, @RequestParam("hoidanitFile") MultipartFile file) {
        List<FieldError> errors = newProductsBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>> " + error.getField() + " - " + error.getDefaultMessage());
        }
        if (newProductsBindingResult.hasErrors()) {
            return "/admin/product/create";
        }
        String image = this.uploadService.handleUploadFile(file, "product");
        newProduct.setImage(image);
        this.productService.saveProducts(newProduct);
        return "redirect:/admin/product";
    }

    // show details
    @GetMapping("/admin/product/{id}")
    public String getDetailProduct(Model model, @PathVariable long id) {
        Product product = this.productService.handleFindById(id);
        model.addAttribute("Product", product);
        model.addAttribute("id", id);
        return "/admin/product/detail";
    }

    @GetMapping("admin/product/delete/{id}")
    public String deleteProductPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("dProduct", new Product());
        return "/admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteProduct(Model model, @ModelAttribute("dProduct") Product dProduct) {
        this.productService.dhandleDeleteById(dProduct.getId());
        return "redirect:/admin/product";
    }

    // update
    @GetMapping("/admin/product/update/{id}")
    public String updateProductPage(Model model, @PathVariable long id) {
        Product currentProduct = this.productService.handleFindById(id);
        model.addAttribute("newProduct", currentProduct);
        return "/admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String postUpdateProduct(Model model, @ModelAttribute("newProduct") Product products,
                                    @RequestParam("hoidanitFile") MultipartFile file) {
        Product currentProduct = this.productService.handleFindById(products.getId());

        if (currentProduct != null) {
            currentProduct.setName(products.getName());
            currentProduct.setPrice(products.getPrice());
            currentProduct.setDetailDesc(products.getDetailDesc());
            currentProduct.setShortDesc(products.getShortDesc());
            currentProduct.setQuantity(products.getQuantity());
            currentProduct.setFactory(products.getFactory());
            currentProduct.setTarget(products.getTarget());
            if (file != null && !file.isEmpty()) {
                String img = uploadService.handleUploadFile(file, "product");
                currentProduct.setImage(img);

            }
            // else: không set gì để giữ image cũ

            this.productService.saveProducts(currentProduct);
        }
        return "redirect:/admin/product";
    }
}
