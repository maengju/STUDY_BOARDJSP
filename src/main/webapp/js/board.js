$(function(){
	$('#writeBtn').click(function(){
		
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		
		if($('input[name="subject"]').val()==''){
			$('#subjectDiv').html('제목 입력');
			
		}else if($('textarea[name="content"]').val()==''){
			$('#contentDiv').html('내용 입력');
		}else{
			$('form[name="boardWriteForm"]').submit();
		}
	}); /*$('#writeBtn').click(function()*/
	
	
	
	
	
});