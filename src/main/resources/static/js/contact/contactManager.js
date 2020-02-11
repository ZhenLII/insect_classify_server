$(function(){
	$("#contact_table").bootstrapTable({ 
		sidePagination: "server",
	    pagination: true,
	    pageSize: 5,
	    pageList: [3,5,7,9],
	    locale: "zh-CN",
	    cache : false,
	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    url: "/contact/list",
	    method: "post",
	    columns: [
	    	{
	    		"title" : "ID",
		        "field" : "id",
				"align" : "center"
			},
			{
	    		"title" : "联系人",
		        "field" : "contactPerson",
				"align" : "center"
			},
			{
	    		"title" : "联系电话",
		        "field" : "contactPhone",
				"align" : "center",
			},
			{
	    		"title" : "省",
		        "field" : "province",
				"align" : "center",
			},
			{
	    		"title" : "市",
		        "field" : "city",
				"align" : "center",
			},
			{
	    		"title" : "县区",
		        "field" : "county",
				"align" : "center",
			},
	    ]
	});
})