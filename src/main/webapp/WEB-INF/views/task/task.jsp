<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   

<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">\

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script>
  
</head>
 
<c:set value="${project_no}" var="project_no"></c:set>

<section id="main-content">
          <section class="wrapper">
 			<div class="col-lg-9 main-chart">
                  		<div>
                  			<h3><i class="fa fa-angle-right"></i> 보람사조</h3>
                  			<button type="button" class="btn btn-theme02" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i> 업무 리스트 추가</button>
                  			
	                  		<!-- Modal -->
					          <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
					              <div class="modal-dialog">
					                  <div class="modal-content">
					                  	<form action="insertTask.htm" >
					                      <div class="modal-header">
					                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					                          <h4 class="modal-title">새 업무생성</h4>
					                      </div>
					                      <div class="modal-body">					                	  
					                          <p class="centered"></p>
					                          <p>업무명</p>
					                          <input type="text" name="task_cont" placeholder="업무명을 입력해주세요." autocomplete="off" class="form-control placeholder-no-fix">
					                          <input type="hidden" name="project_no" value="${project_no}" >
					                      </div>
					                      <div class="modal-footer centered">
					                      	  
					                      	  	  
						                          <button class="btn btn-theme03" type="submit">생성</button>
						                          <button data-dismiss="modal" class="btn btn-theme04" type="button">취소</button>
					                      </div>
					                      </form>
					                  </div>
					              </div>
					          </div>
					         <!-- modal -->
                  		</div>
                  		
                  		<!-- userid와 프로젝트 name을 가지고 업무리스트 뿌리기 -->
                  	<c:forEach items="${tasklist}" var="list">
                  		<div class="col-lg-3 col-md-3 col-sm-3 mb">
                  		
                  			
							 <div class="steps pn">
								
							    <label for="op1">${list.task_cont}
							    	<button class="btn btn-success btn-xs">
							    	<i class="fa fa-pencil fa-fw"></i>
							    	<i class="fa fa-plus"></i>
							    	</button>
							    </label>					   
							</div> 
					   </div>
				  </c:forEach>		
          </div>
          
          
          <!-- 오른쪽 사이드 바 -->
          <div class="col-lg-3 ds" id="test">
                    <!--COMPLETED ACTIONS DONUTS CHART-->
						<h3>세부업무 설정</h3>            
	                       <div class="form-panel" >
	                  	   <div class="btn-group">
							  <div class="btn-group btn-group-justified">
							  <div class="btn-group">
							    <button type="button" class="btn btn-theme">속성</button>
							  </div>
							  <div class="btn-group">
							    <button type="button" class="btn btn-theme02">파일</button>
							  </div>
							</div>
					  	   </div>
	                      <form class="form-horizontal style-form" method="get">
	                          <div class="form-group">
	                              <label class="col-sm-3 col-sm-3 control-label">업무배정</label>
	                              <button type="button" class="btn btn-theme02"><i class="fa fa-plus"></i></button>
	                          </div>
	                                                  
	                          <div class="form-group">
	                          	  <div class="form-group">
	                              		<label class="col-sm-3 col-sm-3 control-label">&nbsp;&nbsp;&nbsp;<i class="fa fa-calendar"></i>&nbsp;&nbsp;&nbsp;기간</label>
	                              		
	                              </div>
	                              <div class="form-group">                             		
	                              		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시작일: <input type="text" id="datepicker"></p>                  		
	                              </div>
	                              <div class="form-group">
	                              		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;마감일: <input type="text" id="datepicker"></p>
	                              </div>                                                          
	                          </div>
	                         
	                          <button type="button" class="btn btn-theme03">수정완료</button>
	                          <button type="button" class="btn btn-theme04">업무삭제</button>
	                          
	                      </form>
                  		</div>                   
           
                  </div><!-- /col-lg-3 -->
		  </section>
</section>