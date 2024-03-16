package com.devpro.shop16.services;

import com.devpro.shop16.dto.BannerSearchModel;
import com.devpro.shop16.dto.ProductSearchModel;
import com.devpro.shop16.entities.Banner;
import com.devpro.shop16.entities.Product;
import com.devpro.shop16.entities.ProductImages;
import com.github.slugify.Slugify;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.File;
import java.io.IOException;

@Service
public class BannerService extends BaseServiceHomeProducts<Banner> {

    public String UPLOAD_FOLDER_ROOT = "C:/upload/";

    @Autowired
    BannerService bannerService;

    @Override
    protected Class<Banner> clazz() {
        return Banner.class;
    }


    private boolean isEmptyUploadFile(MultipartFile image) {
        return image == null || image.getOriginalFilename().isEmpty();
    }

    public PagerData<Banner> search(BannerSearchModel searchModel) {
        // Khởi tạo câu lệnh SQL cơ bản
        StringBuilder sql = new StringBuilder("SELECT * FROM tbl_banner b WHERE 1=1");

        if (searchModel != null) {
            // Tìm theo SEO
            if (!StringUtils.isEmpty(searchModel.seo)) {
                sql.append(" AND b.seo = :seo");
            }

            // Tìm kiếm sản phẩm theo từ khóa
            if (!StringUtils.isEmpty(searchModel.keyword)) {
                sql.append(" AND b.name LIKE :keyword");
            }
        }

        // Trả về kết quả phân trang
        return executeByNativeSQL(sql.toString(), searchModel == null ? 0 : searchModel.getPage());
    }





    @Transactional
    public Banner add(Banner b, MultipartFile bannerPicture)
            throws IllegalStateException, IOException {

        // kiểm tra xem admin có đẩy banner lên không ???
        if (!isEmptyUploadFile(bannerPicture)) {
            // tạo đường dẫn tới folder chứa avatar
            String pathToFile = UPLOAD_FOLDER_ROOT + "banner/pictures/" + bannerPicture.getOriginalFilename();

            // lưu banner vào đường dẫn trên
            bannerPicture.transferTo(new File(pathToFile));

            b.setPath("banner/pictures/" + bannerPicture.getOriginalFilename());
        }

        // lưu vào database
        return super.saveOrUpdate(b);
    }

    @Transactional
    public Banner update(Banner b, MultipartFile bannerPicture)
            throws IllegalStateException, IOException {

        // lấy thông tin cũ của product theo id
        Banner bannerInDb = super.getById(b.getId());

        // có đẩy banner ??? => xóa banner cũ đi và thêm banner mới
        if (!isEmptyUploadFile(bannerPicture)) {
            // xóa avatar trong folder lên
            new File(UPLOAD_FOLDER_ROOT + bannerInDb.getPath()).delete();

            // add banner moi
            bannerPicture.transferTo(new File(UPLOAD_FOLDER_ROOT + "banner/pictures/" + bannerPicture.getOriginalFilename()));
            b.setPath("banner/pictures/" + bannerPicture.getOriginalFilename());
        } else {
            // su dung lai avatar cu
            b.setPath(bannerInDb.getPath());
        }

        // lưu vào database
        return super.saveOrUpdate(b);
    }


}