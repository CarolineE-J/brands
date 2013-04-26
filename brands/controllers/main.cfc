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
		<cfset rc.formError = "" />
		<cfset rc.showForm = true />
		<cfset rc.brandEdit = "" />

		<cfparam name="rc.formSubmit" default="0" />
		<cfparam name="rc.slug" default="" />
		<cfparam name="rc.brandName" default="" />
		<cfparam name="rc.brandID" default="" />

		<cfif (rc.formSubmit neq 1)>
			<cfset local.brand=brandsService.brandFromID(rc.brandID) />
			<cfif local.brand.recordcount >
				<cfset rc.slug = brand.Slug />
				<cfset rc.brandName = brand.BrandName />
			<cfelse>
				<cfthrow message="Brand does not exist" />
			</cfif>
		<cfelse>
			<cfif (rc.formError eq "")>
			<cfset local.brands = fw.getBeanFactory().getBean("brand") />
			<cfset local.callBean = local.brands.init(name=rc.brandName,slug=rc.slug,id=rc.brandID) />
			<cfset local.validate = local.callBean.validate() />
				<cfif local.validate eq "">
					<cfset local.brandBean = local.callBean.getMemento() />
					<cfset rc.brandEdit = brandsService.updateBrand(
						bean=local.brandBean
					) />
					<cfif rc.brandEdit>
						<cfthrow message = "Brand saved successfully."/>
						<cfset rc.showForm = false />
					</cfif>
				<cfelse>
					<cfthrow message = "#local.validate#">
				</cfif>
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
			<cfif (rc.formError eq "")>
				<cfset local.brands = fw.getBeanFactory().getBean("brand") />
				<cfset local.callBean = local.brands.init(name=rc.brandName,slug=rc.slug) />
				<cfset local.validate = local.callBean.validate() />
				<cfif local.validate eq "">
					<cfset local.brandBean = local.callBean.getMemento() />
					<cfset rc.brandCreate = brandsService.createBrand(
						bean=local.brandBean
					) />
					<cfif rc.brandCreate>
						<cfthrow message = "Brand created successfully!"/>
						<cfset rc.showForm = false />
					</cfif>
				<cfelse>
					<cfthrow message = "#local.validate#">
				</cfif>
			<cfelse>
				<cfthrow message = "Unable to load brand" />
			</cfif>
		</cfif>
	</cffunction>
</cfcomponent>
