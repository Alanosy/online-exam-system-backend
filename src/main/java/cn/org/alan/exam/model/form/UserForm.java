package cn.org.alan.exam.model.form;

import cn.org.alan.exam.common.group.UserGroup;
import cn.org.alan.exam.util.excel.ExcelImport;
import com.alibaba.excel.annotation.ExcelProperty;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

import java.time.LocalDateTime;


/**
 * @Author WeiJin
 * @Version 1.0
 * @Date 2024/3/29 15:17
 */
@Data
public class UserForm {

    private Integer id;

    private LocalDateTime createTime;


    //校验器注解
    @NotBlank(groups = {UserGroup.CreateUserGroup.class, UserGroup.RegisterGroup.class}, message = "用户名不能为空")
    //EasyExcel注解，映射关系
    @ExcelImport(value = "用户名*",unique = true,required = true)
    private String userName;
    @NotBlank(groups = UserGroup.RegisterGroup.class,message = "密码不能为空")
    private String password;
    @NotBlank(groups = {UserGroup.CreateUserGroup.class, UserGroup.RegisterGroup.class}, message = "真实姓名不能为空")
    @ExcelImport(value = "真实姓名*")
    private String realName;
    @ExcelImport(value = "角色")
    private Integer roleId;


    @NotBlank(groups = {UserGroup.UpdatePasswordGroup.class}, message = "原密码不能为空")
    private String originPassword;
    @NotBlank(groups = {UserGroup.UpdatePasswordGroup.class}, message = "新密码不能为空")
    private String newPassword;
    @NotBlank(groups = {UserGroup.UpdatePasswordGroup.class, UserGroup.RegisterGroup.class}, message = "校验密码不能为空")
    private String checkedPassword;

}
