package com.james.payment

import com.icegreen.greenmail.util.GreenMailUtil
import grails.plugin.greenmail.GreenMail
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(EmailService)
class EmailServiceSpec extends Specification {

    def GreenMail greenMail;

    def setup() {
    }

    def cleanup() {
    }

    void "Two emails are sent"() {
        when:
            def Account accountOne = new Account(name: "Bob", email: "bob@bob.com", balance: 200.0);
            def Account accountTwo = new Account(name: "Foo", email: "foo@foo.com", balance: 200.0);
            def transaction = new Transaction(from: accountOne, to: accountTwo, amount: 10.0)
            service.sendEmails(transaction)
        then:
            greenMail.getMessagesCount() == 2
    }

    void "Emails contain the correct values"() {
        when:
            def Account accountOne = new Account(name: "Bob", email: "bob@bob.com", balance: 200.0);
            def Account accountTwo = new Account(name: "Foo", email: "foo@foo.com", balance: 200.0);
            def transaction = new Transaction(from: accountOne, to: accountTwo, amount: 10.0)
            service.sendEmails(transaction)
        then:
            GreenMailUtil.getBody(greenMail.getMessage(0)).contains("10");
            GreenMailUtil.getAddressList(greenMail.getMessage(0).getAllRecipients()) == "bob@bob.com"

            GreenMailUtil.getBody(greenMail.getMessage(0)).contains("10");
            GreenMailUtil.getAddressList(greenMail.getMessage(0).getAllRecipients()) == "foo@foo.com"
    }
}

