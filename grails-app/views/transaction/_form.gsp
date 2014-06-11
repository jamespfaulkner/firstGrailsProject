<%@ page import="com.james.payment.Transaction" %>



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
	<g:select id="from" name="from.id" from="${com.james.payment.Account.list()}" optionKey="id" required="" value="Hello ${transactionInstance?.from?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'to', 'error')} required">
	<label for="to">
		<g:message code="transaction.to.label" default="To" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="to" name="to.id" from="${accounts}" optionKey="id" required="" value="${name}" class="many-to-one"/>

</div>

