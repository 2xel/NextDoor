<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<link href="resources/main/assets/css/style2.css" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
           


 <!--main content start-->
  <section id="main-content">
          <section class="wrapper site-min-height">
          
                  
                     <div class="row mtbox">
                        <div class="col-md-3 col-sm-2 col-md-offset-1 box0">
                           <div class="box1">
                          <span class="fa fa-users"></span>
                          <h3>${countMember}</h3>
                           </div>
                          <p>프로젝트 총 멤버 수</p>
                        </div>
                        <div class="col-md-3 col-sm-2 box0">
                           <div class="box1">
                          <span class="fa fa-tasks"></span>
                          <h3>${countSpecifictask }</h3>
                           </div>
                          <p>총 세부업무 갯수</p>
                        </div>
                        <div class="col-md-3 col-sm-2 box0">
                           <div class="box1">
                          <span class="fa fa-check-square-o"></span>
                          <h3>${countSpecifictask_comp1 }</h3>
                           </div>
                          <p>완료한 총 세부업무 갯수</p>
                        </div>
                       
                     
                     </div><!-- /row mt -->   

          <div id="chart1"></div>
         
          
          <div id="chart2" style="width: 30%; height: 400px; margin: 0 auto; background-color: none; float: left;"></div>
          <script type="text/javascript">
          
          
$(function () {
	
  



	 $.ajax({
	      url : "chartMemberList.htm",
	      type : "post",
	      dataType : "json",
	      success : function(data){
	    	  console.log(data);
	    	  var idx=1;
	    	  var chartmemberlist="";
	    	  $.each(data.list , function(index,obj){
	    		  chartmemberlist = "<tr>"
	    		  				  + "<td>"+idx+"</td>"
	    		  				  + "<td><button id='"+index+"member' style='background-color:window; border:none;'>"+obj.member_id+"</button></td>"
	    		  				  + "<td>"+obj.taskcount+"</td>"
	    		  				  + "<td>"+obj.taskcompcount+"</td>"
	    		  				  + "</tr>"
	    		  
	    		  $("#memberlist").append(chartmemberlist);
	    		  	
	    		  idx++;
	    		  
	    		  $("#"+index+"member").click(function(){
	    			  var member_id = $("#"+index+"member").text();
		    		  var taskcount = obj.taskcount;
		    		  var taskcompcount = obj.taskcompcount
	    			  
	    			  chartbymember(member_id,taskcount,taskcompcount );
	    		  });
	    	  });
	    	  
	    	 
	      },
	      error : function(){
	    	  alert("error");
	      }
	      
	    });
	 
	 function chartbymember(member_id,taskcount,taskcompcount ){
		 console.log(member_id);
		 console.log(taskcount);
		 console.log(taskcompcount);
		 var task = taskcount;
		 var complate = taskcompcount;
		 $("#chart2").highcharts({

			    chart: {
			        type: 'solidgauge',
			        marginTop: 50
			    },

			    title: {
			        text: member_id+"님의 업무 현황",
			        style: {
			            fontSize: '24px'
			        }
			    },

			    tooltip: {
			        borderWidth: 0,
			        backgroundColor: 'none',
			        shadow: false,
			        style: {
			            fontSize: '16px'
			        },
			        valueSuffix: "%",
			        
			        pointFormat: '{series.name}<br><span style="font-size:2em; color: {point.color}; font-weight: bold">{point.y}</span>',
			        positioner: function (labelWidth) {
			            return {
			                x: 250 - labelWidth / 2,
			                y: 180
			            };
			        }
			    },

			    pane: {
			        startAngle: 0,
			        endAngle: 360,
			        background: [{ // Track for Move
			            outerRadius: '112%',
			            innerRadius: '88%',
			            backgroundColor: Highcharts.Color(Highcharts.getOptions().colors[0])
			                .setOpacity(0.3)
			                .get(),
			            borderWidth: 0
			        }, { // Track for Exercise
			            outerRadius: '87%',
			            innerRadius: '63%',
			            backgroundColor: Highcharts.Color(Highcharts.getOptions().colors[1])
			                .setOpacity(0.3)
			                .get(),
			            borderWidth: 0
			        }, { // Track for Stand
			            outerRadius: '62%',
			            innerRadius: '38%',
			            backgroundColor: Highcharts.Color(Highcharts.getOptions().colors[2])
			                .setOpacity(0.3)
			                .get(),
			            borderWidth: 0
			        }]
			    },

			    yAxis: {
			        min: 0,
			        max: 100,
			        lineWidth: 0,
			        tickPositions: []
			    },

			    plotOptions: {
			        solidgauge: {
			            dataLabels: {
			                enabled: false
			            },
			            linecap: 'round',
			            stickyTracking: false,
			            rounded: true
			        }
			    },

			    series: [{
			        name: '진행률',
			        data: [{
			            color: Highcharts.getOptions().colors[0],
			            radius: '112%',
			            innerRadius: '88%',
			            y: complate/task*100
			        }],
				
			    }, {
			        name: "총 업무",
			        data: [{
			            color: Highcharts.getOptions().colors[1],
			            radius: '87%',
			            innerRadius: '63%',
			            y: task
			        }],
			        tooltip: {
				        valueSuffix: '개',
				    }
			    }, {
			        name: "완료된 업무",
			        data: [{
			            color: Highcharts.getOptions().colors[2],
			            radius: '62%',
			            innerRadius: '38%',
			            y: complate
			        }],
			        tooltip: {
				        valueSuffix: '개',
				    }
			    }]
			},

			/**
			 * In the chart load callback, add icons on top of the circular shapes
			 */
			function callback() {

			    // Move icon
			    this.renderer.path(['M', -8, 0, 'L', 8, 0, 'M', 0, -8, 'L', 8, 0, 0, 8])
			        .attr({
			            'stroke': '#303030',
			            'stroke-linecap': 'round',
			            'stroke-linejoin': 'round',
			            'stroke-width': 2,
			            'zIndex': 10
			        })
			        .translate(250, 26)
			        .add(this.series[2].group);

			    // Exercise icon
			    this.renderer.path(['M', -8, 0, 'L', 8, 0, 'M', 0, -8, 'L', 8, 0, 0, 8,
			            'M', 8, -8, 'L', 16, 0, 8, 8])
			        .attr({
			            'stroke': '#ffffff',
			            'stroke-linecap': 'round',
			            'stroke-linejoin': 'round',
			            'stroke-width': 2,
			            'zIndex': 10
			        })
			        .translate(250, 61)
			        .add(this.series[2].group);

			    // Stand icon
			    this.renderer.path(['M', 0, 8, 'L', 0, -8, 'M', -8, 0, 'L', 0, -8, 8, 0])
			        .attr({
			            'stroke': '#303030',
			            'stroke-linecap': 'round',
			            'stroke-linejoin': 'round',
			            'stroke-width': 2,
			            'zIndex': 10
			        })
			        .translate(250, 96)
			        .add(this.series[2].group);
			});
	 }
	 
	 
	
});
</script>

