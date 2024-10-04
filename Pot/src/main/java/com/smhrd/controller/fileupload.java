package com.smhrd.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import com.smhrd.model.PotSale;
import com.smhrd.model.SaleDAO;

/**
 * Servlet implementation class fileupload
 */
@WebServlet("/html/fileupload")
public class fileupload extends HttpServlet {
	private static final long serialVersionUID = 1L;

    // 업로드 설정: 메모리 상에서 저장할 파일 사이즈와 임시 저장 위치
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  // 파일이 첨부된 multipart 요청인지 확인
        if (!ServletFileUpload.isMultipartContent(request)) {
            // 폼이 multipart/form-data가 아니면 오류 처리
            request.setAttribute("message", "Error: Form must have enctype=multipart/form-data.");
            response.sendRedirect("sale_write.jsp");
            return;
        }

        // 파일 저장 경로 (서버의 실제 경로로 설정)
        ServletContext context = request.getServletContext();
        String uploadPath = context.getRealPath("upload");
        
        // 파일 저장 경로 확인
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir(); // 디렉토리가 없으면 생성
        }

        // 업로드된 파일 이름을 저장할 리스트
        List<String> imgList = new ArrayList();

        // Apache Commons FileUpload 설정
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 메모리 임계값을 초과하면 임시 디렉토리에 파일을 저장
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);
        // 업로드 파일 크기 설정
        upload.setFileSizeMax(MAX_FILE_SIZE);
        upload.setSizeMax(MAX_REQUEST_SIZE);

        try {
            // 요청에서 파일 항목 추출
            List<FileItem> formItems = upload.parseRequest(request);
            
            // 텍스트 필드 처리 변수들
            String sale_category = null;
            String sale_title = null;
            String user_id = null;
            String sale_price = null;
            String sale_content = null;

            // 요청에서 받은 데이터 처리
            for (FileItem item : formItems) {
                if (item.isFormField()) {
                    // form 필드일 경우 (텍스트 필드 처리)
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString("UTF-8"); // UTF-8로 인코딩 처리
                    System.out.println("Field Name: " + fieldName + ", Field Value: " + fieldValue);
                    
                    switch (fieldName) {
                        case "sale_category":
                            sale_category = fieldValue;
                            break;
                        case "sale_title":
                            sale_title = fieldValue;
                            break;
                        case "user_id":
                            user_id = fieldValue;
                            break;
                        case "sale_price":
                            sale_price = fieldValue;
                            break;
                        case "sale_content":
                            sale_content = fieldValue;
                            break;
                    }
                } else {
                    // 파일일 경우 (업로드 파일 처리)
                    String fileName = new File(item.getName()).getName();
                    String filePath = uploadPath + File.separator + fileName;
                    File storeFile = new File(filePath);

                    // 파일이름 중복 처리 (같은 이름 파일이 존재하면 덮어쓰지 않고 새로운 이름 생성)
                    String newFileName = FilenameUtils.getBaseName(fileName) + "_" + System.currentTimeMillis() + "." + FilenameUtils.getExtension(fileName);
                    File renamedFile = new File(uploadPath + File.separator + newFileName);

                    // 파일 저장
                    item.write(renamedFile);
                    imgList.add(newFileName); // 저장된 파일 이름을 리스트에 추가
                    System.out.println("Uploaded File Name: " + newFileName);
                }
            }

            // 업로드된 이미지들을 쉼표로 연결
            String sale_img = String.join(",", imgList);
            System.out.println("Uploaded Images: " + sale_img);

            // PotSale 객체 생성 및 데이터베이스 저장
            PotSale uploadBoard = new PotSale(sale_category, sale_title, user_id, sale_price, sale_img, sale_content);
            SaleDAO dao = new SaleDAO();
            int res = dao.wirteSale(uploadBoard);

            // 결과에 따라 리다이렉트 처리
            if (res > 0) {
                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("../jsp/sale_write.jsp");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("message", "There was an error: " + ex.getMessage());
            response.sendRedirect("../jsp/sale_write.jsp");
        }
	}

}
