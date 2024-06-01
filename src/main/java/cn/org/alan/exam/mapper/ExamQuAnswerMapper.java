package cn.org.alan.exam.mapper;

import cn.org.alan.exam.model.entity.ExamQuAnswer;
import cn.org.alan.exam.model.vo.answer.UserAnswerDetailVO;
import cn.org.alan.exam.model.vo.exam.ExamQuAnswerExtVO;
import cn.org.alan.exam.model.vo.score.QuestionAnalyseVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author WeiJin
 * @since 2024-03-21
 */
public interface ExamQuAnswerMapper extends BaseMapper<ExamQuAnswer> {

    List<ExamQuAnswerExtVO> list(String examId, String questionId);

    /**
     * 获取单题作答信息
     * @param examId 考试id
     * @param questionId 试题id
     * @return 查询结果
     */
    QuestionAnalyseVO questionAnalyse(Integer examId, Integer questionId);

    /**
     * 删除用户考试作答记录
     * @param userIds 用户id列表
     * @return 影响记录数
     */
    Integer deleteByUserIds(List<Integer> userIds);

    /**
     * 获取用户回答主观题信息
     * @param userId 用户id
     * @param examId 考试id
     * @return 结果集
     */
    List<UserAnswerDetailVO> selectUserAnswer(Integer userId, Integer examId);
}
