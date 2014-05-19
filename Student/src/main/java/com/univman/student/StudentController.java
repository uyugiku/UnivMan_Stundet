package com.univman.student;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/students")
@Controller
@RooWebScaffold(path = "students", formBackingObject = Student.class)
public class StudentController {
}
