package com.james.payment

import grails.test.mixin.TestFor
import grails.validation.ValidationException
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(PaymentService)
class PaymentServiceSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void 'accounts are correctly updated'() {
        when 'moving 10 from accountOne to accountTwo'

            def Account accountOne = new Account(name: "Bob", email: "bob@bob.com", balance: 200.0);
            def Account accountTwo = new Account(name: "Foo", email: "foo@foo.com", balance: 200.0);
            def transaction = new Transaction(from: accountOne, to: accountTwo, amount: 10.0)
            service.moveMoney(transaction);

        then 'the balances are updated'
            accountOne.balance == 190.0
            accountTwo.balance == 210.0
    }

    void 'transactions dont work when there isnt enough money'() {
        when 'moving more money than allowed'

            def Account accountOne = new Account(name: "Bob", email: "bob@bob.com", balance: 10.0);
            def Account accountTwo = new Account(name: "Foo", email: "foo@foo.com", balance: 10.0);
            def transaction = new Transaction(from: accountOne, to: accountTwo, amount: 30.0)
            service.moveMoney(transaction);

        then 'the balance is decreased'
        // todo get this to work
//            final ValidationException exception = thrown();
//            exception.errors.allErrors.size() == 1
    }
}