<script type="text/javascript">
$(function () {
    var xtasklist = [];  
    var yspecifcitasklist0 = [];  
    var yspecifcitasklist1 = [];

    $.ajax({
         url : "chartlist.htm",
         type : "post",
         dataType : "json",
         success : function(data){
           console.log(data);
            
            $.each(data.clist, function(index, obj){
               xtasklist.push(obj.task_cont);
            });
            
            $.each(data.comp0List, function(index, obj1){
               yspecifcitasklist0.push(obj1.comp0);
             }); 
            $.each(data.comp1List, function(index, obj2){
               yspecifcitasklist1.push(obj2.comp1);
             });
            $("#chart1").highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: '업무별 완료 상황 상태'
                },
                xAxis: {
                    categories: xtasklist
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: '완료/미완료'
                    }
                },
                tooltip: {
                    pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.y}</b> ({point.percentage:.0f}%)<br/>',
                    shared: true
                },
                plotOptions: {
                    column: {
                        stacking: 'percent'
                    }
                },
                series: [{
                      name: '완료된 세부업무',
                       data: yspecifcitasklist1
                }, 
                {
                    name: '미완료된 세부업무',
                       data: yspecifcitasklist0
                }
                ]
            }); 
         },
         error : function(){
            alert("error");
         }

       });
    
});
</script>
            <div class="col-md-12" style="float: left; width: 50%; height: 400px;">
	                  	  <div class="content-panel" style="height:400px;">
	                  	  	  <h4><i class="fa fa-angle-right"></i> Basic Table</h4>
	                  	  	  <hr>
		                      <table class="table">
		                          <thead>
		                          <tr>
		                              <th>#</th>
		                              <th>Username</th>
		                              <th>task</th>
		                              <th>complate</th>
		                          </tr>
		                          </thead>
		                          <tbody id='memberlist'>
		                         
		                          </tbody>
		                      </table>
	                  	  </div><! --/content-panel -->
	                  </div><!-- /col-md-12 -->
           
		
              
          </section>
      </section><!-- /MAIN CONTENT -->
