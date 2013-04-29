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
		<cfargument name="brandBean" type="brand" required="true"/>
		<cfset local.update = brandsDao.editBrand(
			name=arguments.brandBean.getBrandName(),
			slug=arguments.brandBean.getSlug(),
			id=arguments.brandBean.getBrandID()
		) />
		<cfreturn local.update />
    </cffunction>

	<cffunction name="createBrand" access="public" output="false" returntype="boolean">
		<cfargument name="brandBean" type="brand" required="true"/>
		<cfset local.create = brandsDao.createBrand(
			name=arguments.brandBean.getBrandName()
			,slug=arguments.brandBean.getSlug()
			) />
		<cfreturn local.create />
	</cffunction>

</cfcomponent>
