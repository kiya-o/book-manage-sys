package cn.kmbeast.controller;

import cn.kmbeast.aop.Pager;
import cn.kmbeast.pojo.api.Result;
import cn.kmbeast.pojo.dto.query.extend.BookQueryDto;
import cn.kmbeast.pojo.entity.Book;
import cn.kmbeast.pojo.vo.BookVO;
import cn.kmbeast.pojo.vo.ChartVO;
import cn.kmbeast.service.BookService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 书籍的 Controller
 */
@RestController
@RequestMapping(value = "/book")
public class BookController {

    // 通过 @Resource 注解注入 BookService，方便调用其业务方法
    @Resource
    private BookService bookService;

    /**
     * 书籍新增操作
     *
     * @param book 包含新增书籍信息的数据对象，从请求体中获取
     * @return Result<Void> 通用响应体，用于告知前端操作结果
     */
    @PostMapping(value = "/save")
    public Result<Void> save(@RequestBody Book book) {
        return bookService.save(book);
    }

    /**
     * 书籍批量删除操作
     *
     * @param ids 要删除的书籍ID列表，从请求体中获取
     * @return Result<Void> 通用响应体，用于反馈删除操作的结果
     */
    @PostMapping(value = "/batchDelete")
    public Result<Void> batchDelete(@RequestBody List<Integer> ids) {
        return bookService.batchDelete(ids);
    }

    /**
     * 书籍修改操作
     *
     * @param book 包含修改后书籍信息的参数对象，从请求体中获取
     * @return Result<Void> 通用响应体，用于返回修改操作是否成功等结果信息
     */
    @PutMapping(value = "/update")
    public Result<Void> update(@RequestBody Book book) {
        return bookService.update(book);
    }

    /**
     * 书籍查询操作
     *
     * @param bookQueryDto 包含书籍查询相关参数的对象，从请求体中获取
     * @return Result<List<BookVO>> 通用响应体，返回符合查询条件的书籍信息列表（以 BookVO 形式）
     */
    @Pager
    @PostMapping(value = "/query")
    public Result<List<BookVO>> query(@RequestBody BookQueryDto bookQueryDto) {
        return bookService.query(bookQueryDto);
    }

    /**
     * 统计图书存量数据操作
     *
     * @param day 指定的天数参数，从路径变量中获取
     * @return Result<List<ChartVO>> 响应结果，包含统计后的图书存量相关数据（以 ChartVO 形式）
     */
    @GetMapping(value = "/daysQuery/{day}")
    @ResponseBody
    public Result<List<ChartVO>> query(@PathVariable Integer day) {
        return bookService.daysQuery(day);
    }
}