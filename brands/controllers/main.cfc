<cfcomponent output="false" accessors="true">

	<cfproperty name="brandService" />
	<cfset brandService = createObject("component","brands.model.services.brands") />

	<cffunction name="init" returntype="Any" access="public">
		<cfargument name="fw" type="any" required="true" />
		<cfset variables.fw = fw />
		<cfreturn this />
	</cffunction>

	<cffunction name="default" returntype="void" access="public">
		<cfargument name="rc" type="any" required="true" />
		<cfset rc.brandList = brandService.listBrands() />
	</cffunction>

	<cffunction name="editbrand" returntype="void" access="public">
		<cfargument name="brandName" type="string" />
		<cfargument name="slug" type="string" />
		<cfset variables.brand = '' />
		<cfset rc.formSuccess = "" />
		<cfset rc.formError = "" />
		<cfset rc.showForm = true />

		<cfparam name="rc.formSubmit" default="0" />
		<cfparam name="rc.slug" default="" />
		<cfparam name="rc.brandName" default="" />
		<cfparam name="rc.brandID" default="" />

		<cfif (rc.formSubmit eq 1)>
			<!--- Edit form has been submitted --->
			<cfif (rc.slug eq "")>
				<cfset rc.formError = rc.formError & 'Slug is required' />
			</cfif>
			<cfif (rc.brandName eq "")>
				<cfset rc.formError = rc.formError & 'Brand Name is required'/>
			</cfif>
			<cfif (rc.formError eq "")>
				<cfset rc.brandEdit = getBrandService().updateBrands(
					brandName=arguments.brandName
					,slug=arguments.slug
					,brandId=arguments.brandId
				) />
				<cfif rc.brandEdit = True>
					<cfset rc.formSuccess = "Brand saved successfully."/>
					<cfset rc.showForm = false />
				</cfif>
			<cfelse>
				<!--- Form not submitted, load brand from DB --->
				<cfset brand = getBrandService().brandFromID(rc.brandID) />
				<cfif brand.recordcount>
					<cfset rc.slug = brand.Slug />
					<cfset rc.brandName = brand.BrandName />
				<cfelse>
					<cfthrow message='Brand does not exist' />
				</cfif>
			</cfif>
		</cfif>
	</cffunction>

	<cffunction name="createBrand" returntype="void" access="public">
		<cfargument name="brandName" type="string" required="true"/>
		<cfargument name="slug" type="string" required="true"/>
		<cfset variables.brand = '' />
		<cfset rc.formSuccess = "" />
		<cfset rc.formError = "" />
		<cfset rc.showForm = true />

		<cfparam name="rc.formSubmit" default="0" />
		<cfparam name="rc.slug" default="" />
		<cfparam name="rc.brandName" default="" />

		<cfset rc.cBrands = getBrandService().createBrands(
			brandName=arguments.brandName
			,brandId=arguments.brandId
		) />
		<cfif (rc.formSubmit eq 1)>
			<!--- Edit form has been submitted --->
			<cfif (rc.slug eq "")>
				<cfset rc.formError = rc.formError & 'Slug is required' />
			</cfif>
			<cfif (rc.brandName eq "")>
				<cfset rc.formError = rc.formError & 'Brand Name is required'/>
			</cfif>
			<cfif (rc.formError eq "")>
				<cfset rc.brandEdit = getBrandService().updateBrands(
					brandName=arguments.brandName
					,slug=arguments.slug
				) />
				<cfif rc.brandEdit = True>
					<cfset rc.formSuccess = "Brand created successfully."/>
					<cfset rc.showForm = false />
				</cfif>
			</cfif>
		</cfif>
	</cffunction>
</cfcomponent>
