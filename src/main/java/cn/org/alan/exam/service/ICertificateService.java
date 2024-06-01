package cn.org.alan.exam.service;

import cn.org.alan.exam.common.result.Result;
import cn.org.alan.exam.model.entity.Certificate;
import cn.org.alan.exam.model.form.CertificateForm;
import cn.org.alan.exam.model.vo.certificate.MyCertificateVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author JinXi
 * @since 2024-03-21
 */


public interface ICertificateService extends IService<Certificate> {

    //查询在用的证书列表

    /**
     * 添加证书
     * @param certificateForm 添加证书的参数
     * @return 返回响应结果，通常包含操作状态和可能的信息
     */
    //新增证书的addCertificate方法（在CertificateController中调用）
    Result<String> addCertificate(CertificateForm certificateForm);


    /**
     * 分页查询证书
     * @param pageNum  页码
     * @param pageSize 每页记录数
     * @param certificateName    证书名
     * @param certificationUnit    认证单位
     * @param image    证书背景图片
     * @return 返回结果响应  包含分页后的证书列表信息
     */
    //获取后台分页证书 实现类
    Result<IPage<Certificate>> pagingCertificate(Integer pageNum, Integer pageSize, String certificateName, String certificationUnit, String image);


    /**
     * 修改公告
     * @param certificateForm 更新证书的参数
     * @return 返回响应结果
     */
    //修改证书
    Result<String> updateCertificate(CertificateForm certificateForm);

    /**
     * 删除公告
     * @param id  待删除证书的id
     * @return   返回响应结果
     */
    Result<String> deleteCertificate(Integer id);


    Result<IPage<MyCertificateVO>> getMyCertificatePaging(Integer pageNum, Integer pageSize);
}
