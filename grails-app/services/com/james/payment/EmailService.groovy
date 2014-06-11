package com.james.payment

/**
 * Deals with sending Emails in certain scenarios.
 * <br/>
 * Really this should be called from an Event Listener somewhere
 */
class EmailService {

    // dont need this to be transactional
    static transactional = false

    /**
     * Send the emails that should be fired when a Transaction is completed
     *
     * @param transaction the transaction that was completed
     */
    def sendEmails(Transaction transaction) {
        sendIncomingTransactionMail(transaction)
        sendOutgoingTransactionMail(transaction)
    }

    def sendIncomingTransactionMail(Transaction transaction) {
        sendMail {
          to transaction.to.email
          subject "Incoming transaction"
          body "Hi.\nYou have an incoming transaction of ${transaction.amount} from ${transaction.from.name}"
        }
    }

    def sendOutgoingTransactionMail(Transaction transaction) {
        sendMail {
          to transaction.from.email
          subject "Incoming transaction"
          body "Hi.\nYou have an outgoing transaction of ${transaction.amount} from ${transaction.to.name}"
        }
    }
}
