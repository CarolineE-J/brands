<cfoutput>
	<h2>List Brands</h2>
		<table>
			<tr>
				<th>Brand ID</th>
				<th>Brand Name</th>
				<th>Slug</th>
				<th>Edit</th>
			</tr>
			<cfloop query="rc.brandList">
				<tr>
					<td>#rc.brandList.BrandID#</td>
                	<td>#rc.brandList.BrandName#</td>
                	<td>#rc.brandList.Slug#</td>
					<td><a href="#buildUrl(action='main.editbrand', queryString='brandID=' & rc.brandList.BrandID)#">Edit</a></td>
				</tr>
			</cfloop>
		</table>
	<p><a href="#buildUrl(action='main.createbrand')#">Create</a></p>
</cfoutput>
