<cfcomponent output="false">

	<cfset brandDAO = createObject("component","brands.model.dao.brands") />
	<!--- <cfproperty name="brandBean" default="" /> --->

	<cffunction name="init" output="false" access="public" returntype="any">
		<cfreturn this>
	</cffunction>

	<cffunction name="brandFromID" access="public" output="false" returntype="Query">
		<cfargument name="brandID" type="numeric" required="true"/>
		<cfset local.data = brandDAO.brandFromID(brandID=arguments.brandID)>
		<cfreturn local.data>
	</cffunction>

	<cffunction name="listBrands" access="public" output="false" returntype="query">
    	<cfset local.data = brandDAO.listBrands()>
        <cfreturn local.data>
    </cffunction>

    <cffunction name="updateBrand" access="public" output="false" returntype="void">
		<cfargument name="bean" type="struct" required="true"/>
		<cfset update = brandDAO.updateBrand(arguments.bean) />
    </cffunction>

	<cffunction name="createBrand" access="public" output="false" returntype="void">
		<cfargument name="brandName" type="string" required="true"/>
		<cfargument name="slug" type="string" required="true"/>
		<cfset create = brandDAO.createBrand(brandName=arguments.brandName,slug=arguments.slug) />
	</cffunction>

</cfcomponent>
