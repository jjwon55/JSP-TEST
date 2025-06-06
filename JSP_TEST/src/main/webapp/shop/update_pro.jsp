<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.file.*" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="org.apache.commons.fileupload2.core.*" %>
<%@ page import="org.apache.commons.fileupload2.jakarta.*" %>
<%@ page import="shop.dto.Product" %>
<%@ page import="shop.dao.ProductRepository" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String uploadPath = application.getRealPath("/upload");
    Path   uploadDir  = Paths.get(uploadPath);
    if (Files.notExists(uploadDir)) Files.createDirectories(uploadDir);

    JakartaServletRequestContext ctx = new JakartaServletRequestContext(request);
    if (!JakartaServletFileUpload.isMultipartContent(ctx)) {
        out.println("<script>alert('multipart/form-data 형식이 아닙니다.');history.back();</script>");
        return;
    }

    FileItemFactory<DiskFileItem> factory = DiskFileItemFactory.builder().get();
    JakartaServletFileUpload<DiskFileItem, FileItemFactory<DiskFileItem>> upload =
        new JakartaServletFileUpload<>(factory);
    upload.setHeaderCharset(StandardCharsets.UTF_8);

    Product product = new Product();
    String  oldFile  = null;   
    String  newFile  = null;   

    try {
        List<DiskFileItem> items = upload.parseRequest(ctx);
        for (DiskFileItem item : items) {
            if (item.isFormField()) {                             
                String k = item.getFieldName();
                String v = item.getString(StandardCharsets.UTF_8);

                switch (k) {
                    case "productId":    product.setProductId(v); break;
                    case "name":         product.setName(v); break;
                    case "unitPrice":    if (!v.isBlank()) product.setUnitPrice(Integer.parseInt(v)); break;
                    case "description":  product.setDescription(v); break;
                    case "manufacturer": product.setManufacturer(v); break;
                    case "category":     product.setCategory(v); break;
                    case "unitsInStock": if (!v.isBlank()) product.setUnitsInStock(Integer.parseInt(v)); break;
                    case "condition":    product.setCondition(v); break;
                    case "oldFile":      oldFile = v; break;
                }
            } else {                                              
                String ori = item.getName();
                if (ori != null && !ori.isEmpty()) {
                    newFile = System.currentTimeMillis() + "_" + ori;
                    item.write(uploadDir.resolve(newFile));       
                }
            }
        }

        String finalFile;
        if (newFile != null && !newFile.isEmpty()) {
            finalFile = newFile;                  
        } else if (oldFile != null && !oldFile.isEmpty()) {
            finalFile = oldFile;                  
        } else {
            ProductRepository repoTmp = new ProductRepository();
            finalFile = repoTmp.getProductById(product.getProductId()).getFile();
        }
        product.setFile(finalFile);

        ProductRepository repo = new ProductRepository();
        int result = repo.update(product);

        if (result > 0) {
            String root = request.getContextPath();   
            response.sendRedirect(root + "/shop/product.jsp?id=" + product.getProductId());
        } else {
            out.println("<script>alert('상품 수정 실패');history.back();</script>");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('예외 발생: " + e.getMessage() + "');history.back();</script>");
    }
%>
