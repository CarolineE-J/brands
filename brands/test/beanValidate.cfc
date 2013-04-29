<cfcomponent accessors="true" extends="mxunit.Framework.TestCase">

<cffunction name="setUp" access="public" output="false" returntype="void">
	<cfset variables.beanfactory = CreateObject("component", "brands.ioc").init("model/beans/") />
	<cfset variables.brands = variables.beanfactory.getBean("brand") />
</cffunction>

<cffunction name="validateName" access="public" output="false" returntype="void">
	<cfset local.callBean = variables.brands.init(name="",slug="failure",id=3) />
	<cfset local.validate = local.callBean.validate() />
	<cfset debug(local.result) />
	<cfset assertEquals('Error - Brand Name is required.',result,"result should have been Error - Brand Name is required. but was #local.result#") />
</cffunction>

<cffunction name="validateSlug" access="public" output="false" returntype="void">
	<cfset local.callBean = variables.brands.init(name="failure",slug="",id=3) />
	<cfset local.validate = local.callBean.validate() />
	<cfset debug(local.result) />
	<cfset assertEquals('Error - Slug is required.',result,"result should have been Error - Slug is required. but was #local.result#") />
</cffunction>

<cffunction name="validateId" access="public" output="false" returntype="void">
	<cfset local.callBean = variables.brands.init(name="fail",slug="failure",id="") />
	<cfset local.validate = local.callBean.validate() />
	<cfset debug(local.result) />
	<cfset assertEquals('Error - ID must be numeric.',result,"result should have been Error - ID must be numeric. but was #local.result#") />
</cffunction>

</cfcomponent>
