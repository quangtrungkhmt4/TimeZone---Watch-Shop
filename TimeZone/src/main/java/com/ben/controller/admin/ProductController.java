package com.ben.controller.admin;

import com.ben.model.ImageModel;
import com.ben.model.ProductModel;
import com.ben.model.SizeColorModel;
import com.ben.service.base.ImageService;
import com.ben.service.base.ProductService;
import com.ben.service.base.SizeColorService;
import com.ben.util.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller(value = "productControllerOfAdmin")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ImageService imageService;

    @Autowired
    private SizeColorService sizeColorService;

    @RequestMapping(value = "/admin/product/create", method = RequestMethod.GET)
    public ModelAndView loadCreateProductPage() {
        return new ModelAndView("admin/product/create");
    }

    @RequestMapping(value = "/admin/product/create", method = RequestMethod.POST)
    public ModelAndView createProduct(@RequestParam("thumbnail") MultipartFile file
            , HttpServletRequest request, @RequestParam("image") List<MultipartFile> images) {

        ProductModel model = new ProductModel();
        List<ImageModel> imageModels = null;

        String thumbnailPath = FileUtils.uploadFile(file);
        model.setThumbnail(thumbnailPath);


        model.setTitle(request.getParameter("title"));
        model.setContent(request.getParameter("content"));
        model.setShortDescription(request.getParameter("shortDesc"));
        model.setPrice(new Float(request.getParameter("price")));
        model.setStatus(new Integer(request.getParameter("status")));

        ProductModel result = productService.insertEntity(model);

        List<String> imagePaths = FileUtils.uploadMultiFile(images);
        imageModels = convertToModel(result, imagePaths);
        imageService.insertMany(imageModels);

        ModelAndView modelAndView = new ModelAndView("redirect:/admin/product/update?id=" + result.getId() + "&productCreateDone");
        modelAndView.addObject("model", result);
        modelAndView.addObject("images", imageModels);
        return modelAndView;
    }

    private boolean isFilesEmpty(List<MultipartFile> files){
        boolean result = true;
        for (MultipartFile file : files){
            if (!file.isEmpty()){
                result = false;
                break;
            }
        }
        return result;
    }

    private List<ImageModel> convertToModel(ProductModel product, List<String> paths){
        List<ImageModel> imageModels = new ArrayList<>();
        paths.forEach(path -> {
            ImageModel imageModel = new ImageModel();
            imageModel.setProduct(product);
            imageModel.setUrl(path);
            imageModel.setThumbnail(path);
            imageModels.add(imageModel);
        });
        return imageModels;
    }

    private void removeFileEmpty(List<MultipartFile> images){
        images.removeIf(MultipartFile::isEmpty);
    }

    @RequestMapping(value = "/admin/product/update", method = RequestMethod.GET)
    public ModelAndView loadUpdateProductPage(@RequestParam("id") long id) {
        ProductModel model = productService.getById(id);
        List<ImageModel> imageModels = imageService.getImageByProduct(model);
        ModelAndView modelAndView = new ModelAndView("admin/product/update");
        modelAndView.addObject("model", model);
        modelAndView.addObject("images", imageModels);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/product/update", method = RequestMethod.POST)
    public ModelAndView updateCategoryPage(@RequestParam("thumbnail") MultipartFile file
            , HttpServletRequest request, @RequestParam("image") List<MultipartFile> images) {

        long id = new Long(request.getParameter("id"));
        ProductModel model = productService.getById(id);
        List<ImageModel> imageModels = imageService.getImageByProduct(model);
        if (!file.isEmpty()){
            String thumbnailPath = FileUtils.uploadFile(file);
            model.setThumbnail(thumbnailPath);
        }

        if (!isFilesEmpty(images)){
            List<Long> idsIgnore = new ArrayList<>();
            for (int i = 0; i < images.size(); i++){
                if (images.get(i).isEmpty()){
                    idsIgnore.add(imageModels.get(i).getId());
                }
            }

            removeFileEmpty(images);

            List<String> imagePaths = FileUtils.uploadMultiFile(images);
            imageModels = convertToModel(model, imagePaths);
            imageService.updateEntities(model, imageModels, idsIgnore);
        }

        model.setTitle(request.getParameter("title"));
        model.setContent(request.getParameter("content"));
        model.setShortDescription(request.getParameter("shortDesc"));
        model.setPrice(new Float(request.getParameter("price")));
        model.setStatus(new Integer(request.getParameter("status")));

        ProductModel newProduct = productService.updateEntity(model);

        ModelAndView modelAndView = new ModelAndView("redirect:/admin/product/update?id=" + id + "&productDone");
        modelAndView.addObject("model", newProduct);
        modelAndView.addObject("images", imageModels);

        return modelAndView;
    }

    @RequestMapping(value = "/admin/product/list", method = RequestMethod.GET)
    public ModelAndView loadListCategoryPage(@RequestParam("page") int page,
                                             @RequestParam("limit") int limit, HttpServletRequest request) {
        int totalProduct = productService.countAll();
        int totalPage = (int) Math.ceil((double) totalProduct / limit);
        List<ProductModel> productModels = productService.getAllPageable(page, limit);
        ModelAndView modelAndView = new ModelAndView("admin/product/list");
        modelAndView.addObject("totalPage", totalPage);
        modelAndView.addObject("page", page);
        modelAndView.addObject("products", productModels);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/product/amount", method = RequestMethod.GET)
    public ModelAndView loadSettingAmountPage(@RequestParam("id") long id
            , @RequestParam(value = "idsize", required = false) Long idSize) {
        ProductModel model = productService.getById(id);
        ModelAndView modelAndView = new ModelAndView("admin/product/amount");
        SizeColorModel sizeColorModel = sizeColorService.getByProduct(model);
        modelAndView.addObject("amounts", sizeColorModel);
        modelAndView.addObject("model", model);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/product/amount", method = RequestMethod.POST)
    public ModelAndView settingAmountPage(HttpServletRequest request) {
        String idSize = request.getParameter("idsize");
        long id = new Long(request.getParameter("id"));
        int amount = new Integer(request.getParameter("amount"));
        int status = new Integer(request.getParameter("status"));
        ProductModel model = productService.getById(id);
        SizeColorModel sizeColor = new SizeColorModel();
        sizeColor.setCount(amount);
        sizeColor.setProduct(model);
        sizeColor.setStatus(status);
        if (idSize != null && !idSize.equals("")){
            sizeColor.setId(new Long(idSize));
        }
        SizeColorModel sizeColorModel = sizeColorService.updateEntity(sizeColor);
        ModelAndView modelAndView = new ModelAndView("admin/product/amount");
        modelAndView.addObject("model", model);
        modelAndView.addObject("amounts", sizeColorModel);
        return modelAndView;
    }
}
