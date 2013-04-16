<cfcomponent extends="mxunit.Framework.TestCase">

<cffunction name="setUp" access="public" output="false" returntype="void">
	<cfset variables.brands=createObject("component","brands.model.services.brands") />
</cffunction>

<cffunction name="brandFromID" access="public" output="false" returntype="void">
	<cfset local.result = variables.brands.brandFromID(brandID=4) />
	<cfset debug(local.result) />
	<cfset assertEquals('',result,"result should have been '' but was #local.result#") />
</cffunction>

</cfcomponent>
