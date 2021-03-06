//-------------------------------------------------------------------------
// HashMap prototype
//-------------------------------------------------------------------------
	function HashMap()
	{
	    // members
	    this.keyArray = new Array(); // Keys
	    this.valArray = new Array(); // Values
	}

	HashMap.prototype.put = function(key, val){
	    var elementIndex = this.findIt( key );

	    if( elementIndex == (-1) )
	    {
	        this.keyArray.push( key );
	        this.valArray.push( val );
	    }
	    else
	    {
	        this.valArray[ elementIndex ] = val;
	    }
	};

	HashMap.prototype.get = function( key ){
	    var result = null;
	    var elementIndex = this.findIt( key );

	    if( elementIndex != (-1) )
	    {
	        result = this.valArray[ elementIndex ];
	    }

	    return result;
	};

	HashMap.prototype.remove = function ( key )
	{
		
	    var result = null;
	    var elementIndex = this.findIt( key );
	  
	    if( elementIndex != (-1) )
	    {
	    	
	        var part1 = this.keyArray.slice( 0, elementIndex);
	        var part2 = this.keyArray.slice( elementIndex+1 );
	        this.keyArray = part1.concat( part2 );
	     
	        var part3 = this.valArray.slice( 0, elementIndex);
	        var part4 = this.valArray.slice( elementIndex+1 );
	        this.valArray = part3.concat( part4 );
	        
	      
	    }
	 
	    return ;
	};

	HashMap.prototype.size = function()
	{
	    return (this.keyArray.length);
	};

	HashMap.prototype.clear = function()
	{
	    for( var i = 0; i < this.keyArray.length; i++ )
	    {
	        this.keyArray.pop(); this.valArray.pop();
	    }
	};

	HashMap.prototype.keySet = function()
	{
	    return (this.keyArray);
	};

	HashMap.prototype.valSet = function()
	{
	    return (this.valArray);
	};

	HashMap.prototype.showMe = function()
	{
	    var result = "";

	    for( var i = 0; i < this.keyArray.length; i++ )
	    {
	        result += "Key: " + this.keyArray[ i ] + "\tValues: " + this.valArray[ i ] + "\n";
	    }
	    return result;
	};
	
	// Key List ?????? 
	HashMap.prototype.showKeyList = function()
	{
		var retArrList = new Array();

	    for( var i = 0; i < this.keyArray.length; i++ )
	    {
	    	retArrList[i] = this.keyArray[ i ];
	    }
	    return retArrList;
	};

	 HashMap.prototype.findIt = function( key )
	{
	    var result = (-1);

	    for( var i = 0; i < this.keyArray.length; i++ )
	    {
	        if( this.keyArray[ i ] == key )
	        {
	            result = i;
	            break;
	        }
	    }
	    return result;
	};

	HashMap.prototype.findCount = function( key )
	{
	    var result = 0;

	    for( var i = 0; i < this.keyArray.length; i++ )
	    {
	    	 
	        if( this.keyArray[ i ] == key )
	        {
	        	//alert('1');
	            result = result++;
	           // break;
	        }
	    }
	    return result;
	};
	
//-------------------------------------------------------------------------
//????????? ?????? ?????? ????????? ???????????? ??????
//-------------------------------------------------------------------------
    function isEmpty( p_str ) {
       if( p_str == null || typeof p_str == 'undefined' || trim(p_str) == "") {
          return true;
       }
       return false;
    }
    
//-------------------------------------------------------------------------
//????????? ???????????? ??????
//-------------------------------------------------------------------------
    function trim( p_str ) {
       return ltrim( rtrim( p_str ) );
    }


//-------------------------------------------------------------------------
//?????? ???????????? ??????
//-------------------------------------------------------------------------
    function ltrim( p_str ) {
    
       if (p_str == "") {
          return   p_str;
       }
    
       var len = p_str.length;
       var st = 0;
    
       while ((st < len) && (p_str.charAt(st) <= ' ')) {
          st++;
       }
    
       return   (st > 0) ? p_str.substring(st, len) : p_str;
    
    }

//-------------------------------------------------------------------------
//?????? ???????????? ??????
//-------------------------------------------------------------------------
    function rtrim( p_str ) {
    
       if (p_str == "") {
          return   p_str;
       }
    
       var len = p_str.length;
       var st = 0;
    
       while ((st < len) && (p_str.charAt(len - 1) <= ' ')) {
          len--;
       }
    
       return   (len < p_str.length) ? p_str.substring(st, len) : p_str;
    
    }

//-------------------------------------------------------------------------
//char ?????? ??????
//-------------------------------------------------------------------------
	  function containsCharsOnly( src , dest){
	     for( var i = 0 ; i < src.length ; i++){
	        if ( dest.indexOf( src.charAt(i) ) < 0 ){
	           return false;
	        }
	     }
	     return true;
	  }
	  
//-------------------------------------------------------------------------
//???????????? ???????????? ??????
//-------------------------------------------------------------------------
	 function toUpper(value) {
		 	var src = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		 	if( containsCharsOnly( value , src ) )
		 		return value.toUpperCase();
		 	return value;
	 }
	 
//------------------------------------------------------------------------- 
//???????????? byte ????????? ??????
//-------------------------------------------------------------------------
	function getByteLength(input){
		var byteLength = 0;
		for(var i=0;i<input.length;i++){
			var oneChar = escape(input.charAt(i));
			if(oneChar.length == 1){
				byteLength++;
			}else if(oneChar.indexOf("%u") != -1){
				byteLength += 2;
			}else if(oneChar.indexOf("%") != -1){
				byteLength += oneChar.length/3;
			}
		}
		return byteLength;
	}

