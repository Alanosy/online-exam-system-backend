package cn.org.alan.exam.service;

import cn.org.alan.exam.common.result.Result;
import cn.org.alan.exam.model.entity.User;
import cn.org.alan.exam.model.form.UserForm;
import cn.org.alan.exam.model.vo.UserVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author WeiJin
 * @since 2024-03-21
 */
public interface IUserService extends IService<User> {

    /**
     * 创建用户，教师只能创建学生，管理员可以创建教师和学生
     *
     * @param userForm 请求参数，用户名、真实姓名[、角色id]
     * @return 响应结果
     */
    Result<String> createUser(UserForm userForm);


    /**
     * 修改密码
     * @param userForm 入参
     * @return 响应结果
     */
    Result<String> updatePassword( UserForm userForm);

    /**
     * 批量删除用户
     * @param ids 用户id
     * @return 响应结果
     */
    Result<String> deleteBatchByIds(String ids);

    /**
     * Excel导入用户信息
     * @param file 文件
     * @return 响应结果
     */
    Result<String> importUsers(MultipartFile file);

    /**
     * 获取用户信息 用户id从session获取
     * @return 响应结果
     */
    Result<UserVO> info();

    /**
     * 用户加入班级，只有学生才能加入班级
     * @param code 班级口令
     * @return 响应
     */
    Result<String> joinGrade(String code);

    /**
     * 分页获取用户信息
     * @param pageNum 页码
     * @param pageSize 每页记录数
     * @param gradeId 班级Id
     * @param realName 真实姓名
     * @return 查询结果
     */
    Result<IPage<UserVO>> pagingUser(Integer pageNum, Integer pageSize, Integer gradeId, String realName);


    /**
     * 用户上传头像
     * @param file 文件
     * @return 结果
     */
    Result<String> uploadAvatar(MultipartFile file);
}
