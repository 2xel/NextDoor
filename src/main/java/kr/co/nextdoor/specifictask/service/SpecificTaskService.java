package kr.co.nextdoor.specifictask.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import kr.co.nextdoor.file.dto.FileDTO;
import kr.co.nextdoor.specifictask.dao.SpecificTaskDAO;

@Service
public class SpecificTaskService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public int UploadFile(FileDTO filedto, CommonsMultipartFile file, HttpServletRequest request) throws IOException{
		
		String fname = file.getOriginalFilename();
		String path = request.getSession().getServletContext().getRealPath("/nextdoor/upload");
		String uploadedFileName = System.currentTimeMillis()+UUID.randomUUID().toString()+"_"+ fname;
		String fullpath = path + "\\" + uploadedFileName;
		
		if (!fname.equals("")) {
			// 서버에 파일 쓰기 작업
			FileOutputStream fs = new FileOutputStream(fullpath);
			fs.write(file.getBytes());
			fs.close();
		}
		
		System.out.println(filedto.getSpecifictask_no());
		filedto.setSpecifictask_no(filedto.getSpecifictask_no());
		filedto.setOriginal_name(fname);
		filedto.setFile_name(fullpath);
		filedto.setFile_size("12");
		
		SpecificTaskDAO specifictaskdao = sqlsession.getMapper(SpecificTaskDAO.class);
		int result = specifictaskdao.uploadFile(filedto);

		return result;
	}
}
;