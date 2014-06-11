package com.james.payment

import grails.transaction.Transactional
import grails.validation.ValidationException

/**
 * Service class for making payments between accounts
 */
@Transactional
class PaymentService {

    def EmailService emailService;

    /**
     * Creates a transaction between two accounts. The amount will be debited from the {@link Transaction#from} account and added to the {@link Transaction#to} account.
     * If there are insufficient funds in the from account this will fail. It will also fail when the from and too accounts are equal.
     *
     * @param transaction the transaction to be processed
     * @return the transaction that was processed
     */
    def Transaction moveMoney(Transaction transaction) {
        if (!transaction.validate()) {
            throw new ValidationException("Amount is too large", transaction.errors);
        }

        def fromAccount = transaction.from
        def toAccount = transaction.to

        fromAccount.balance -= transaction.amount
        toAccount.balance += transaction.amount
        if (!transaction.from.validate()) {
            throw new ValidationException("Amount is too large", fromAccount.errors)
        }

        fromAccount.save()
        toAccount.save()
        transaction.save()

        // really I'd like to just send an event here and have a listener pick this up to be done else where. Couldnt get it to work though.
        emailService.sendEmails(transaction);

        return transaction;
    }
}
