<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'transaction.label', default: 'Transaction')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-transaction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-transaction" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${transactionInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${transactionInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
          <g:hasErrors bean="${transactionInstance?.from}">
            <ul class="errors" role="alert">
              <g:eachError bean="${transactionInstance?.from}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
              </g:eachError>
            </ul>
          </g:hasErrors>
			<g:form url="[resource:transactionInstance, action:'save']" >
				<fieldset class="form">
					%{--<g:render template="form"/>--}%
                  <h2>Here</h2>
                  <div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'amount', 'error')} required">
                  	<label for="amount">
                  		<g:message code="transaction.amount.label" default="Amount" />
                  		<span class="required-indicator">*</span>
                  	</label>
                  	<g:field name="amount" value="${fieldValue(bean: transactionInstance, field: 'amount')}" required=""/>

                  </div>

                  <div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'from', 'error')} required">
                  	<label for="from">
                  		<g:message code="transaction.from.label" default="From" />
                  		<span class="required-indicator">*</span>
                  	</label>
                  	<g:select id="from" name="from.id" from="${accounts}" optionKey="id" optionValue="name" required="" value="${transactionInstance?.from?.id}" class="many-to-one"/>

                  </div>

                  <div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'to', 'error')} required">
                  	<label for="to">
                  		<g:message code="transaction.to.label" default="To" />
                  		<span class="required-indicator">*</span>
                  	</label>
                  	<g:select id="to" name="to.id" from="${accounts}" optionKey="id" optionValue="name" required="" value="${transactionInstance?.to?.id}" class="many-to-one"/>

                  </div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