//------------------------------------------------------------------------
// ????????? ????????? ?????? ???????????? ???????????? ??????
//-------------------------------------------------------------------------
	function cutByLen(str, maxByte) {
		
		var byteLength = 0;
		var i = 0;
		for(;i<str.length;i++) 
		{
			var oneChar = escape(str.charAt(i));
			if(oneChar.length == 1){
				byteLength++;
			}else if(oneChar.indexOf("%u") != -1){
				byteLength += 2;
			}else if(oneChar.indexOf("%") != -1){
				byteLength += oneChar.length/3;
			}

			if (byteLength > maxByte){

				break;
			}

		}
		
		return str.substring(0,i);
	}

	
//-------------------------------------------------------------------------
//???????????? ???????????? ????????? ???????????? ??????
//-------------------------------------------------------------------------
	function is_number( p_num ) {
	   var v_chars = "0123456789";
	   return containsCharsOnly( p_num, v_chars );
	}
    
//-------------------------------------------------------------------------
//??????(0~9, ',')?????? ?????????????????? ???????????? ??????
//-------------------------------------------------------------------------
	function is_amount( p_amount ) {
	   var chars = "-,0123456789";
	   return containsCharsOnly( p_amount,chars );
	}

//-------------------------------------------------------------------------
//??????(0~9, '.')?????? ?????????????????? ???????????? ??????
//-------------------------------------------------------------------------
	function is_rate( p_rate ) {
	   var chars = "-.0123456789";
	   return containsCharsOnly( p_rate,chars );
	}

//-------------------------------------------------------------------------
//input File ????????? ?????? ??????
//-------------------------------------------------------------------------
	function isImageExt(fileName){
		var index = fileName.lastIndexOf("."); 
			if( index > 0 )
			{
			// ?????? ?????????
			var extension = toUpper(fileName.substring(index+1));
			if( extension=="GIF" || extension=="JPG" || extension=="JPEG" || extension=="PNG" || extension=="BMP" )
			{
				return true;
			}
			else
			{
				return false;
			}
		}// index > 0
		else
		{
			return false;
		}
	}

//-------------------------------------------------------------------------
//??????????????? escapmXml????????? ???????????? ??????
//-------------------------------------------------------------------------
	function fn_escapeXml(tmp){
	    var tmpStr = tmp.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("'", "&#39;").replaceAll("\"", "&quot;");
	    return tmpStr;
	}
	
	String.prototype.trim = function()
	{
	  return this.replace(/(^\s*)|(\s*$)/gi, "");
	}
	String.prototype.replaceAll = function(str1, str2)
	{
	  var temp_str = this.trim();
	  temp_str = temp_str.replace(eval("/" + str1 + "/gi"), str2);
	  return temp_str;
	}

	
	
//-------------------------------------------------------------------------
//?????????(????????????) ???(???), ???(???)?????? ??????
//-------------------------------------------------------------------------
	function is_valid_yearMonth(p_yyyy, p_mm) {
		return is_valid_year(p_yyyy) && is_valid_month(p_mm);
	}

//-------------------------------------------------------------------------
//?????????(????????????) ???(???)?????? ??????
//-------------------------------------------------------------------------
	function is_valid_year(p_yyyy){
		var y = parseInt(p_yyyy,10);
		return (y >= 1800 && y <= 9999);
	}

//-------------------------------------------------------------------------
//?????????(????????????) ???(???)?????? ??????
//-------------------------------------------------------------------------
	function is_valid_month(p_mm) {
		var m = parseInt(p_mm,10);
		return (m >= 1 && m <= 12);
	}

//-------------------------------------------------------------------------
//?????????(????????????) ???(???)?????? ??????
//-------------------------------------------------------------------------
	function is_valid_day(p_yyyy, p_mm, p_dd) {
		var m = parseInt(p_mm,10) - 1;
		var d = parseInt(p_dd,10);
	
		var end = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
		if ((p_yyyy % 4 == 0 && p_yyyy % 100 != 0) || p_yyyy % 400 == 0) {
			end[1] = 29;
		}
	
		return (d >= 1 && d <= end[m]);
	}


//-------------------------------------------------------------------------
// ???????????? ????????? ?????? ????????? ??????
//-------------------------------------------------------------------------
	function fn_getLastDay( p_year, p_month) {
	
		var  dayOfMonth = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
	
		if ( ((p_year %4 == 0) && (p_year % 100 != 0))||(p_year % 400 == 0) )
			dayOfMonth[1] = 29;
		var v_days = dayOfMonth[p_month-1];
	
		return v_days;
	
	}

//-------------------------------------------------------------------------
//????????????
//-------------------------------------------------------------------------
	function is_leay_year( p_yyyy ) {
		if ((p_yyyy % 4 == 0 && p_yyyy % 100 != 0) || p_yyyy % 400 == 0) {
			return true;
		}
		return false;
	}
		
		
//-------------------------------------------------------------------------
//?????????(????????????) ???(???)?????? ??????
//-------------------------------------------------------------------------
	function is_valid_hour(p_hh) {
		var h = parseInt(p_hh,10);
		return (h >= 0 && h <= 24);
	}

//-------------------------------------------------------------------------
//?????????(????????????) ???(???)?????? ??????
//-------------------------------------------------------------------------
	function is_valid_min(p_mi) {
		var m = parseInt(p_mi,10);
		return (m >= 0 && m <= 59);
	}

