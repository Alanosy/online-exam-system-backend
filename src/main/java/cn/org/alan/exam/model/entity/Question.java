package cn.org.alan.exam.model.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 *
 * </p>
 *
 * @author WeiJin
 * @since 2024-03-21
 */
@TableName("t_question")
public class Question implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id   试题表
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 试题类型
     */
    private Integer quType;

    /**
     * 试题图片
     */
    private String image;

    /**
     * 题干
     */
    private String content;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /**
     * 题目分析
     */
    private String analysis;

    /**
     * 题库id
     */
    private Integer repoId;
    /**
     * 创建人id
     */
    @TableField(fill = FieldFill.INSERT)
    private Integer userId;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getQuType() {
        return quType;
    }

    public void setQuType(Integer quType) {
        this.quType = quType;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public String getAnalysis() {
        return analysis;
    }

    public void setAnalysis(String analysis) {
        this.analysis = analysis;
    }

    public Integer getRepoId() {
        return repoId;
    }

    public void setRepoId(Integer repoId) {
        this.repoId = repoId;
    }

    @Override
    public String toString() {
        return "Question{" +
                "id=" + id +
                ", quType=" + quType +
                ", image='" + image + '\'' +
                ", content='" + content + '\'' +
                ", createTime=" + createTime +
                ", analysis='" + analysis + '\'' +
                ", repoId=" + repoId +
                ", userId=" + userId +
                '}';
    }
}
