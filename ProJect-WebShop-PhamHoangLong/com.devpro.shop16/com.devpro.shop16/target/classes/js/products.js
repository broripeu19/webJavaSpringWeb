$('.btn-add').on('click', function(){
	var currentNumber = $(this).closest('.num').find('input[name="number_prd"]').val();
	var type = $(this).attr('data-type');
	if(type == 'add'){
		$(this).closest('.num').find('input[name="number_prd"]').val((parseInt(currentNumber) + 1));
	}else{
		if(currentNumber >= 1){
			$(this).closest('.num').find('input[name="number_prd"]').val((parseInt(currentNumber) - 1));
		}
	}
	
});