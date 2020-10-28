package course;

public class CourseInfo {
 
    public static void main(String[] args){
        Course course = new Course();
 
        course.name = "DevOps";
        course.module = "CI-CD";
        course.webinarN = 2;
 
        System.out.println("Name of the Course: " + course.name);
        System.out.println("Current module: " + course.module);
        System.out.println("Webinar number:" + course.webinarN);
    }
}