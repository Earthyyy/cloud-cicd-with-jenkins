package ma.insea.clouddemoapp;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest
class CloudDemoappApplicationTests {

    @Test
    void contextLoads() {
    }


    @Test
    void testThatWillSucceed() {
        assertEquals(1, 1, "Dummy test failed as expected.");
    }



    // @Test
    // public void testThatWillFail() {
    //     assertEquals(1 , 2, "Dummy test failed as expected.");
    // }

}
