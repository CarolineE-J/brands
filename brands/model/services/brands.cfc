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

    <cffunction name="updateBrand" access="public" output="false" returntype="void">
		<cfargument name="bean" type="struct" required="true"/>
		<cfset update = brandsDao.updateBrand(arguments.bean) />
    </cffunction>

	<cffunction name="createBrand" access="public" output="false" returntype="void">
		<cfargument name="bean" type="struct" required="true"/>
		<cfset create = brandsDao.createBrand(bean=arguments.bean) />
	</cffunction>

</cfcomponent>
