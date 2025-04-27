package cn.org.alan.exam;


import com.github.xiaoymin.knife4j.spring.annotations.EnableKnife4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

/**
 * SpringBoot启动类
 *
 * @Author Alan
 * @Version 1.0
 * @Date 2025/3/25 11:20 AM
 */
@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})
@EnableAsync
@EnableScheduling
@EnableKnife4j
@EnableRedisHttpSession(maxInactiveIntervalInSeconds = 1800 * 2 )
public class ExamApplication{

    public static void main(String[] args) {
        SpringApplication.run(ExamApplication.class, args);
    }
}