import com.james.payment.Account

class BootStrap {

    def init = { servletContext ->
        new Account(name: "Joe", email: "jamespfaulkner@gmail.com").save()
        new Account(name: "Patty", email: "katft@yahoo.co.uk").save()
    }
    def destroy = {
    }
}