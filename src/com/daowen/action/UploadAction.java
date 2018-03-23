package com.daowen.action;  
import java.io.File;  
import java.io.UnsupportedEncodingException;  
 
  
  


import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.util.SingleFileUpload;  
@Controller
public class UploadAction  {  
      
    private static final long   serialVersionUID = 1L;  
  
      
  
    private static final String CONTENT_TYPE= "text/html; charset=utf-8";  
  
     
    
    @RequestMapping("/admin/uploadmanager.do")
    public String execute(HttpServletRequest request,HttpServletResponse response) {  
          
    	
        SingleFileUpload upload = new SingleFileUpload();  
        try {  
            upload.parseRequest(request);  
        } catch (UnsupportedEncodingException e1) {  
              
            e1.printStackTrace();  
        } 
       
        
        String temp =request.getSession().getServletContext().getRealPath("/") + "upload\\temp\\"; //��ʱĿ¼    
        
        System.out.print("�ϴ�·����"+temp);
        
        String loadpath = request.getSession().getServletContext().getRealPath("/") + "upload\\"; //�ϴ��ļ����Ŀ¼    
        
        
        File file = new File(temp);    
        
        if(!file.exists())
        	file.mkdirs();
          
        try {  
            upload.upload(file); 
            
            response.getWriter().write(upload.getFileItem().getName());
        }  
        catch(org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException e){              
            // �ļ���С�������ֵ   
            e.printStackTrace();  
        }catch (Exception e){  
            e.printStackTrace();  
        }  
          
          
        return null;  
    }  
      
   
   
  
} 