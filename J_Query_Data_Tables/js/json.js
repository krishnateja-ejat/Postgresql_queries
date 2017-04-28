var arr=[];
function json_call()
{
	
	var f_name=document.getElementById('f_name').value
	var l_name=document.getElementById('l_name').value
	var email=document.getElementById('e_mail').value
	var num=document.getElementById('p_number').value
	var data={
		"f_name":f_name,
		"l_name":l_name,
		"email":email,
		"num":num
	};
	arr.push(data)
	add_data(arr)
	clearField()
}
function clearField()
{
	document.details_form.reset();
}
function add_data(arr)
{
	
	var tbody = document.getElementById('tbodyData');
	var newTBody = document.createElement('tbody');
	newTBody.setAttribute("id","tbodyData");
	for(i=0;i<arr.length;i++)
	{

	    var row = newTBody.insertRow(i);
	    var cell1 = row.insertCell(0);
	    var cell2 = row.insertCell(1);
	    var cell3 = row.insertCell(2);
	    var cell4 = row.insertCell(3);
	    var cell5= row.insertCell(4);
	    var cell6=row.insertCell(5);
		cell1.innerHTML=arr[i].f_name;
		cell2.innerHTML=arr[i].l_name;
		cell3.innerHTML=arr[i].email;
		cell4.innerHTML=arr[i].num;
		cell5.innerHTML='<button  onclick="edit('+arr[i].email+')">EDIT</button>'
		cell6.innerHTML='<button  onclick="edit()">EDIT</button>'

	}
	var parentNode = tbody.parentNode;
	parentNode.replaceChild(newTBody,tbody);
}

function edit(val)
{
	for(i=0;i<arr.length;i++)
	{
		
		if(arr[i].email==val)
		{
			//alert(arr[i].l_name)
			var value=[]
			value.push(arr[i])
			value.push(arr)
			sessionStorage.setItem("sent", JSON.stringify(value));
			window.open("update.html","_blank");
		}
	};
	
}
/*function delete(val)
{
	arr.pop(val) ;
	add_data(arr)
}*/