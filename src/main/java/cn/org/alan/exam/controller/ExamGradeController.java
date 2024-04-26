package cn.org.alan.exam.controller;

import cn.org.alan.exam.model.entity.Exam;
import cn.org.alan.exam.service.IExamGradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @ Author JinXi
 * @ Version 1.0
 * @ Date 2024/4/15 15:26
 */
//各班试卷统计信息  提供RESTful API供前端或外部系统调用：
@RestController
@RequestMapping("/api/total/exam")
public class ExamGradeController {
    @Autowired
    private IExamGradeService examGradeService;

    @GetMapping("teacher/{roleid}")
    public List<Exam> getExamGradeCount(@PathVariable("roleId") int roleId) {
        return examGradeService.getExamGradeCount(roleId);
    }
}