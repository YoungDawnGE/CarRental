<%--
  Created by IntelliJ IDEA.
  User: geyan
  Date: 2019/5/8
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/cityTest.js"></script>
    <title>test</title>
    <script type="text/javascript">
        cities = new Object();
        cities['江苏省']=new Array('石家庄', '张家口市', '承德市', '秦皇岛市', '唐山市', '廊坊市', '保定市', '沧州市', '衡水市', '邢台市', '邯郸市');
        cities['浙江省']=new Array('太原市', '大同市', '朔州市', '阳泉市', '长治市', '晋城市', '忻州地区', '吕梁地区', '晋中市', '临汾地区', '运城地区');

        function set_city(province, city)
        {
            var pv, cv;
            var i, ii;

            pv=province.value;
            cv=city.value;

            city.length=1;

            if(pv=='0') return;
            if(typeof(cities[pv])=='undefined') return;

            for(i=0; i<cities[pv].length; i++)
            {
                ii = i+1;
                city.options[ii] = new Option();
                city.options[ii].text = cities[pv][i];
                city.options[ii].value = cities[pv][i];
            }
        }

    </script>
</head>

<body>

    <form name="form1" action="" method="get">

        <select name="province" onChange="set_city(this, this.form.city);">

            <option value="0">选择省</option>

            <option value="河北省">江苏省</option>

            <option value="山西省">浙江省</option>

        </select>

        <select name="city" id="citys">

            <option value="0">选择城市</option>

        </select>
    </form>


</body>
</html>