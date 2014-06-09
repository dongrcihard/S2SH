function checkTime(i) {
    if (i < 10) {
        i = "0" + i;
    }
    return i;
}


var task = {
    run: function() {
        var date = new Date();
        var str = "今天是";
        str = str + (date.getYear() + 1900).toString() + "年";
        str = str + (date.getMonth() + 1).toString() + "月";
        str = str + date.getDate() + "日";
        str = str + "  ";
        str = str + "星期";
        var day = date.getDay();
        switch (day) {
            case 0 :
                day = "日";
                break;
            case 1 :
                day = "一";
                break;
            case 2 :
                day = "二";
                break;
            case 3 :
                day = "三";
                break;
            case 4 :
                day = "四";
                break;
            case 5 :
                day = "五";
                break;
            default :
                day = "六";
        }
        str = str + day;
        str = str + "  ";
        str = str + checkTime(date.getHours()) + "时";
        str = str + checkTime(date.getMinutes()) + "分";
        str = str + checkTime(date.getSeconds()) + "秒";
        str = ":  " + str;
        Ext.getElementById("now_time").value = str;
    },
    interval: 1000
}

Ext.onReady(function(){
    /*startTime()*/;
    Ext.TaskManager.start(task);
})



