<cfcomponent extends="mxunit.Framework.TestCase">

<cffunction name="setUp" access="public" output="false" returntype="void">
	<cfset variables.brands=createObject("component","brands.model.dao.brands") />
</cffunction>

<cffunction name="updateBrands" access="public" output="false" returntype="void">
	<cfset local.result = variables.brands.updateBrands(
		brandName='changing'
		,slug='this should change'
		,brandID=4
		) />
	<cfset debug(local.result) />
	<cfset assertEquals('True',result,"result should have been '' but was #local.result#") />
</cffunction>

</cfcomponent>
