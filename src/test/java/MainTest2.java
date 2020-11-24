import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import service.EmployeeService;

public class MainTest2 {
    @Autowired
    @Qualifier("employeeService")
    private EmployeeService employeeService;

    @Test
    public void test1() throws Exception {

//        List<Employee> list = employeeService.getAllEmployee();
//        for (Employee employee : list) {
//            System.out.println(employee);
//        }
    }
}
