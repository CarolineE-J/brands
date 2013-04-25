<cfcomponent output="false">

	<cfset brandDAO = createObject("component","brands.model.dao.brands") />
	<!--- <cfproperty "brandsDAO" /> --->

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
		<cfargument name="bean" type="struct" required="true"/>
		<cfset create = brandDAO.createBrand(bean=arguments.bean) />
	</cffunction>

</cfcomponent>
