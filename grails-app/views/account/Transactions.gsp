<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>See transactions</title>
  <meta name="layout" content="main"/>
</head>

<body>
<div>
  <h2>Transactions<g:if test="${account != null}"> for ${account.name}</g:if></h2>
  <br/>
  <!--There shouldn't be any errors when displaying this page-->
  <g:form url="[action: 'listTransactionsFor']">
    <b>Person:</b>
    <g:select id="id" name="id" from="${accounts}" optionKey="id" optionValue="name" required="" value="${account?.id}"/>
    <br/>
    <b><g:submitButton name="create" class="save" value="${message(code: 'default.button.submit.label', default: 'Submit')}"/></b>
  </g:form>

  <g:if test="${account != null}">
    <div>Balance: ${account.balance}</div>

    <h2>Incoming Transactions</h2>
    <table>
      <thead>
      <tr>
        <td>From</td>
        <td>Amount</td>
      </tr>
      </thead>
      <g:each var="transaction" in="${account.incomingTransactions}">
        <tr>
          <td>${transaction.from.name}</td>
          <td>${transaction.amount}</td>
        </tr>
      </g:each>
    </table>

    <h2>Outgoing Transactions</h2>
    <table>
      <thead>
      <tr>
        <td>To</td>
        <td>Amount</td>
      </tr>
      </thead>
    <g:each var="transaction" in="${account.outgoingTransactions}">
      <tr>
        <td>${transaction.to.name}</td>
        <td>${transaction.amount}</td>
      </tr>
    </g:each>
    </table>

  </g:if>
</div>
</body>
</html>