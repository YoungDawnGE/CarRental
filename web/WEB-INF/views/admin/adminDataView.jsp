<%@ page import="com.google.gson.Gson" %>
<%--
  Created by IntelliJ IDEA.
  User: geyan
  Date: 2019/5/10
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%  Gson gson = new Gson();
    String carJson = gson.toJson(request.getAttribute("carTop10"));

    String salesJson = gson.toJson(request.getAttribute("sales"));

    String typesJson = gson.toJson(request.getAttribute("types"));
%>

<html>
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://code.highcharts.com/highcharts.js"></script>
    <title>数据可视化</title>
    <script type="text/javascript">
        $(document).ready(function() {
            $(function () {
                $('#myTab li:eq(1) a').tab('show');
            });

            // 点击率柱状图
            {
                var carTop10 = <%=carJson%>
                    console.log(carTop10);

                var chart = {
                    type: 'column'
                };
                var title = {
                    text: 'Top10汽车热度排行'
                };
                var subtitle = {
                    text: '来源: 南工汽车租赁系统'
                };
                var xAxis = {
                    categories: [
                        carTop10[0].name+": "+carTop10[0].carkind,
                        carTop10[1].name+": "+carTop10[1].carkind,
                        carTop10[2].name+": "+carTop10[2].carkind,
                        carTop10[3].name+": "+carTop10[3].carkind,
                        carTop10[4].name+": "+carTop10[4].carkind,
                        carTop10[5].name+": "+carTop10[5].carkind,
                        carTop10[6].name+": "+carTop10[6].carkind,
                        carTop10[7].name+": "+carTop10[7].carkind,
                        carTop10[8].name+": "+carTop10[8].carkind,
                        carTop10[9].name+": "+carTop10[9].carkind
                    ],
                    crosshair: true
                };
                var yAxis = {
                    min: 0,
                    title: {
                        text: '点击次数'
                    }
                };
                var tooltip = {
                    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y:.1f} 次</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                };
                var plotOptions = {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0,
                        events:{
                            click: function(e) {
                                window.open('${pageContext.request.contextPath }/car/carDetail?id='+e.point.name);
                            }
                        }
                    }
                };
                var credits = {
                    enabled: false
                };

                var series= [{
                    name: '点击次数',
                    data: [
                        {name:carTop10[0].id,y:carTop10[0].carClick},
                        {name:carTop10[1].id,y:carTop10[1].carClick},
                        {name:carTop10[2].id,y:carTop10[2].carClick},
                        {name:carTop10[3].id,y:carTop10[3].carClick},
                        {name:carTop10[4].id,y:carTop10[4].carClick},
                        {name:carTop10[5].id,y:carTop10[5].carClick},
                        {name:carTop10[6].id,y:carTop10[6].carClick},
                        {name:carTop10[7].id,y:carTop10[7].carClick},
                        {name:carTop10[8].id,y:carTop10[8].carClick},
                        {name:carTop10[9].id,y:carTop10[9].carClick}
                        // carTop10[0].carClick,
                        // carTop10[1].carClick,
                        // carTop10[2].carClick,
                        // carTop10[3].carClick,
                        // carTop10[4].carClick,
                        // carTop10[5].carClick,
                        // carTop10[6].carClick,
                        // carTop10[7].carClick,
                        // carTop10[8].carClick,
                        // carTop10[9].carClick
                    ]
                }];

                var json = {};
                json.chart = chart;
                json.title = title;
                json.subtitle = subtitle;
                json.tooltip = tooltip;
                json.xAxis = xAxis;
                json.yAxis = yAxis;
                json.series = series;
                json.plotOptions = plotOptions;
                json.credits = credits;
                $('#container1').highcharts(json);
            }

            //月销量折线图
            {

                var sales = <%=salesJson%>
                    console.log(sales);
                var title = {
                    text: "营业额折线统计图"
                };
                var subtitle = {
                    text: '来源: 南工汽车租赁系统'
                };
                var xAxis = {
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                };
                var yAxis = {
                    title: {
                        text: '营业额 (万元)'
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
                };

                var tooltip = {
                    valueSuffix: '万元'
                }

                var legend = {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0
                };

                var series =  [

                    {
                        name: '每月数据',
                        data: [
                            sales[0]/10000,
                            sales[1]/10000,
                            sales[2]/10000,
                            sales[3]/10000,
                            sales[4]/10000,
                            sales[5]/10000,
                            sales[6]/10000,
                            sales[7]/10000,
                            sales[8]/10000,
                            sales[9]/10000,
                            sales[10]/10000,
                            sales[11]/10000
                        ]
                    }

                ];

                var json = {};

                json.title = title;
                json.subtitle = subtitle;
                json.xAxis = xAxis;
                json.yAxis = yAxis;
                json.tooltip = tooltip;
                json.legend = legend;
                json.series = series;

                $('#container2').highcharts(json);
            }

            //汽车销量类型扇形图
            {
                var types = <%=typesJson%>;
                // var total=0;
                // $.each(types,function(i,item){
                //     total=total+item.sumPrice;
                // });
                // console.log(total);
                // console.log(types);
                var chart = {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                };
                var title = {
                    text: '类型-营业额 扇形统计图'
                };
                var tooltip = {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                };
                var plotOptions = {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: false
                        },
                        showInLegend: true,

                        events:{

                            click: function(e) {
                                window.open('${pageContext.request.contextPath }/car/showCar?type='+e.point.name);

                                // window.open('123.aspx?type='+e.type+'&id='+e.point.tid); //单击每个饼图打开一个页面，同时传递参数，单击了哪个饼图，题                                                                //目id是多少。

                            }

                        }

                    }
                };
                var series= [{
                    type: 'pie',
                    name: '份额',
                    data: [
                        {name:types[0].type,y:types[0].sumPrice},
                        {name:types[1].type,y:types[1].sumPrice},
                        {name:types[2].type,y:types[2].sumPrice},
                        {name:types[3].type,y:types[3].sumPrice},
                        {name:types[4].type,y:types[4].sumPrice},
                        {name:types[5].type,y:types[5].sumPrice},
                        {name:types[6].type,y:types[6].sumPrice},
                        {name:types[7].type,y:types[7].sumPrice}

                        // [],
                        // [types[1].type,types[1].sumPrice],
                        // [types[2].type,types[2].sumPrice],
                        // [types[3].type,types[3].sumPrice],
                        // [types[4].type,types[4].sumPrice],
                        // [types[5].type,types[5].sumPrice],
                        // [types[6].type,types[6].sumPrice],
                        // [types[7].type,types[7].sumPrice]
                    ]
                }];

                var json = {};
                json.chart = chart;
                json.title = title;
                json.tooltip = tooltip;
                json.series = series;
                json.plotOptions = plotOptions;
                $('#container3').highcharts(json);
            }


            $(function () {
                $('#myTab li:eq(3) a').tab('show');
            });
        });
    </script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3>
                欢迎&nbsp;管理员 ID:&nbsp;${admin.id} &nbsp; &nbsp; <a href="${pageContext.request.contextPath }/admin/logout">退出</a>
            </h3>
            <ul id="myTab" class="nav nav-tabs">
                <li>
                    <a href="#" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/admin/firstPage'">首页</a>
                </li>

                <li  class="active">
                    <a href="#" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/admin/adminDataView'">数据</a>
                </li>

                <li >
                    <a href="#" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/emp/showEmp'">员工</a>
                </li>

                <li>
                    <a href="#" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/user/showUser'">用户</a>
                </li>

                <li>
                    <a href="#" id="myTabDrop1" class="dropdown-toggle"
                       data-toggle="dropdown">汽车<b class="caret"></b>
                    </a>

                    <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
                        <li><a href="#" id="carKind0" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/showCar?type=全部'">
                            全部</a>
                        </li>
                        <li><a href="#carList" id="carKind1" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/showCar?type=微型轿车'">
                            微型轿车</a>
                        </li>
                        <li><a href="#carList" id="carKind2" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/showCar?type=普通级轿车'">
                            普通级轿车</a>
                        </li>
                        <li><a href="#carList" id="carKind3" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/showCar?type=中级轿车'">
                            中级轿车</a>
                        </li>
                        <li><a href="#carList" id="carKind4" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/showCar?type=中高级轿车'">
                            中高级轿车</a>
                        </li>
                        <li><a href="#carList" id="carKind5" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/showCar?type=高级轿车'">
                            高级轿车</a>
                        </li>
                        <li><a href="#carList" id="carKind6" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/showCar?type=小型SUV'">
                            小型SUV</a>
                        </li>
                        <li><a href="#carList" id="carKind7" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/showCar?type=中型SUV'">
                            中型SUV</a>
                        </li>
                        <li><a href="#carList" id="carKind8" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/car/showCar?type=大型SUV'">
                            大型SUV</a>
                        </li>
                    </ul>
                </li>
                <li><a href="#" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/admin/showAllOrders'">订单</a></li>

                <li class="dropdown">
                    <a href="#" id="myTabDrop2" class="dropdown-toggle"
                       data-toggle="dropdown">添加<b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
                        <li><a href="#" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/admin/empForm'">
                            添加员工</a>
                        </li>
                        <li><a href="#" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/admin/carForm'">
                            添加汽车</a>
                        </li>
                        <li><a href="#" tabindex="-1" data-toggle="tab" onclick="location='${pageContext.request.contextPath }/admin/userForm'">
                            添加用户</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h1 class="col-sm-offset-5">数据可视化</h1>
            <br>
            <div id="container1" style="display:inline-block;width: 550px; height: 400px; margin: 0 auto">

            </div>


            <div id="container3" style="display:inline-block;width: 550px; height: 400px; margin: 0 auto">

            </div>

            <div id="container2" style="width: 550px; height: 400px; margin: 0 auto">

            </div>
        </div>
    </div>
</div>


<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">

        </div>
    </div>
</div>

</body>
</html>