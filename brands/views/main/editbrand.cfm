<cfoutput>
    <h2>Edit Brand</h2>
    <p><a href="#buildUrl('main.default')#">Back to Brand List</a></p>

    <cfif rc.showForm>
        <form action="#buildUrl(action='main.editbrand', queryString='brandID=' & rc.brandID)#" method="post">
            <input type="hidden" name="formSubmit" value="1" />
            <p>Brand name: <input type="text" name="brandName" width="10" value="#rc.brand.getBrandName()#"></p>
            <p>Slug: <input type="text" name="slug" width="10" value="#rc.brand.getSlug()#"></p>
            <p><button type="submit">Update</button></p>
        </form>
    </cfif>
</cfoutput>
