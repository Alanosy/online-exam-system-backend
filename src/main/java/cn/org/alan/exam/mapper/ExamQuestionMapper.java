package cn.org.alan.exam.mapper;

import cn.org.alan.exam.model.entity.ExamQuestion;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * @Author Alan
 * @Version
 * @Date 2024/4/7 3:49 PM
 */
public interface ExamQuestionMapper extends BaseMapper<ExamQuestion> {
    int insertQuestion(Integer examId, Integer quType, Integer quScore, List<Map<String, Object>> questionIdsAndSorts);
}
