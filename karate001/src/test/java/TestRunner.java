
import com.intuit.karate.junit5.Karate;


public class TestRunner {
    @Karate.Test
    Karate testGet(){
        return Karate.run("TestCases.feature").relativeTo(getClass());
    }
    @Karate.Test
    Karate testPost(){
        return Karate.run("Post.feature").relativeTo(getClass());
    }
    @Karate.Test
    Karate testPut(){
        return Karate.run("Put.feature").relativeTo(getClass());
    }
    @Karate.Test
    Karate testDelete(){
        return Karate.run("Delete.feature").relativeTo(getClass());
    }
    @Karate.Test
    Karate testConfig(){
        return Karate.run("Config.feature").relativeTo(getClass());
    }
}
