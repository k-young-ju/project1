<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <table>
    	<tr>
    		<td onclick="layer_up(0))">
	    		abc가나다
	    		<div id="lay_div[0]" style="position: absolute;z-index: 2;display: none">
	    			하위메뉴1<br>하위메뉴
	    		</div>
    		</td>	
    	</tr>
    	<tr>
    		<td onclick="layer_up(1))">
	    		abc가나다
	    		<div id="lay_div[1]" style="position: absolute;z-index: 2;display: none">
	    			하위메뉴1<br>하위메뉴
	    		</div>
    		</td>	
    	</tr>
    </table>
    <script>
    function layer_up(num){
    	document.getElementById("lay_div["+num+"]").style.display="block";
    	
    }
    
    </script>