<cfcomponent output="true" hint="the DAO cfc that gets all the brands in the given table.">

	<cffunction name="listBrands" returntype="query" access="public" output="false">
		<cfquery datasource="tester" name="local.data">
			SELECT BrandName AS brandName
				,Slug AS slug
				,BrandId AS brandId
			FROM tblBrand
			ORDER BY brandId
		</cfquery>
		<cfreturn local.data />
	</cffunction>

	<cffunction name="brandFromID" returntype="Query" access="public" output="false">
		<cfargument name="brandID" type="numeric" required="true">
		<cfquery datasource="tester" name="local.data">
			SELECT BrandID, BrandName, Slug
            FROM tblBrand
            WHERE BrandID = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.brandID#">
		</cfquery>
		<cfreturn local.data />
	</cffunction>

	<cffunction name="updateBrand" access="public" returntype="boolean" output="false">
		<cfargument name="bean" type="struct" required="true">
		<cfquery datasource="tester" name="local.update">
			UPDATE tblBrand
			SET BrandName=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.bean.name#" />
				,Slug=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.bean.slug#" />
			WHERE BrandId=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.bean.id#" />
		</cfquery>
		<cfreturn True />
	</cffunction>

	<cffunction name="createBrand" returntype="boolean" access="public" output="false">
		<cfargument name="bean" type="struct" required="true">
		<cfquery datasource="tester" name="local.create">
			INSERT INTO tblBrand(
				BrandName
				,Slug )
			VALUES(
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.bean.name#" />
				,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.bean.slug#" /> )
		</cfquery>
		<cfreturn True />
	</cffunction>

</cfcomponent>
