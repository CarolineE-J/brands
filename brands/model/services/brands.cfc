<cfcomponent output="false">

	<cfset brandDAO = createObject("component","brands.model.dao.brands") />

	<cffunction name="init" output="false" access="public">
		<cfreturn this>
	</cffunction>

	<cffunction name="listBrands" access="public" output="false">
    	<cfset local.data = brandDAO.listBrands()>
        <cfreturn local.data>
    </cffunction>

    <cffunction name="brandFromID" access="public" output="false">
    	<cfargument name="brandID" type="numeric" required="yes">
    	<cfset var brand = brandDAO.brandFromID()>
        <cfreturn brand>
    </cffunction>

    <cffunction name="updateBrands" access="public" output="false">
		<cfargument name="brandName" type="string" required="true"/>
		<cfargument name="slug" type="string" required="true"/>
		<cfargument name="brandId" type="numeric" required="true"/>
		<cfset local.update = brandDAO.updateBrands(arguments.brandName,arguments.brandId,arguments.slug) />
		<cfreturn local.update />
    </cffunction>

	<cffunction name="createBrands" returntype="boolean" access="public">
		<cfargument name="brandName" type="string" required="true"/>
		<cfargument name="slug" type="string" required="true"/>
		<cfset local.create = brandDAO.createBrands(arguments.brandName,arguments.slug) />
		<cfreturn local.create />
	</cffunction>

</cfcomponent>
