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
