package cn.kmbeast.controller;

import cn.kmbeast.aop.Pager;
import cn.kmbeast.context.LocalThreadHolder;
import cn.kmbeast.pojo.api.Result;
import cn.kmbeast.pojo.dto.query.extend.RssNotificationQueryDto;
import cn.kmbeast.pojo.entity.RssNotification;
import cn.kmbeast.pojo.vo.RssNotificationVO;
import cn.kmbeast.service.RssNotificationService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 *  预约通知的 Controller
 */
@RestController
@RequestMapping(value = "/rssNotification")
public class RssNotificationController {

    @Resource
    private RssNotificationService rssNotificationService;

    /**
     *  预约通知新增
     *
     * @param rssNotification 新增数据
     * @return Result<Void> 通用响应体
     */
    @PostMapping(value = "/save")
    public Result<Void> save(@RequestBody RssNotification rssNotification) {
        return rssNotificationService.save(rssNotification);
    }

    /**
     * 书籍上线，转发通知
     * @return Result<Void> 通用响应体
     */
    @GetMapping(value = "/postBook/{id}")
    public Result<Void> postBook(@PathVariable Integer id) {
        return rssNotificationService.postBook(id);
    }

    /**
     *  预约通知删除
     *
     * @param ids 要删除的 预约通知ID列表
     * @return Result<Void> 通用响应体
     */
    @PostMapping(value = "/batchDelete")
    public Result<Void> batchDelete(@RequestBody List<Integer> ids) {
        return rssNotificationService.batchDelete(ids);
    }

    /**
     *  预约通知修改
     *
     * @param rssNotification 参数
     * @return Result<Void> 响应
     */
    @PutMapping(value = "/update")
    public Result<Void> update(@RequestBody RssNotification rssNotification) {
        return rssNotificationService.update(rssNotification);
    }

    /**
     *  预约通知，查询用户需要接收的
     *
     * @param rssNotificationQueryDto 查询参数
     * @return Result<List < RssNotificationVO>> 通用响应
     */
    @Pager
    @PostMapping(value = "/queryUser")
    public Result<List<RssNotificationVO>> queryUser(@RequestBody RssNotificationQueryDto rssNotificationQueryDto) {
        rssNotificationQueryDto.setUserId(LocalThreadHolder.getUserId());
        return rssNotificationService.query(rssNotificationQueryDto);
    }

    /**
     * 消息全部设置为已读
     *
     * @return Result<List < Void>> 通用响应
     */
    @Pager
    @PostMapping(value = "/readDeal")
    public Result<List<Void>> readDeal() {
        return rssNotificationService.readDeal();
    }

    /**
     *  预约通知查询
     *
     * @param rssNotificationQueryDto 查询参数
     * @return Result<List < RssNotificationVO>> 通用响应
     */
    @Pager
    @PostMapping(value = "/query")
    public Result<List<RssNotificationVO>> query(@RequestBody RssNotificationQueryDto rssNotificationQueryDto) {
        return rssNotificationService.query(rssNotificationQueryDto);
    }

}
