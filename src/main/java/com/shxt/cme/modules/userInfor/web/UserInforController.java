package com.shxt.cme.modules.userInfor.web;

import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shxt.cme.domain.TrainingCourse;
import com.shxt.cme.domain.User;
import com.shxt.cme.domain.UserInfo;
import com.shxt.cme.modules.userInfor.service.UserInforService;
import com.shxt.framework.utils.mapper.BeanMapper;
import com.shxt.framework.web.Servlets;
import com.shxt.framework.web.base.BaseController;

@Controller
@RequestMapping(value = "userInfor")
public class UserInforController extends BaseController {
	Logger logger = LoggerFactory.getLogger(UserInforController.class);
	User user;
	@Autowired
	private UserInforService userInforService;
	@RequestMapping("update")
	public String update(Model model,User user, ServletRequest request,
			HttpSession session) {
		try {
			if(user==null){
				
			}
			System.out.println("user==="+user.getUserName());
			String str =userInforService.update(user);
			request.setAttribute("InfoMessage", str);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage",
					"信息载入失败！具体异常信息：" + e.getMessage());
		} 
			
		return "redirect:/userInfor";

	}
	
	/**
	 * 
	 * @Description:
	 * @param model
	 * @return String
	 */
	@RequestMapping("")
	public String list(Model model, Pageable pageable, ServletRequest request,
			HttpSession session) {
		// 从请求中取得search_开头的参数及其值，并封装到map中，供后续查询使用
		System.out.println("user被调用");
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(
				request, "search_");
		User user=getCurrentUser(session);
		
		// 将接受的Map对象转化成实体对象
		TrainingCourse subTrainingCourseInfo = BeanMapper.convertMap(
				TrainingCourse.class, searchParams);
		// 获取分页对象
		Page<UserInfo> userInfoList = userInforService.findWithPage(pageable, subTrainingCourseInfo,user);
		model.addAttribute("userInfoList", userInfoList);
		model.addAttribute("searchParams", Servlets
				.encodeParameterStringWithPrefix(searchParams, "search_"));
		System.out.println("user被调用完成");
		return "userInfor/userInfoList";
	}

	@RequestMapping("userImg")
	public String userImg(Model model,User user, ServletRequest request,
			HttpSession session) {

		return "userInfor/userImg";

	}
	@RequestMapping("userOrder1")
	public String userOrder1(Model model,User user, ServletRequest request,
			HttpSession session) {

		return "userInfor/userOrder1";

	}
	@RequestMapping("userOrder2")
	public String userOrder2(Model model,User user, ServletRequest request,
			HttpSession session) {

		return "userInfor/userOrder2";

	}
	@RequestMapping("userOrder3")
	public String userOrder3(Model model,User user, ServletRequest request,
			HttpSession session) {

		return "userInfor/userOrder3";

	}
	@RequestMapping("userOrder4")
	public String userOrder4(Model model,User user, ServletRequest request,
			HttpSession session) {

		return "userInfor/userOrder4";

	}
	/*@RequestMapping(value = "/detail")
	public String detailTrainingCourse(Model model, String trainingKey) {
		// 列出所有单位

		// 列出所有单位
		List<Unit> unitList = trainingCourseService.getAllUnit();
		List<Subject> subjectList = temporaryDeclareService.getAllSubject();
		model.addAttribute("subjectList", subjectList);
		TrainingCourse trainingCourse = trainingCourseService
				.getTrainingCourse(trainingKey);
		String memberType = "1";
		Member member1 = trainingCourseService.getMember1(trainingKey,
				memberType);

		model.addAttribute("member1", member1);
		
		memberType = "2";
		List<Member> member = trainingCourseService.getMember2(trainingKey,
				memberType);

		List<Position> positionList1=academicActivityService.getSecondPosition(member1.getUpPosition());
		model.addAttribute("positionList1",positionList1);
		for (int i = 2; i < member.size() + 2; i++) {
			Member m = member.get(i - 2);
			model.addAttribute("member" + i, m);
			
			List<Position> positionList=academicActivityService.getSecondPosition(member.get(i-2).getUpPosition());
			model.addAttribute("positionList"+i,positionList);
			

		}
		//所在单位
		List<InUnit> inUnitList=trainingDeclareService.getInUnit();
		
		model.addAttribute("inUnitList", inUnitList);
		
		
		List<Subject> secondList=trainingCourseService.getSecondList(trainingCourse.getProjectType());
		List<Subject> thirdList=trainingCourseService.getThirdList(trainingCourse.getSecondSubject());
		List<Position> positionList=trainingDeclareService.getFirstPosition();
		List<Place> placeList=trainingDeclareService.getFirstPlace();
		model.addAttribute("placeList",placeList);
		
		List<Place> secondPlaceList=academicDeclareService.getSecondPlace(trainingCourse.getHostPlace());
		model.addAttribute("secondPlaceList",secondPlaceList);
		
		model.addAttribute("positionList", positionList);
		model.addAttribute("secondList", secondList);
		model.addAttribute("thirdList", thirdList);
		model.addAttribute("trainingCourse", trainingCourse);
		model.addAttribute("unitList", unitList);
		return "trainingCourseMng/trainingCourseDetail";
	}
	
	@RequestMapping(value="/batchDeclare")
	public String batchDeclare(Model model, String keys,ServletRequest request, Pageable pageable,HttpSession session){
		logger.info("controller:the method batchDelete invoked");
		String[] trainingBatchKeys = keys.split(",");
		User user = getCurrentUser(session);
		boolean flag =trainingCourseService.batchDeclare(trainingBatchKeys,user);
		model.addAttribute("message", flag ? DECLARE_SUCCEED : DECLARE_FAIL);
		return "forward:/trainingCourseMng";
	}
	
	@RequestMapping(value="/delete")
	public String singleDelete(Model model,String key){
		
		boolean flag=trainingCourseService.singleDelete(key);
		model.addAttribute("message", flag ? DELETE_SUCCEED : DELETE_FAIL);
		return "forward:/trainingCourseMng";
	}
*/
}
