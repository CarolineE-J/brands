<cfcomponent accessors="true">

	<cfproperty name="brandService" />
	<cfset variables.brand = StructNew() />

    <cffunction name="init" access="public" returntype="struct">
        <cfargument name="slug" type="string" required="false" default="">
        <cfargument name="name" type="string" required="false" default="">
        <cfargument name="id" type="string" required="false" default="">
        <cfset data = {} />
        <cfset this.setSlug(arguments.slug) />
        <cfset this.setBrandName(arguments.name) />
        <!--- id not always going to be passed in --->
        <cfif structKeyExists(arguments, "id")>
            <cfset this.setBrandID(arguments.id) />
        </cfif>
        <cfreturn this />
    </cffunction>

	<cffunction name="getMemento" access="public" returntype="struct" output="false" hint="returns data stored from getters and setters">
		<cfreturn variables.brand />
	</cffunction>

    <cffunction name="validate" access="public" returntype="Array" output="false">
    	<cfset var errors = arrayNew(1) />
    	<!--- Brand ID not always required (create function) so there's no check to see if it exists only---->
    	<cfif (len(trim(getBrandID())) AND NOT isNumeric(trim(getBrandID())))>
    		<cfset arrayAppend(errors, "ID must be numeric.") />
    	</cfif>

        <!--- Slug will always be required for the bean --->
    	<cfif (NOT len(trim(getSlug())))>
			<cfset arrayAppend(errors,"Slug is required.") />
		</cfif>

        <!--- Brand name will always be required for the bean --->
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
