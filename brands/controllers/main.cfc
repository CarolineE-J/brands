<cfcomponent output="false" accessors="true">

	<cfproperty name="brandsService" />
	<cfset brandsService = createObject("component","brands.model.services.brands") />
	<cfset variables.beanfactory = CreateObject("component", "brands.org.corfield.ioc").init("model/beans") />
	<cfset variables.brands = variables.beanfactory.getBean("brand") />
	<cfset variables.brandBean = variables.brands.getMemento() />

	<cffunction name="init" returntype="Any" access="public">
		<cfargument name="fw" type="any" required="true" />
		<cfset variables.fw = fw />
		<cfreturn this />
	</cffunction>

	<cffunction name="default" returntype="void" access="public">
		<cfargument name="rc" type="any" required="true" />
		<cfset rc.brandList = getBrandsService().listBrands() />
	</cffunction>

	<cffunction name="editbrand" returntype="void" access="public">
		<cfargument name="rc" type="any" required="true" />
		<cfset rc.formSuccess = "" />
		<cfset rc.formError = "" />
		<cfset rc.showForm = true />
		<cfset rc.brandEdit = "" />

		<cfparam name="rc.formSubmit" default="0" />
		<cfparam name="rc.slug" default="" />
		<cfparam name="rc.brandName" default="" />
		<cfparam name="rc.brandID" default="" />

		<cfset brand=getBrandsService().brandFromID(rc.brandID) />

		<cfif (rc.formSubmit neq 1)>
			<cfif brand.recordcount >
				<cfset rc.slug = brand.Slug />
				<cfset rc.brandName = brand.BrandName />
			<cfelse>
				<cfthrow message="Brand does not exist" />
			</cfif>
		<cfelse>
			<!--- Edit form has been submitted --->
			<cfif rc.slug eq "">
				<cfthrow message = 'Error - Slug is required' />
			</cfif>
			<cfif rc.brandName eq "">
				<cfthrow message = 'Error - Brand Name is required'/>
			</cfif>
			<cfif (rc.formError eq "")>
			<cfset local.brandBean = variables.brands.getMemento() && variables.brands.init(name=rc.brandName,slug=rc.slug,id=rc.brandID) />
			<cfdump var="#local.brandBean#"
			abort="true" />
				<cfset rc.brandEdit = getBrandsService().updateBrand(
					bean=local.brandBean
				) />
				<cfthrow message = "Brand saved successfully."/>
				<cfset rc.showForm = false />
			</cfif>
		</cfif>
	</cffunction>

	<cffunction name="createBrand" returntype="void" access="public">
		<cfargument name="rc" type="any" required="true"/>
		<cfset rc.formError = "" />
		<cfset rc.showForm = true />

		<cfparam name="rc.formSubmit" default="0" />
		<cfparam name="rc.slug" default="" />
		<cfparam name="rc.brandName" default="" />

		<cfif (rc.formSubmit eq 1)>
			<cfif rc.slug eq "">
				<cfthrow message = 'Error - Slug is required' />
			</cfif>
			<cfif rc.brandName eq "">
				<cfthrow message = 'Error - Brand Name is required'/>
			</cfif>
			<cfif (rc.formError eq "")>
				<cfset brandCreate = getBrandsService().createBrand(
					brandName=rc.brandName
					,slug=rc.slug
				) />
				<cfthrow message = "Brand created successfully!"/>
				<cfset rc.showForm = false />
			<cfelse>
				<cfthrow message = "Unable to load brand" />
			</cfif>
		</cfif>
	</cffunction>
</cfcomponent>
