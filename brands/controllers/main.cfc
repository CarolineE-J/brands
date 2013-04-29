<cfcomponent accessors="true">

	<cfproperty name="brandsService" />

	<cffunction name="init" returntype="Any" access="public">
		<cfargument name="fw" required="true" type="any"/>
		<cfset variables.fw = arguments.fw />
		<cfreturn this />
	</cffunction>

	<cffunction name="default" returntype="void" access="public">
		<cfargument name="rc" type="any" required="true" />
		<cfset rc.brandList = brandsService.listBrands() />
	</cffunction>

	<cffunction name="editbrand" returntype="void" access="public">
		<cfargument name="rc" type="any" required="true" />
		<cfset rc.formSuccess = "" />
		<cfset rc.showForm = true />
		<cfset rc.brandEdit = "" />

		<cfparam name="rc.formSubmit" default="0" />
		<cfparam name="rc.slug" default="" />
		<cfparam name="rc.brandName" default="" />
		<cfparam name="rc.brandID" default="" />
		<cfparam name="rc.brand" default="" />
		<cfparam name="rc.formSuccess" default="" />
		<cfparam name="rc.formError" default="" />

		<cfif (rc.formSubmit neq 1)>
			<cfset local.brand=brandsService.brandFromID(rc.brandID) />
			<cfif local.brand.recordcount >
				<cfset rc.brand = fw.getBeanFactory().getBean("brand").init(name=brand.BrandName,slug=brand.Slug) />
			<cfelse>
				<cfset rc.formError="Brand does not exist" />
			</cfif>
		<cfelse>
			<cfset local.brand = fw.getBeanFactory().getBean("brand").init(name=rc.brandName,slug=rc.slug,id=rc.brandID) />
			<cfset local.validate = local.brand.validate() />
				<cfif local.validate eq "">
					<cfset rc.brandEdit = brandsService.editBrand(
						brandBean=local.brand
					) />
					<cfif rc.brandEdit>
						<cfset rc.formSuccess = "Brand saved successfully."/>
						<cfset rc.showForm = false />
					</cfif>
				<cfelse>
					<cfset rc.formError = "#local.validate#">
				</cfif>
		</cfif>
	</cffunction>

	<cffunction name="createBrand" returntype="void" access="public">
		<cfargument name="rc" type="any" required="true"/>
		<cfset rc.showForm = true />

		<cfparam name="rc.formSubmit" default="0" />
		<cfparam name="rc.slug" default="" />
		<cfparam name="rc.brandName" default="" />
		<cfparam name="rc.formSuccess" default="" />
		<cfparam name="rc.formError" default="" />

		<cfif rc.formSubmit eq 1>
			<cfset local.brand = fw.getBeanFactory().getBean("brand").init(name=rc.brandName,slug=rc.slug) />
			<cfset local.validate = local.brand.validate() />
			<cfif local.validate eq "">
				<cfset rc.brandCreate = brandsService.createBrand(
					brandBean=local.brand
				) />
				<cfif rc.brandCreate>
					<cfset rc.formSuccess = "Brand created successfully!"/>
					<cfset rc.showForm = false />
				</cfif>
			<cfelse>
				<cfset rc.formError = "#local.validate#">
			</cfif>
		</cfif>
	</cffunction>
</cfcomponent>
