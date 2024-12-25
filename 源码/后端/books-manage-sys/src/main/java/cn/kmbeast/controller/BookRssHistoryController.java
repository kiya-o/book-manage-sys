package cn.kmbeast.controller;

import cn.kmbeast.aop.Pager;
import cn.kmbeast.context.LocalThreadHolder;
import cn.kmbeast.pojo.api.Result;
import cn.kmbeast.pojo.dto.query.extend.BookRssHistoryQueryDto;
import cn.kmbeast.pojo.entity.BookRssHistory;
import cn.kmbeast.pojo.vo.BookRssHistoryVO;
import cn.kmbeast.service.BookRssHistoryService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 书籍预约相关操作的 Controller类
 * 主要负责处理与书籍预约业务对应的各种HTTP请求，
 * 通过调用 ookRssHistoryService业务层服务来实现具体功能，
 * 并将操作结果以通用响应体（Result）的形式返回给前端。
 */
@RestController
@RequestMapping(value = "/bookRssHistory")
public class BookRssHistoryController {

    // 使用 @Resource 注解注入 BookRssHistoryService，方便后续调用其提供的业务方法
    @Resource
    private BookRssHistoryService bookRssHistoryService;

    /**
     * 书籍预约新增功能的接口方法
     *
     * @param bookRssHistory 包含要新增的书籍预约信息的对象，
     *                       此参数的数据从请求体中获取，用于向系统中添加新的书籍预约记录。
     * @return Result<Void> 通用响应体，用于告知前端此次书籍预约新增操作是否成功。
     */
    @PostMapping(value = "/save")
    public Result<Void> save(@RequestBody BookRssHistory bookRssHistory) {
        return bookRssHistoryService.save(bookRssHistory);
    }

    /**
     * 书籍预约批量删除功能的接口方法
     *
     * @param ids 要删除的书籍预约记录的 ID 列表，
     *            该参数的数据从请求体中获取，用于指定需要批量删除的预约记录。
     * @return Result<Void> 通用响应体，用于反馈给前端批量删除操作的执行结果情况，
     *         例如是否成功删除了指定的书籍预约记录等信息。
     */
    @PostMapping(value = "/batchDelete")
    public Result<Void> batchDelete(@RequestBody List<Integer> ids) {
        return bookRssHistoryService.batchDelete(ids);
    }

    /**
     * 书籍预约修改功能的接口方法
     *
     * @param bookRssHistory 包含修改后的书籍预约信息的参数对象，
     *                       其数据从请求体中获取，用于更新系统中已存在的书籍预约记录。
     * @return Result<Void> 通用响应体，用于返回此次书籍预约修改操作的最终结果，
     *         像是否成功修改了相应的预约信息等情况给前端知晓。
     */
    @PutMapping(value = "/update")
    public Result<Void> update(@RequestBody BookRssHistory bookRssHistory) {
        return bookRssHistoryService.update(bookRssHistory);
    }

    /**
     * 查询当前用户书籍预约记录的接口方法
     *
     * @param bookRssHistoryQueryDto 包含查询条件相关参数的对象，
     *                               从请求体中获取，用于指定查询的具体要求。
     * @return Result<List<BookRssHistoryVO>> 通用响应体，
     *         返回符合条件的当前用户的书籍预约记录列表（以 BookRssHistoryVO 形式展示）给前端。
     */
    @Pager
    @PostMapping(value = "/queryUser")
    public Result<List<BookRssHistoryVO>> queryUser(@RequestBody BookRssHistoryQueryDto bookRssHistoryQueryDto) {
        bookRssHistoryQueryDto.setUserId(LocalThreadHolder.getUserId());
        return bookRssHistoryService.query(bookRssHistoryQueryDto);
    }

    /**
     * 书籍预约通用查询功能的接口方法
     *
     * @param bookRssHistoryQueryDto 包含查询条件相关参数的对象，
     *                               从请求体中获取，用于指定要查询的具体范围、条件等信息。
     * @return Result<List<BookRssHistoryVO>> 通用响应体，
     *         返回根据给定查询参数查找到的书籍预约记录列表（以 BookRssHistoryVO 形式展示）给前端。
     */
    @Pager
    @PostMapping(value = "/query")
    public Result<List<BookRssHistoryVO>> query(@RequestBody BookRssHistoryQueryDto bookRssHistoryQueryDto) {
        return bookRssHistoryService.query(bookRssHistoryQueryDto);
    }
}