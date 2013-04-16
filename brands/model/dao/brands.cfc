<cfcomponent output="true" hint="the DAO cfc that gets all the brands in the given table.">

	<cffunction name="listBrands" returntype="query" access="public">
		<cfquery datasource="tester" name="data">
			SELECT BrandName AS brandName
				,Slug AS slug
				,BrandId AS brandId
			FROM tblBrand
			ORDER BY brandId
		</cfquery>
		<cfreturn data />
	</cffunction>

	<cffunction name="brandFromID" access="public" returntype="Query">
    	<cfargument name="brandID" type="numeric" required="yes">
        <cfquery datasource="tester" dbtype="query" name="data">
        	SELECT BrandID, BrandName, Slug
            FROM tblBrand
            WHERE BrandID = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.brandID#">
        </cfquery>
        <cfreturn data>
    </cffunction>

	<cffunction name="updateBrands" returntype="boolean" access="public">
		<cfargument name="brandName" type="string" required="true">
		<cfargument name="slug" type="string" required="true">
		<cfargument name="brandId" type="int" required="true">
		<cfquery datasource="tester" name="local.update">
			UPDATE tblBrand
			SET BrandName=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.brandName#" />
			 ,Slug=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.slug#" />
			 WHERE BrandId=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.brandId#" />
			SELECT @@ROWCOUNT AS rows_affected
		</cfquery>
		<cfreturn local.update.rows_affected gt 0 />
	</cffunction>

	<cffunction name="createBrands" returntype="boolean" access="public">
		<cfargument name="newBrandName" type="string" required="true">
		<cfargument name="newSlug" type="string" required="true">
		<cfquery datasource="tester" name="local.create">
		INSERT INTO tblBrand(
			BrandName
			,Slug
			)
		VALUES(
			<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.brandName#" />
			,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.slug#" />
			)
		SELECT @@ROWCOUNT AS rows_affected
		</cfquery>
		<cfreturn local.create.rows_affected gt 0 />
	</cffunction>

</cfcomponent>
