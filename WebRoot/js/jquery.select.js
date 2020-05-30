(function($){

	var selects=$('select');//获取select

	for(var i=0;i<selects.length;i++){
		createSelect(selects[i],i);
	}

	function createSelect(select_container,index){

		//创建select容器，class为select_box，插入到select标签前
		var tag_select=$('<div></div>');//div相当于select标签
		tag_select.attr('class','select_box');
		tag_select.insertBefore(select_container);

		//显示框class为select_showbox,插入到创建的tag_select中
		var select_showbox=$('<div></div>');//显示框
		select_showbox.css('cursor','pointer').attr('class','select_showbox').appendTo(tag_select);

		//创建option容器，class为select_option，插入到创建的tag_select中
		var ul_option=$('<ul></ul>');//创建option列表
		ul_option.attr('class','select_option');
		ul_option.appendTo(tag_select);
		createOptions(index,ul_option);//创建option

		//点击显示框
		tag_select.toggle(function(){
			ul_option.show();
			ul_option.parent().find(".select_showbox").addClass("active");
		},function(){
			ul_option.hide();
			ul_option.parent().find(".select_showbox").removeClass("active");
		});

		var li_option=ul_option.find('li');
		li_option.on('click',function(){
			$(this).addClass('selected').siblings().removeClass('selected');
			var value=$(this).text();
			select_showbox.text(value);
			//ul_option.hide();
		});

		li_option.hover(function(){
			$(this).addClass('hover').siblings().removeClass('hover');	
		},function(){
			li_option.removeClass('hover');
		});

	}

	function createOptions(index,ul_list){
		//获取被选中的元素并将其值赋值到显示框中
		//var options=selects.eq(index).find('option'),
			selected_option=options.filter(':selected'),
			selected_index=selected_option.index(),
			showbox=ul_list.prev();
			showbox.text(selected_option.text());
		
		//为每个option建立个li并赋值
		for(var n=0;n<options.length;n++){
			var tag_option=$('<li></li>'),//li相当于option
				txt_option=options.eq(n).text();
			tag_option.text(txt_option).appendTo(ul_list);

			//为被选中的元素添加class为selected
			if(n==selected_index){
				tag_option.attr('class','selected');
			}
		}
	}

})(jQuery)