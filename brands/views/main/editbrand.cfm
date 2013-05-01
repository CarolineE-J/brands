<cfoutput>
    <h2>Edit Brand</h2>

    <cfif rc.formSuccess neq "">
        <p style="color:##00cc33;font-weight:bold;">#rc.formSuccess#</p>
    </cfif>

    <cfif rc.formError neq "">
        <p style="color:##cc0000;font-weight:bold;">#rc.formError#</p>
    </cfif>

    <cfif rc.showForm>
        <form action="#buildUrl(action='main.editbrand', queryString='brandID=' & rc.brandID)#" method="post">
            <input type="hidden" name="formSubmit" value="1" />
            <p>Brand name: <input type="text" name="brandName" width="10" value="#rc.brand.BrandName#"></p>
            <p>Slug: <input type="text" name="slug" width="10" value="#rc.brand.Slug#"></p>
            <p><button type="submit">Update</button></p>
        </form>
    </cfif>

    <p><a href="#buildUrl('main.default')#">Back to Brand List</a></p>
    <p><a href="#buildUrl('main.createbrand')#">Create New Brand</a></p>

</cfoutput>
