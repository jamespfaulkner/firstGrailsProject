package com.james.payment

/**
 * Representation of a transaction between two accounts.
 */
class Transaction {

    Account from
    Account to
    BigDecimal amount
    Date dateCreated

    static constraints = {
        amount nullable: false, min: 0.01, scale: 2
        from nullable: false
        to nullable: false, validator: { val, obj ->
            if (val == obj.from) {
                return "transaction.error.fromAndToAreSame"
            }
        }
    }

    static mapping = {
        autoTimestamp true
    }
}
