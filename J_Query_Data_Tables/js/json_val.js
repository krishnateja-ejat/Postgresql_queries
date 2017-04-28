var arr=[]
var obj={}
var x=0;
var y=0;
var  oTable;
var h=0;

$(document).ready(function()
{
	$('#myForm').validator()
	$("#myDIV").hide();
	$("#btn").click(function()
	{

	var name=$('#f_name').val()
	var l_name=$('#l_name').val()
	var email=$('#e_mail').val()
	var phone=$('#p_number').val()
	obj={
		"name":name,
		"l_name":l_name,
		"email":email,
		"phone":phone
		};

		c(obj).done(function(arr)
		{

			$('#f_name').val("")
			$('#l_name').val("")
			$('#e_mail').val("")
			$('#p_number').val("")

              $("#myDIV").show();
			  oTable=$('#test').dataTable
			({  
				destroy: true,
	   			searching: true,

	    		"aaData": arr,
	    		"aoColumns": 
	    		[ 
			        { "mDataProp": "name"  },
			        { "mDataProp": "l_name" },
					{ "mDataProp": "email" },
			        { "mDataProp": "phone", },
			        { "targets": -1, "data": null, "defaultContent": "<input id='btn' type='button' class='btn btn-success' width='25px' value='Edit' onclick='edit() ' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo'/>   <input id='btn' type='button' class='btn btn-success' onclick='dele()' width='25px' value='Delete' />", "":h=0}   
	    			
	    		]
			});

		})	
	})
	$("#u_btn").click(function()
		{
			for(i=0;i<arr.length;i++)
				{
					if(x===arr[i].email)
					{
						arr[i].name=$('#u_f_name').val()
						arr[i].l_name=$('#u_l_name').val()
						arr[i].email=$('#u_e_mail').val()
						arr[i].phone=$('#u_p_number').val()
						aft_del(arr);
					}
				}
		})
	
});
function c(val)
{
	arr.push(val)
	var def=$.Deferred();
	def.resolve(arr);
	return def;
	
}
function edit()
{
	if(h===0)
	{
		oTable.$('td').click( function ()
		{         	
			var sData = oTable.fnGetData(this);
			x=sData.email;
			for(i=0;i<arr.length;i++)
				{
					if(x===arr[i].email)
					{
						$('#u_f_name').val(arr[i].name)
						$('#u_l_name').val(arr[i].l_name)
						$('#u_e_mail').val(arr[i].email)
						$('#u_p_number').val(arr[i].phone)
					}
				}

		});
		h++;
	}
	
}
function dele()
{
	
	if(h===0)
	{
			oTable.$('td').click( function ()
		{         	
			var sData = oTable.fnGetData(this);
			x=sData.email;
			for(i=0;i<arr.length;i++)
				{
					if(x===arr[i].email)
					{
						arr.splice(i,1);
						aft_del(arr)
					}
				}

		});
		h++;
	}
}
function aft_del(arr)
{	
	
			if(arr.length==0)
			{
				$("#myDIV").hide();
			}



			  oTable=$('#test').dataTable
			({  
				destroy: true,
	   			searching: true,

	    		"aaData": arr,
	    		"aoColumns": 
	    		[ 
			        { "mDataProp": "name"  },
			        { "mDataProp": "l_name" },
					{ "mDataProp": "email" },
			        { "mDataProp": "phone", },
			        { "targets": -1, "data": null, "defaultContent": "<input id='btn' type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' value='Edit' onclick='edit() '/>   <input id='btn' type='button' class='btn btn-success' onclick='dele()' width='25px' value='Delete' />", "":h=0}   
	    			
	    		]
			});
}
	
$('#exampleModal').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) 
  var recipient = button.data('whatever') 
  var modal = $(this)
 
});

		
	
  

