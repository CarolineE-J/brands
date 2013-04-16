<cfoutput>

    <h2>Edit Brand</h2>
    <p><a href="#buildUrl('main.default')#">Back to Brand List</a></p>

    <cfif rc.formSuccess neq "">
    	<p style="color:##0C3;font-weight:bold;">#rc.formSuccess#</p>
    </cfif>

    <cfif rc.formError neq "">
    	<p style="color:##C00;font-weight:bold;">#rc.formError#</p>
    </cfif>

    <cfif rc.showForm>

        <form name="brands_form" action="#buildUrl(action='main.editbrand', queryString='brandID=' & rc.brandID)#" method="post">
            <input type="hidden" name="formSubmit" value="1" />
            <p>Brand name: <input type="text" name="brandName" width="10" value="#rc.brandName#"></p>
            <p>Slug: <input type="text" name="slug" width="10" value="#rc.slug#"></p>
            <p><button type="submit">Update</button></p>
        </form>

    </cfif>

</cfoutput>
