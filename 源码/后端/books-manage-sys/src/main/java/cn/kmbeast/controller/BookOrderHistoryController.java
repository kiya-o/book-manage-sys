package cn.kmbeast.controller;

import cn.kmbeast.aop.Log;
import cn.kmbeast.aop.Pager;
import cn.kmbeast.context.LocalThreadHolder;
import cn.kmbeast.pojo.api.Result;
import cn.kmbeast.pojo.dto.query.extend.BookOrderHistoryQueryDto;
import cn.kmbeast.pojo.entity.BookOrderHistory;
import cn.kmbeast.pojo.vo.BookOrderHistoryVO;
import cn.kmbeast.service.BookOrderHistoryService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 图书借阅历史数据的 Controller
 * 主要负责处理与图书借阅历史数据相关的各种HTTP请求，
 * 通过调用对应的业务服务层（BookOrderHistoryService）方法来实现具体功能，
 * 并返回相应的通用响应体（Result）给前端。
 */
@RestController
@RequestMapping(value = "/bookOrderHistory")
public class BookOrderHistoryController {

    // 通过 @Resource 注解注入 BookOrderHistoryService，方便后续调用其业务逻辑方法
    @Resource
    private BookOrderHistoryService bookOrderHistoryService;

    /**
     * 图书借阅历史数据新增功能的接口方法
     *
     * @param bookOrderHistory 包含要新增的图书借阅历史数据信息的对象，该参数的数据从请求体中获取。
     * @return Result<Void> 通用响应体，用于告知前端新增操作是否成功等相关结果信息。
     */
    @Log(content = "借阅书籍")
    @PostMapping(value = "/save")
    public Result<Void> save(@RequestBody BookOrderHistory bookOrderHistory) {
        return bookOrderHistoryService.save(bookOrderHistory);
    }

    /**
     * 图书借阅历史数据批量删除功能的接口方法
     *
     * @param ids 要删除的图书借阅历史数据的ID列表，此参数的数据从请求体中获取。
     * @return Result<Void> 通用响应体，用于反馈给前端批量删除操作的执行结果情况。
     */
    @PostMapping(value = "/batchDelete")
    public Result<Void> batchDelete(@RequestBody List<Integer> ids) {
        return bookOrderHistoryService.batchDelete(ids);
    }

    /**
     * 图书借阅历史数据修改功能的接口方法
     *
     * @param bookOrderHistory 包含修改后的图书借阅历史数据信息的参数对象，从请求体中获取。
     * @return Result<Void> 通用响应体，用于返回修改操作的最终结果，例如是否修改成功等信息给前端。
     */
    @Log(content = "归还书籍")
    @PutMapping(value = "/update")
    public Result<Void> update(@RequestBody BookOrderHistory bookOrderHistory) {
        return bookOrderHistoryService.update(bookOrderHistory);
    }

    /**
     * 查询用户全部的书籍预约记录的接口方法
     * 此方法会先设置查询参数（BookOrderHistoryQueryDto）中的用户ID，
     * 用户ID通过 LocalThreadHolder 获取，然后调用业务服务层的查询方法进行查询操作。
     *
     * @return Result<List<BookOrderHistoryVO>> 通用响应体，返回符合条件的书籍预约记录列表（以 BookOrderHistoryVO 形式）给前端。
     */
    @Pager
    @PostMapping(value = "/queryUser")
    public Result<List<BookOrderHistoryVO>> queryUser(@RequestBody BookOrderHistoryQueryDto dto) {
        dto.setUserId(LocalThreadHolder.getUserId());
        return bookOrderHistoryService.query(dto);
    }

    /**
     * 图书借阅历史数据查询功能的接口方法
     *
     * @param dto 包含图书借阅历史数据查询相关参数的对象，从请求体中获取。
     * @return Result<List<BookOrderHistoryVO>> 通用响应体，返回根据查询参数获取到的图书借阅历史数据列表（以 BookOrderHistoryVO 形式）给前端。
     */
    @Pager
    @PostMapping(value = "/query")
    public Result<List<BookOrderHistoryVO>> query(@RequestBody BookOrderHistoryQueryDto dto) {
        return bookOrderHistoryService.query(dto);
    }
}