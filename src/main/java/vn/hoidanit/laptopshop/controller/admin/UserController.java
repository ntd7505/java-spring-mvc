package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class UserController {
    private final UserService userService;
    private final UploadService uploadService;
    private PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService,
                          PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        List<User> listUsers = this.userService.getAllUserByEmail("nguyendat2knam@gmail.com");
        System.out.println(listUsers);
        model.addAttribute("newUser", "jkasbfd");
        return "hello";
    }

    // CRUD
    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUser();
        model.addAttribute("users1", users);
        return "/admin/user/show";
    }

    // lay thong tin
    @RequestMapping("/admin/user/{id}")
    public String getDetailsPage(Model model, @PathVariable Long id) {
        System.out.println("Check path id: " + id);
        User user = this.userService.handleFindByID(id);
        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "/admin/user/detail";
    }

    // form register
    @RequestMapping("/admin/user/create")
    public String getCreatePage(Model model) {
        model.addAttribute("newUser", new User());
        return "/admin/user/create";
    }

    // Post thong tin dang ky
    @PostMapping(value = "/admin/user/create1")
    public String createUserPage(Model model,
                                 @ModelAttribute("newUser") @Valid User hoidanit,
                                 BindingResult newUsersBindingResult,
                                 @RequestParam("hoidanitFile") MultipartFile file) {
//        List<FieldError> errors = newUsersBindingResult.getFieldErrors();
//        for (FieldError error : errors) {
//            System.out.println(">>>> " + error.getField() + " - " + error.getDefaultMessage());
//        }
        // List<FieldError> errors = newUserBindingResult.getFieldErrors();
        // for (FieldError error : errors) {
        // System.out.println(" >>>>>>> " + error.getField() + " - " +
        // error.getDefaultMessage());
        // }
        // Validate

        if (newUsersBindingResult.hasErrors()) {
            return "/admin/user/create";
        }

        String fileName = this.uploadService.handleUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(hoidanit.getPassword());
        hoidanit.setAvatar(fileName);
        hoidanit.setPassword(hashPassword);
        hoidanit.setRole(this.userService.getRoleByName(hoidanit.getRole().getName()));
        this.userService.handleSaveUser(hoidanit);
        return "redirect:/admin/user";
    }

    // update
    @RequestMapping("/admin/user/update/{id}")
    public String getUpdatePage(Model model, @PathVariable Long id) {
        User currentUser = this.userService.handleFindByID(id);
        model.addAttribute("newUser", currentUser);
        return "/admin/user/update";
    }

    // Post thong tin update
    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User hoidanit,
                                 @RequestParam("hoidanitFile") MultipartFile file) {
        User currentUser = this.userService.handleFindByID(hoidanit.getId());
        String fileName = this.uploadService.handleUploadFile(file, "avatar");
        if (currentUser != null) {
            currentUser.setFullName(hoidanit.getFullName());
            currentUser.setAddress(hoidanit.getAddress());
            currentUser.setPhone(hoidanit.getPhone());
            // update avatar
            currentUser.setAvatar(fileName);
            // update role
            currentUser.setRole(userService.getRoleByName(hoidanit.getRole().getName()));
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    // xoa thong tin
    @GetMapping("/admin/user/delete/{id}")
    public String getDeletePage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("dUser", new User());
        return "/admin/user/delete";
    }

    // post xoa thong tin
    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("dUser") User dUser) {
        this.userService.deleteUserById(dUser.getId());
        return "redirect:/admin/user";
    }

}
