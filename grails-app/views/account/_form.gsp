<%@ page import="com.james.payment.Account" %>



<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="account.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${accountInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="account.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${accountInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'balance', 'error')} required">
	<label for="balance">
		<g:message code="account.balance.label" default="Balance" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="balance" value="${fieldValue(bean: accountInstance, field: 'balance')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'incomingTransactions', 'error')} ">
	<label for="incomingTransactions">
		<g:message code="account.incomingTransactions.label" default="Incoming Transactions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${accountInstance?.incomingTransactions?}" var="i">
    <li><g:link controller="transaction" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="transaction" action="create" params="['account.id': accountInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'transaction.label', default: 'Transaction')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'outgoingTransactions', 'error')} ">
	<label for="outgoingTransactions">
		<g:message code="account.outgoingTransactions.label" default="Outgoing Transactions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${accountInstance?.outgoingTransactions?}" var="o">
    <li><g:link controller="transaction" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="transaction" action="create" params="['account.id': accountInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'transaction.label', default: 'Transaction')])}</g:link>
</li>
</ul>


</div>

