<cfcomponent accessors="true">

	<cfproperty name="brandService" />
	<cfset variables.brand = StructNew() />

    <cffunction name="init" access="public" returntype="brand">
        <cfargument name="slug" type="string" required="false" default="">
        <cfargument name="name" type="string" required="false" default="">
        <cfargument name="id" type="string" required="false" default="0">
        <cfset setSlug(arguments.slug) />
        <cfset setBrandName(arguments.name) />
        <cfset setBrandID(arguments.id) />
        <cfreturn this />
    </cffunction>

	<cffunction name="getMemento" access="public" returntype="struct" output="false" >
		<cfreturn variables.brand />
	</cffunction>

    <cffunction name="validate" access="public" returntype="Array" output="false">
    	<cfset var errors = arrayNew(1) />

    	<!--- Brand ID ---->
    	<cfif (len(trim(getBrandID())) AND NOT isNumeric(trim(getBrandID())))>
    		<cfset arrayAppend(errors, "ID must be numeric.") />
    	</cfif>

    	<cfif (NOT len(trim(getSlug())))>
			<cfset arrayAppend(errors,"Slug is required.") />
		</cfif>

		<cfif (NOT len(trim(getBrandName())))>
			<cfset arrayAppend(errors,"Brand Name is required.") />
		</cfif>
		<cfreturn errors />
    </cffunction>

    <cffunction name="getBrandID" access="public" returntype="string">
        <cfreturn variables.brand.id>
    </cffunction>
    <cffunction name="setBrandID" access="public" returntype="void">
        <cfargument name="id" type="string" required="true">
        <cfset variables.brand.id = arguments.id>
    </cffunction>

    <cffunction name="getSlug" access="public" returntype="string">
        <cfreturn variables.brand.slug>
    </cffunction>
    <cffunction name="setSlug" access="public" returntype="void">
        <cfargument name="slug" type="string" required="true">
        <cfset variables.brand.slug = arguments.slug>
    </cffunction>

    <cffunction name="getBrandName" access="public" returntype="string">
        <cfreturn variables.brand.name>
    </cffunction>
    <cffunction name="setBrandName" access="public" returntype="void">
        <cfargument name="name" type="string" required="true">
        <cfset variables.brand.name = arguments.name>
    </cffunction>

<cfreturn variables.brand />

</cfcomponent>
