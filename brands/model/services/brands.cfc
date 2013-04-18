<cfcomponent output="false">

	<cfset brandDAO = createObject("component","brands.model.dao.brands") />

	<cffunction name="init" output="false" access="public">
		<cfreturn this>
	</cffunction>

	<cffunction name="listBrands" access="public" output="false">
    	<cfset local.data = brandDAO.listBrands()>
        <cfreturn local.data>
    </cffunction>

    <cffunction name="updateBrand" access="public" output="false">
		<cfargument name="brandName" type="string" required="true"/>
		<cfargument name="slug" type="string" required="true"/>
		<cfargument name="brandID" type="numeric" required="true"/>
		<cfset local.update = brandDAO.updateBrand(brandName=arguments.brandName
			,slug=arguments.slug
			,brandID=arguments.brandID) />
    </cffunction>

	<cffunction name="createBrand" access="public" output="false">
		<cfargument name="brandName" type="string" required="true"/>
		<cfargument name="slug" type="string" required="true"/>
		<cfset local.create = brandDAO.createBrand(brandName=arguments.brandName,slug=arguments.slug) />
	</cffunction>

</cfcomponent>
