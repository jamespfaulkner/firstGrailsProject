package com.james.payment

/**
 * Representation of an account. Contains a name, email, amount and the incoming and outgoing transactions.
 */
class Account {

    String name
    String email
    BigDecimal balance = 200.0

    static hasMany = [
            incomingTransactions: Transaction,
            outgoingTransactions: Transaction
    ]

    static mappedBy = [
            incomingTransactions: "from",
            outgoingTransactions: "to"
    ]

    static constraints = {
        name blank: false, nullable: false
        email blank: false, nullable: false, email: true
        balance nullable: false, min: 0.0, scale: 2
    }
}
