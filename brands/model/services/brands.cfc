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

    <cffunction name="editBrand" access="public" output="false" returntype="boolean">
		<cfargument name="brandInfo" type="struct" required="true"/>
		<cfset local.update = brandsDao.editBrand(
			name=arguments.brandInfo.name,
			slug=arguments.brandInfo.slug,
			id=arguments.brandInfo.id
		) />
		<cfreturn local.update />
    </cffunction>

	<cffunction name="createBrand" access="public" output="false" returntype="boolean">
		<cfargument name="brandInfo" type="struct" required="true"/>
		<cfset local.create = brandsDao.createBrand(
			name=arguments.brandInfo.name
			,slug=arguments.brandInfo.slug
			) />
		<cfreturn local.create />
	</cffunction>

</cfcomponent>
