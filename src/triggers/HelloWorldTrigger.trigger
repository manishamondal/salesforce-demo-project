trigger HelloWorldTrigger on Account (before insert) {
    for (Account acc : Trigger.new) {
        acc.Description = HelloWorld.sayHello();
    }
}