//-------------------------------------------------------------------------
//?????????(????????????) ???(???)?????? ??????
//-------------------------------------------------------------------------
	function is_valid_sec(p_ss) {
		var s = parseInt(p_ss,10);
		return (s >= 0 && s <= 59);
	}

//-------------------------------------------------------------------------
//email ??? ????????? ????????? ???????????? ??????
//-------------------------------------------------------------------------
	function is_email( p_email ) {
	
		var format = /^((\w|[\-\.])+)@((\w|[\-\.])+)\.([A-Za-z]+)$/;
	
		if (p_email.search(format) != -1) {
			return true; //????????? ?????? ??????
		}
		alert("????????? ????????? ????????? ??????????????????.");
		return false;
	}

//-------------------------------------------------------------------------
//????????? ????????? ????????? ????????? ???????????? ??????.
//-------------------------------------------------------------------------
function is_mobile_number( phoneNum ) {

    var regExp =/(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;

    if (!regExp.test(phoneNum)) {
        alert("?????????????????? ????????? ??????????????????.");
        return false
    }
    return true;

}

//-------------------------------------------------------------------------
// ???????????? ??????????????? ????????? ????????? ???????????? ??????
//-------------------------------------------------------------------------/
	function fn_getNumber(sVal)
	{
		var pstr, sstr, ii;
		sstr = sVal;
		pstr = "";
		for(ii=0; ii<sstr.length; ii++) {
			//isNaN() : ????????????????????? ?????? ????????? false,????????? ????????? true??? ??????
			if( !isNaN(sstr.substr(ii, 1)) )
				pstr = pstr + sstr.substr(ii, 1);
		}
		return pstr;
	}
		
//-------------------------------------------------------------------------
//?????? ???????????? ???????????? ???????????? ?????? ?????? ??????
//-------------------------------------------------------------------------
	function is_valid_date(p_date,in_param){
		var p_param = in_param || "";
		var v_date = p_date;
	
		if ( isEmpty(v_date) ) {
			alert("????????? ???????????? ???????????????.");
			return false;
		}
	
		v_date = fn_getNumber(v_date);
	
		if ( v_date.length != 8 ){
			alert(p_param+'????????? ?????? ?????????????????????.');
			return false;
		}
	
		if ( !is_number(v_date)){
			alert(p_param+'????????? ????????? ????????? ??? ????????????.');
			return false;
		}
	
		var v_year    = parseInt(v_date.substring(0,4),10);
		var v_month   = parseInt(v_date.substring(4,6),10);
		var v_day     = parseInt(v_date.substring(6,8),10);
	
		if ( !is_valid_year(v_year) ){
			alert(p_param+'????????? ?????? ?????????????????????. ????????? 1800????????? 9999????????? ?????????.');
			return false;
		}
		if ( !is_valid_month(v_month) ){
			alert(p_param+'????????? ?????? ?????????????????????. ?????? 1????????? 12????????? ?????????.');
			return false;
		}
		if ( v_day < 1 || v_day > fn_getLastDay(v_year, v_month) ){
			alert(p_param+'????????? ?????? ?????????????????????.'+v_year+'??? '+v_month+'????????? '+v_day+'?????? ????????????.');
			return false;
		}
	
		return true;
	}

//-------------------------------------------------------------------------
//????????? ???????????? ???????????? ?????? ???????????? ??????
//-------------------------------------------------------------------------
	function is_valid_time( p_time ) {
	
		var v_time  = p_time;
	
		if ( isEmpty(v_time) ) {
			alert("????????? ????????? ????????????");
			return false;
		}
	
		v_time = fn_getNumber(v_time);
	
		if ( v_time.length != 6 ){
			alert('????????? ?????? ?????????????????????.');
			return false;
		}
	
		if ( !is_number(v_time)){
			alert('????????? ????????? ????????? ??? ????????????.');
			return false;
		}
	
		var v_hour  = parseInt(v_time.substring(0,2),10);
		var v_min   = parseInt(v_time.substring(2,4),10);
		var v_sec   = parseInt(v_time.substring(4,6),10);
	
		if( !is_valid_hour(v_hour) ){
			alert("????????? ?????? ?????????????????????.????????? 0~24?????? ?????????.");
			return false;
		}
		if( !is_valid_min(v_min) ){
			alert("?????? ?????? ?????????????????????.?????? 0~59?????? ?????????.");
			return false;
		}
		if( !is_valid_sec(v_sec) ){
			alert("?????? ?????? ?????????????????????.?????? 0~59?????? ?????????.");
			return false;
		}
		return true;
	}


//-------------------------------------------------------------------------
//????????? ???????????? ???????????? ?????? ???????????? ??????
//-------------------------------------------------------------------------
	function is_valid_timehm( p_time ) {
	
		var v_time  = p_time;
	
		if ( isEmpty(v_time) ) {
			alert("????????? ????????? ????????????");
			return false;
		}
	
		v_time = fn_getNumber(v_time);
	
		if ( v_time.length != 4 ){
			alert('????????? ?????? ?????????????????????.');
			return false;
		}
	
		if ( !is_number(v_time)){
			alert('????????? ????????? ????????? ??? ????????????.');
			return false;
		}
	
		var v_hour  = parseInt(v_time.substring(0,2),10);
		var v_min   = parseInt(v_time.substring(2,4),10);
	
		if( !is_valid_hour(v_hour) ){
			alert("????????? ?????? ?????????????????????.????????? 0~24?????? ?????????.");
			return false;
		}
		if( !is_valid_min(v_min) ){
			alert("?????? ?????? ?????????????????????.?????? 0~59?????? ?????????.");
			return false;
		}
		return true;
	}

//-------------------------------------------------------------------------
//?????? ???????????? ???????????? ?????? ???????????? ??????
//is_valid_period(?????????, ?????????)
//-------------------------------------------------------------------------
	function is_valid_period( p_date1, p_date2 , p_name1 , p_name2 ) {
	
		var v_date1 = p_date1;
		var v_date2 = p_date2;
	
		var v_name1 = p_name1 || "";
		var v_name2 = p_name2 || "";
	
		if ( !is_valid_date(v_date1) ){
			return false;
		}
		if ( !is_valid_date(v_date2) ){
			return false;
		}
		if ("" == v_name1) {
			v_name1 = "?????????";
		}
		if ("" == v_name2) {
			v_name2 = "?????????";
		}
	
		if ( v_date1 > v_date2 ){
			alert(v_name1 + "("+v_date1+")??? " + v_name2 + "("+v_date2+")?????? ??????????????? ?????????.");
			return false;
		}
	
		return true;
	
	}

//-------------------------------------------------------------------------
//?????? ??????????????? ????????????
//-------------------------------------------------------------------------
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

//-------------------------------------------------------------------------
// ????????? ?????? ????????? ????????? ????????????
// @param aro_name {object} ?????? ????????? ??? input element
// @param ari_max {number} ?????? ??????
// @param displayId {string} ?????? ???????????? ???????????? HTML ????????? ?????????
// @param propertyName {string} ???????????? ????????? ??????
//-------------------------------------------------------------------------
function fc_chk_length(aro_name, ari_max, displayId, propertyName){
    var content = aro_name.value;

    if(content.length > ari_max){
        alert(propertyName + '??? ?????? ' + ari_max + '????????? ?????? ???????????????.');
        aro_name.value = content.slice(0, ari_max);
    }

    $('#'+displayId).html(aro_name.value.length);
}


//-------------------------------------------------------------------------
//????????????
//-------------------------------------------------------------------------
function fnGoLogout() {
	location.href = "/admin/login/logout.do";
}

function openPopup(url, width, height, popupName, scrollFlag){
	
	var popWidth = width;
    var popHeight = height;
    var winHeight = document.body.clientHeight;	// ???????????? ??????
    var winWidth = document.body.clientWidth;	// ???????????? ??????
    var winX = window.screenX || window.screenLeft || 0;// ???????????? x?????? 
    var winY = window.screenY || window.screenTop || 0;	// ???????????? y?????? 
    var popX = winX + (winWidth - popWidth) / 2;
    var popY = winY + (winHeight - popHeight) / 2;
    
    var scrollbars = "yes";
    if(scrollFlag){
    	scrollbars = scrollFlag;
    }    
    
    window.open(url, popupName, "width=" + popWidth + ",height=" + popHeight + ",top=" + popY + ",left=" + popX + ",scrollbars=" + scrollbars);
}



/**
 * ??? ????????? ????????? ????????? ?????????.(?????? ????????? - ?????? ?????????)
 *
 * @param val1 - ?????? ?????????(?????? ex.2002-01-01)
 * @param val2 - ?????? ?????????(?????? ex.2002-01-01)
 * @return ????????? ???????????? ??????
 */
function calDateRange(d1, d2)
{
    var val1 = $.trim(d1);
    var val2 = $.trim(d2);
    var FORMAT = "-";

    // FORMAT??? ????????? ?????? ??????
    if (val1.length != 10 || val2.length != 10){
        return null;
    }


    // FORMAT??? ????????? ??????
    if (val1.indexOf(FORMAT) < 0 || val2.indexOf(FORMAT) < 0) {
        return null;
    }

    // ??????, ???, ?????? ??????
    var start_dt = val1.split(FORMAT);
    var end_dt = val2.split(FORMAT);



    // ??? - 1(????????????????????? ?????? 0?????? ???????????? ?????????...)
    // Number()??? ???????????? 08, 09?????? 10????????? ???????????? ???.
    start_dt[1] = (Number(start_dt[1]) - 1) + "";
    end_dt[1] = (Number(end_dt[1]) - 1) + "";

    var from_dt = new Date(start_dt[0], start_dt[1], start_dt[2]);
    var to_dt = new Date(end_dt[0], end_dt[1], end_dt[2]);


    return (to_dt.getTime() - from_dt.getTime()) / 1000 / 60 / 60 / 24;
}

/**
 * ???????????? ?????????
 * */
function getToday(){

    var date = new Date();

    var year  = date.getFullYear();
    var month = date.getMonth() + 1; // 0?????? ??????????????? 1?????? ??????
    var day   = date.getDate();

    if (("" + month).length == 1) { month = "0" + month; }
    if (("" + day).length   == 1) { day   = "0" + day;   }

    return year +"-"+ month +"-"+ day;

}



//-------------------------------------------------------------------------
// ???????????????, 1000?????? ??????
//-------------------------------------------------------------------------
function inputNumberFormat(obj) {
    $(obj).keyup(function(){
        $(this).val(comma(uncomma($(this).val().replace(/[^0-9]/g,""))));
    });
}

//-------------------------------------------------------------------------
// 1000?????? ??????(,)
//-------------------------------------------------------------------------
function comma(str) {
	str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

//-------------------------------------------------------------------------
// ??????(,) ??????
//-------------------------------------------------------------------------
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

//-------------------------------------------------------------------------
// ?????????(-) ??????
//-------------------------------------------------------------------------
function unHyphen(str) {
    str = String(str);
    return str.replace(/\-/g,'');
}

//-------------------------------------------------------------------------
// ???????????? ????????????
//-------------------------------------------------------------------------
function scheduleStateTxt(scheduleState) {
	var returnTxt = "";
    if(scheduleState == '0'){
        returnTxt = "????????????"
	}else if(scheduleState == '1'){
        returnTxt = "????????????"
    }else if(scheduleState == '2'){
        returnTxt = "????????????"
    }else if(scheduleState == '8'){
        returnTxt = "???????????????"
    }else if(scheduleState == '7'){
        returnTxt = "??????????????????"
    }else{
        returnTxt = "????????????"
	}
    return returnTxt;
}

(function(window, document, navigator) {
    /**
	 * ????????? ????????? ????????? ??????, ??????????????? ?????? ????????? ????????? ????????????.
     */
	var CommonUtil = {};

    /**
	 * ??????????????? ?????? ??????
     * @return {boolean} true??? ?????????, false??? ????????????
     */
    CommonUtil.isMobile = function() {
		var isMobile = false; //initiate as false
		// device detection
		if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|ipad|iris|kindle|Android|Silk|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(navigator.userAgent)
			|| /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(navigator.userAgent.substr(0,4))) isMobile = true;

		return isMobile;
	};

    /**
	 * SNS ??????
     * @param {object} options
     * @param {string} options.platform SNS ????????? ?????? (facebook | twitter | kakaolink | band)
	 * @param {string} options.title ??????
	 * @param {string} options.description ??????
	 * @param {string} options.url ?????? ???????????? ??????
	 * @param {string} options.image ?????? ????????? ??????
     */
	CommonUtil.sendSns = function(options) {
		var platform = options.platform;
		var title = options.title;
        var description = options.description;
		var url = options.url;
		var image = options.image;

        var titleReplaced = title.replace(/<(\/)?([a-zA-Z1-9]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/g,"");
        var descriptionReplaced = description.replace(/<(\/)?([a-zA-Z1-9]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/g,"");

        if(platform === 'kakaolink' || platform === 'band'){
            if(!isMobile.any){
                alert("????????? ???????????? ??????????????? ???????????????. ?????????????????? ??????????????????.");
                return false;
            }
        }

        switch (platform) {
			case 'facebook':
				FB.ui({
					method: 'share',
					href: url
				}, function() {
                    $("#sns_layer_popup").hide();
				});
				break;
			case 'twitter':
				window.open('http://twitter.com/intent/tweet?text=' + title + '&url=' + encodeURIComponent(url),
                    'intent', 'left=0,top=0,width=550,height=450,personalbar=0,toolbar=0,scrollbars=0,resizable=0');
				break;
			case 'kakaolink':
                Kakao.Link.sendDefault({
                    objectType: 'feed',
                    content: {
                        title: titleReplaced,
                        description: descriptionReplaced,
                        imageUrl: image,
                        link: {
                            mobileWebUrl: url,
                            webUrl: url
                        }
                    },
                    fail:function(){
                        alert("????????? ???????????? ??????????????? ???????????????. ?????????????????? ??????????????????.");
                    },
                    success:function()
                    {
                        $("#sns_layer_popup").hide();
                    }
                });
				break;
            case 'band':
                window.open("http://www.band.us/plugin/share?body="+ encodeURIComponent(titleReplaced) + encodeURIComponent('\r\n') + encodeURIComponent(url) + "&route=" + url + "", "share_band", "width=410, height=540, resizable=no");
                break;
            default:
                alert('???????????? ?????? SNS?????????.');
                return false;
		}
	};

    /**
	 * Hash fragments ?????? key, value ????????? ????????? ??????
     */
	CommonUtil.getHashParam = function() {
        var hashParams = {};
        var e,
            a = /\+/g,
            r = /([^&;=]+)=?([^&;]*)/g,
            d = function (s) { return decodeURIComponent(s.replace(a, ' ')); },
            q = window.location.hash.substring(1);

        while (e = r.exec(q))
            hashParams[d(e[1])] = d(e[2]);

        return hashParams;
    };

	/**
	 * ???????????? ????????? ?????? ????????? _ ????????????
	 */
    CommonUtil.setInvestorTmp = function(investorData){
    	var flag = false;
        var rewardInvestor = {}
			, rewardProject = {};

        if('Y' == investorData.simulationFlag){
            rewardInvestor.investType = "????????????";
        }else if('N' == investorData.simulationFlag){
            rewardInvestor.investType = "??????";
        }

        /* ??????(??????)?????? ??? ?????? */
		if(investorData.investorSeq) rewardInvestor.investorSeq = investorData.investorSeq;
		if(investorData.projectSeq) rewardInvestor.projectSeq = investorData.projectSeq;
		if(investorData.omcpay) rewardInvestor.omcpay = investorData.omcpay;
		if(investorData.couponId) rewardInvestor.couponId = investorData.couponId;
		if(investorData.couponPoint) rewardInvestor.couponPoint = investorData.couponPoint;
		if(investorData.paymethod) rewardInvestor.paymethod = investorData.paymethod;
		if(investorData.investorHp) rewardInvestor.investorHp = investorData.investorHp;
		if(investorData.receiveName) rewardInvestor.receiveName = investorData.receiveName;
		if(investorData.hp) rewardInvestor.hp = investorData.hp;
		if(investorData.email) rewardInvestor.email = investorData.email;
		if(investorData.postno) rewardInvestor.postno = investorData.postno;
		if(investorData.addr1) rewardInvestor.addr1 = investorData.addr1;
		if(investorData.addr2) rewardInvestor.addr2 = investorData.addr2;
		if(investorData.memo) rewardInvestor.memo = investorData.memo;
		if(investorData.supportComment) rewardInvestor.supportComment = investorData.supportComment;
		if(investorData.addAmt) rewardInvestor.addAmt = investorData.addAmt;
		if(investorData.expenseAmt) rewardInvestor.expenseAmt = investorData.expenseAmt;
		if(investorData.orderno) rewardInvestor.orderno = investorData.orderno;

        /* ???????????? ??? ?????? */
        if(investorData.fundingType) rewardProject.fundingType = investorData.fundingType;

        var param = {
			rewardItemList: investorData.rewardItemList,
			rewardInvestor: rewardInvestor,
			rewardProject: rewardProject
		};

		$.ajax({
			method: 'POST',
			url: '/reward/save/investorTmpAjax.do',
			async: false,
			dataType : 'json',
			contentType:"application/json; charset=UTF-8" ,
			data: JSON.stringify(param),
			success: function(data) {
				if(data.rewardJoinVO.rewardInvestor.investorSeq){
					$("#investorSeq").val(data.rewardJoinVO.rewardInvestor.investorSeq);
				}
				if(data.code == 200){
                    flag = true;
				}else if(data.code == 401){
                   // - ????????? ??? ????????? ?????? ?????? : ????????? ???????????? ??????
                    alert("????????? ??? ????????? ???????????????.");
                    var returnUrl = "";
                    if(investorData.projectSeq){
                        returnUrl = 'returnUrl=/reward/'+investorData.projectSeq;
					}
                    $(location).attr('href', '/login/form?'+returnUrl);
                    return;
				}else{
					alert("????????? ?????? ????????? ????????? ????????????.");
                    if(investorData.projectSeq){
                        $(location).attr('href', '/reward/'+investorData.projectSeq);
                    }else{
                        $(location).attr('href', '/main');
					}
				}
			},
			error: function() {
				alert('????????? ?????? ????????? ????????? ????????????.');
                if(investorData.projectSeq){
                    $(location).attr('href', '/reward/'+investorData.projectSeq);
                }else{
                    $(location).attr('href', '/main');
                }
			}
		});
    	return flag;
	};

    /**
     * ??????(,) ???????????? ????????? ????????? ?????? input ????????? ???????????? ????????? ??????
     * @param target {string|object}
     * @return {number} ?????? ??????, ????????? NaN
     */
	CommonUtil.getNumberFrom = function(target) {
		var str;

		if (typeof target === 'string') {
			str = target;
        } else if (typeof target === 'object' && typeof target.val === 'function') {
			str = target.val();
		} else {
			console.warn('CommonUtil.getNumberFrom:: ????????? ???????????????.');
		}

		str = (typeof str === 'string') ? uncomma(str.trim()) : '';

		return parseInt(str);
	};

    /**
     * ????????? ????????? || ???????????? ????????? ??????
     * @param target {$(document)}
     * @return false
     */
    CommonUtil.setRefreshKeyControl = function(target) {
        target.document.contextmenu(function (e) {
           return false;
        });
        target.document.keydown(function (e) {
            if (e.which === 116) {
                if (typeof event == "object") {
                    event.keyCode = 0;
                }
            return false;
            } else if ((e.which === 78 || e.which === 82 || e.which === 85) && e.ctrlKey) {
                return false;
            }
        });
    };

    /**
     * ???????????? ????????? ??????
     * @param target {window, history}
     */
    CommonUtil.historyBackControl = function(target) {
        target.history.pushState(null, null, target.location.href);
        target.window.onpopstate = function (event) {
            target.history.go(1);
        };
    };

    /**
	 * ?????? ????????? ????????? ??????
	 * @param {number} value ?????????
	 * @param {number} exp ?????????
	 * @return {number} ?????? ??????
     */
    CommonUtil.floor10 = function(value, exp) {
        return decimalAdjust('floor', value, exp);
    };

    /**
     * ?????? ????????? ???????????? ??????
     * @param {number} value ?????????
     * @param {number} exp ?????????
	 * @return {number} ?????? ??????
     */
    CommonUtil.round10  = function(value, exp) {
        return decimalAdjust('round', value, exp);
    };

    /**
     * ?????? ????????? ????????? ??????
     * @param {number} value ?????????
     * @param {number} exp ?????????
     * @return {number} ?????? ??????
     */
    CommonUtil.ceil10  = function(value, exp) {
        return decimalAdjust('ceil', value, exp);
    };

    /**
	 * CommonUtil.floor10, round10, ceil10??? ?????? ?????? ??????
     * @param type ?????? ??????,(??????, ?????????, ??????)
     * @param value ?????? ???
     * @param exp ?????????
     * @returns {*}
     */
    function decimalAdjust(type, value, exp) {
        if (typeof exp === 'undefined' || +exp === 0) {
            return Math[type](value);
        }
        value = +value;
        exp = +exp;
        if (isNaN(value) || !(typeof exp === 'number' && exp % 1 === 0)) {
            return NaN;
        }
        // ????????? ?????? ??????
        value = value.toString().split('e');
        value = Math[type](+(value[0] + 'e' + (value[1] ? (+value[1] - exp) : -exp)));
        value = value.toString().split('e');
        return +(value[0] + 'e' + (value[1] ? (+value[1] + exp) : exp));
    }

	CommonUtil.getTinymceConfig = function (options) {
		var contentCss = options.contentCss;
		var alignUse = options.alignUse;
		var widthRate = options.widthRate;
		var mode = options.mode;
		var initCall = options.initCall;
		var fullscreen = options.fullscreen;

    	var config = {
			selector: '#content',
			content_css : contentCss,
			plugins: [
				'advlist autolink autosave link image lists charmap print preview hr anchor pagebreak',
				'searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking',
				'contextmenu directionality emoticons template textcolor paste textpattern'
			],
			language: 'ko_KR',
			color_map: [
				'000000', 'Black',
				'80c72d', 'Green',
				'1568a6', 'Blue'
			],
			toolbar : 'undo redo styleselect forecolor bold italic underline strikethrough superscript subscript hr blockquote | link | media | image',
			body_class: 'edit-style',
			formats: {
				underline: {inline: 'u'},
				strikethrough: {inline: 's'},
				subscript: {inline: 'sup'},
				superscript: {inline: 'sub'}
			},
			extended_valid_elements: 'area[shape|coords|href|target|onfocus]',
			style_formats: [{
				title: '??? ??????',
				block: 'h2'
			}, {
				title: '?????? ??????',
				block: 'h3'
			}, {
				title: '?????? ??????',
				block: 'h4'
			}, {
				title: '??????',
				block: 'p'
			}],
			forced_root_block: 'p',
			statusbar: false,
			menubar: false,
			media_live_embeds: true,
			default_link_target: '_blank',
			height: 500,
			image_title: false,
			image_description: false,
			image_caption: true,
			automatic_uploads: false,
			relative_urls: false,
			file_picker_types: 'image',
			paste_preprocess: function(plugin, args) {
				var regExp = '<table[^<]*>';
				if (args.content.match(regExp) != null) {
					alert("?????? ????????? ??? ????????????.");
					args.content = "";
				}
				var styleRegExp = /([ ]+style='[^']+')|([ ]+style="[^"]+")/gi;
				args.content = args.content.replace(styleRegExp, '');

				var classRegExp = /([ ]+class='[^']+')|([ ]+class="[^"]+")/gi;
				args.content = args.content.replace(classRegExp, '');

				var idRegExp = /([ ]+id='[^']+')|([ ]+id="[^"]+")/gi;
				args.content = args.content.replace(idRegExp, '');
			},
			images_upload_handler: function (blobInfo, success, failure) {
				var xhr, formData;

				xhr = new XMLHttpRequest();
				xhr.withCredentials = false;
				xhr.open('POST', '/cmm/fms/insertEditorImageAjax');

				xhr.onload = function() {
					var json;

					if (xhr.status !== 200) {
						failure('HTTP Error: ' + xhr.status);
						return;
					}

					json = JSON.parse(xhr.responseText);

					if (!json || typeof json.location != 'string') {
						failure('Invalid JSON: ' + xhr.responseText);
						return;
					}

					success(json.location);
				};

				formData = new FormData();
				formData.append('file', blobInfo.blob(), blobInfo.filename());

				xhr.send(formData);
			},
            setup: function (editor) {
                var addEventTimer;
                var triggerClickTimer;

                function triggerClickUploadTab() {
                    var uploadTab = $('.tox-dialog__body-nav-item').eq(1);
                    if (uploadTab.length) {
                        uploadTab.trigger('click');
                        clearInterval(triggerClickTimer);
                    }
                }

                function addEventHandler() {
                    var imageToolbarButton = $('button[title="????????? ??????/??????"]');
                    if (imageToolbarButton.length) {
                        imageToolbarButton.click(function() {
                            triggerClickTimer = setInterval(triggerClickUploadTab, 10);
                        });
                        clearInterval(addEventTimer);
                    }
                }

                editor.on('init', function () {
                    addEventTimer = setInterval(addEventHandler, 100);
                });
            }
		};

    	if (alignUse) {
    		config.toolbar = config.toolbar + ' | alignleft aligncenter alignright';
		}
    	if (widthRate != null) {
			config.width = widthRate;
		}
    	if (mode) {
    		delete config.selector;
    		config.mode = 'textareas';
		}
    	if (initCall) {
    		config.init_instance_callback = function(){
				endScript();
			}
		}
    	if (fullscreen) {
			config.toolbar = 'fullscreen | ' + config.toolbar;
		}

		return config;
	};

	CommonUtil.getSimpleTinymceConfig = function (mode) {
		var config = {
			selector: '#content',
			plugins: [
				"advlist autolink autosave link image lists charmap print preview hr anchor pagebreak",
				"searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
				"contextmenu directionality emoticons template textcolor paste textcolor colorpicker textpattern"
			],
			language: "ko_KR",
			toolbar: "undo redo | styleselect | bold italic underline strikethrough forecolor backcolor superscript subscript hr charmap emoticons blockquote | link | media | image | custom_image",
			content_css:"/omc/asset/css/edit.css",
			body_class: "edit-style",
			statusbar:false,
			menubar: false,
			media_live_embeds: true,
			default_link_target: "_blank",
			height: 500,
			relative_urls : false,
			image_title: true,
			automatic_uploads: false,
			file_picker_types: 'image',
			paste_preprocess: function(plugin, args) {
				var regExp = '<table[^<]*>';
				if (args.content.match(regExp) != null) {
					alert("?????? ????????? ??? ????????????.");
					args.content = "";
				}
				var styleRegExp = /([ ]+style='[^']+')|([ ]+style="[^"]+")/gi;
				args.content = args.content.replace(styleRegExp, '');

				var classRegExp = /([ ]+class='[^']+')|([ ]+class="[^"]+")/gi;
				args.content = args.content.replace(classRegExp, '');
			},
			images_upload_handler: function (blobInfo, success, failure) {
				var xhr, formData;

				xhr = new XMLHttpRequest();
				xhr.withCredentials = false;
				xhr.open('POST', '/cmm/fms/insertEditorImageAjax');

				xhr.onload = function() {
					var json;

					if (xhr.status !== 200) {
						failure('HTTP Error: ' + xhr.status);
						return;
					}

					json = JSON.parse(xhr.responseText);

					if (!json || typeof json.location != 'string') {
						failure('Invalid JSON: ' + xhr.responseText);
						return;
					}

					success(json.location);
				};

				formData = new FormData();
				formData.append('file', blobInfo.blob(), blobInfo.filename());

				xhr.send(formData);
			},
			setup: function (editor) {
				var addEventTimer;
				var triggerClickTimer;

				function triggerClickUploadTab() {
					var uploadTab = $('.tox-dialog__body-nav-item').eq(1);
					if (uploadTab.length) {
						uploadTab.trigger('click');
						clearInterval(triggerClickTimer);
					}
				}

				function addEventHandler() {
					var imageToolbarButton = $('button[title="????????? ??????/??????"]');
					if (imageToolbarButton.length) {
						imageToolbarButton.click(function() {
							triggerClickTimer = setInterval(triggerClickUploadTab, 10);
						});
						clearInterval(addEventTimer);
					}
				}

				editor.on('init', function () {
					addEventTimer = setInterval(addEventHandler, 100);
				});
			}
		};

		if ('faq' === mode) {
			config.toolbar = 'undo redo | styleselect | bold italic underline strikethrough forecolor backcolor superscript subscript hr charmap emoticons blockquote | link | media | image | custom_image';
		} else if ('inquiry' === mode) {
			config.selector = '#answerContent';
			config.toolbar = 'undo redo | styleselect | bold italic underline strikethrough forecolor backcolor superscript subscript hr charmap emoticons blockquote | link';
		} else if ('investor' === mode) {
			config.toolbar = 'undo redo | styleselect | bold italic underline strikethrough forecolor backcolor superscript subscript hr charmap emoticons blockquote | link | media | image | custom_image';
			config.menubar = true;
			config.height = 300;

		}

		return config;
	};

	window.CommonUtil = CommonUtil;
})(window, document, navigator);


//-------------------------------------------------------------------------
// Emojis ?????? ??????
//-------------------------------------------------------------------------
function check_emojis (string) {
    var pattern = /(?:[\u2700-\u27bf]|(?:\ud83c[\udde6-\uddff]){2}|[\ud800-\udbff][\udc00-\udfff]|[\u0023-\u0039]\ufe0f?\u20e3|\u3299|\u3297|\u303d|\u3030|\u24c2|\ud83c[\udd70-\udd71]|\ud83c[\udd7e-\udd7f]|\ud83c\udd8e|\ud83c[\udd91-\udd9a]|\ud83c[\udde6-\uddff]|\ud83c[\ude01-\ude02]|\ud83c\ude1a|\ud83c\ude2f|\ud83c[\ude32-\ude3a]|\ud83c[\ude50-\ude51]|\u203c|\u2049|[\u25aa-\u25ab]|\u25b6|\u25c0|[\u25fb-\u25fe]|\u00a9|\u00ae|\u2122|\u2139|\ud83c\udc04|\u2b05|\u2b06|\u2b07|\u2b1b|\u2b1c|\u2b50|\u2b55|\u231a|\u231b|\u2328|\u23cf|[\u23e9-\u23f3]|[\u23f8-\u23fa]|\ud83c\udccf|\u2934|\u2935|[\u2190-\u21ff])/g;
    if(pattern.test(string)){
    	return true;
	}
	return false;
}

//-------------------------------------------------------------------------
// Emojis ?????? ??????
//-------------------------------------------------------------------------
function remove_emojis (string) {
    var regex = /(?:[\u2700-\u27bf]|(?:\ud83c[\udde6-\uddff]){2}|[\ud800-\udbff][\udc00-\udfff]|[\u0023-\u0039]\ufe0f?\u20e3|\u3299|\u3297|\u303d|\u3030|\u24c2|\ud83c[\udd70-\udd71]|\ud83c[\udd7e-\udd7f]|\ud83c\udd8e|\ud83c[\udd91-\udd9a]|\ud83c[\udde6-\uddff]|\ud83c[\ude01-\ude02]|\ud83c\ude1a|\ud83c\ude2f|\ud83c[\ude32-\ude3a]|\ud83c[\ude50-\ude51]|\u203c|\u2049|[\u25aa-\u25ab]|\u25b6|\u25c0|[\u25fb-\u25fe]|\u00a9|\u00ae|\u2122|\u2139|\ud83c\udc04|\u2b05|\u2b06|\u2b07|\u2b1b|\u2b1c|\u2b50|\u2b55|\u231a|\u231b|\u2328|\u23cf|[\u23e9-\u23f3]|[\u23f8-\u23fa]|\ud83c\udccf|\u2934|\u2935|[\u2190-\u21ff])/g;
    return string.replace(regex, '');
}
//-------------------------------------------------------------------------
// Text ??? URL??? ????????? ??????????????? ??????
//-------------------------------------------------------------------------
function addHyperLinkInText (string) {
 var regex = /((http|https|ftp):\/\/[\w?=&.\/-;#~%-]+(?![\w\s?&.\/;#~%"=-]*>))/gi;
 return string.replace(regex, '<a href="$1" target="_blank">$1</a>');
}