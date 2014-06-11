package com.james.payment

import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * Controller for the {@link Transaction}s.
 */
@Transactional(readOnly = true)
class TransactionController {

    def PaymentService paymentService;

    static allowedMethods = [save: "POST"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Transaction.list(params), model:[transactionInstanceCount: Transaction.count()]
    }

    def show(Transaction transactionInstance) {
        respond transactionInstance
    }

    def create() {
        return [accounts: Account.list()]
    }

    @Transactional
    def save(Transaction transactionInstance) {
        try {
            paymentService.moveMoney(transactionInstance);
        } catch (ValidationException ex) {
            respond transactionInstance, view:'create', model: [accounts: Account.list()]
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'transaction.label', default: 'Transaction'), transactionInstance.id])
                redirect transactionInstance
            }
            '*' { respond transactionInstance, [status: CREATED] }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'transaction.label', default: 'Transaction'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
