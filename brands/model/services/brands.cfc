<cfcomponent accessors="true" output="false">

	<cfproperty name="brandsDao" />

	<cffunction name="init" output="false" access="public" returntype="any">
		<cfreturn this>
	</cffunction>

	<cffunction name="brandFromID" access="public" output="false" returntype="Query">
		<cfargument name="brandID" type="numeric" required="true"/>
		<cfset local.data = brandsDao.brandFromID(brandID=arguments.brandID)>
		<cfreturn local.data>
	</cffunction>

	<cffunction name="listBrands" access="public" output="false" returntype="query">
    	<cfset local.data = brandsDao.listBrands()>
        <cfreturn local.data>
    </cffunction>

    <cffunction name="updateBrand" access="public" output="false" returntype="boolean">
		<cfargument name="bean" type="struct" required="true"/>
		<cfset local.update = brandsDao.updateBrand(arguments.bean) />
		<cfreturn local.update />
    </cffunction>

	<cffunction name="createBrand" access="public" output="false" returntype="boolean">
		<cfargument name="bean" type="struct" required="true"/>
		<cfset local.create = brandsDao.createBrand(bean=arguments.bean) />
		<cfreturn local.create />
	</cffunction>

</cfcomponent>
