package com.devpro.shop16.controller.admin;

import com.devpro.shop16.controller.BaseController;
import com.devpro.shop16.dto.BannerSearchModel;
import com.devpro.shop16.dto.ProductSearchModel;
import com.devpro.shop16.entities.Banner;
import com.devpro.shop16.entities.Product;
import com.devpro.shop16.services.BannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Controller
public class BannerController extends BaseController {

    @Autowired
    private BannerService bannerService;

    @RequestMapping(value = { "/admin/banners-admin" }, method = RequestMethod.GET)
    public String adminBannerList(final Model model, final HttpServletRequest request,
                                   final HttpServletResponse response) throws IOException {

        BannerSearchModel searchModel = new BannerSearchModel();
        searchModel.keyword = request.getParameter("keyword");
        searchModel.setPage(getCurrentPage(request));

        model.addAttribute("bannerWithPaging", bannerService.search(searchModel));
        model.addAttribute("searchModel", searchModel);

        return "quantrivien/banners-admin";
    }


    @RequestMapping(value = { "/admin/add-banner/{bannerId}" }, method = RequestMethod.GET)
    public String adminProductEdit(final Model model, final HttpServletRequest request,
                                   final HttpServletResponse response, @PathVariable("bannerId") int bannerId) throws IOException {
        Banner banner = bannerService.getById(bannerId);
        model.addAttribute("banner", banner);

        return "quantrivien/add-banner";
    }


    @RequestMapping(value = { "/admin/add-banner" }, method = RequestMethod.GET)
    public String adminBannerAddOrUpdateGet(final Model model, final HttpServletRequest request,
                                         final HttpServletResponse response) throws IOException {

        model.addAttribute("banner", new Banner());

        return "quantrivien/add-banner";
    }

    @RequestMapping(value = { "/admin/add-banner" }, method = RequestMethod.POST)
    public String adminBannerAddOrUpdatePost(final Model model, final HttpServletRequest request,
                                         final HttpServletResponse response
            , @ModelAttribute("banner") Banner banner, // spring-form biding với		// banners model
              @RequestParam("bannerPicture") MultipartFile bannerPicture // hứng file đẩy lên
    ) throws Exception {

        if (banner.getId() == null || banner.getId() <= 0) { // thêm mới
            bannerService.add(banner, bannerPicture);
        } else { // chỉnh sửa
            bannerService.update(banner, bannerPicture);
        }
        // đường dẫn tới View.
        return "redirect:/admin/banners-admin";
    }





    @RequestMapping(value = { "/admin/banners-admin/delete/{bannerId}" }, method = RequestMethod.GET)
    public String adminDeleteBanner(final Model model,  final HttpServletRequest request,
                                      final HttpServletResponse response,@PathVariable("bannerId") int bannerId )
            throws IOException {

        Banner banner = bannerService.getById(bannerId);

        bannerService.delete(banner);

        model.addAttribute("banner", new Banner());


        return "redirect:/admin/banners-admin";
    }

}
