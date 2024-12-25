package cn.kmbeast.controller;

import cn.kmbeast.aop.Pager;
import cn.kmbeast.context.LocalThreadHolder;
import cn.kmbeast.pojo.api.Result;
import cn.kmbeast.pojo.dto.query.extend.BookSaveQueryDto;
import cn.kmbeast.pojo.entity.BookSave;
import cn.kmbeast.pojo.vo.BookSaveVO;
import cn.kmbeast.service.BookSaveService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 书架收藏相关操作的控制器类（BookSaveController）
 * 主要负责处理与书架收藏业务相关的各种HTTP请求，
 * 通过调用对应的业务服务层（BookSaveService）的方法来实现具体功能，
 * 并将操作结果以通用响应体（Result）的形式返回给前端应用。
 */
@RestController
@RequestMapping(value = "/bookSave")
public class BookSaveController {

    // 使用 @Resource 注解注入 BookSaveService，以便在本控制器类中能够方便地调用其业务逻辑方法
    @Resource
    private BookSaveService bookSaveService;

    /**
     * 书架收藏新增操作的接口方法
     * 此方法用于接收前端传来的新增书架收藏数据，并将其传递给业务服务层进行处理，最终返回操作结果给前端。
     *
     * @param bookSave 包含要新增的书架收藏信息的对象，这个对象的数据是从请求体（RequestBody）中获取的，
     *                 它对应着要添加到系统中的一条书架收藏记录的详细信息。
     * @return Result<Void> 通用响应体，用于告知前端此次书架收藏新增操作是否成功执行，
     *         虽然返回值类型中的泛型为Void，表示没有具体的数据返回，但通过响应体的状态码等信息可以知晓操作结果。
     */
    @PostMapping(value = "/save")
    public Result<Void> save(@RequestBody BookSave bookSave) {
        return bookSaveService.save(bookSave);
    }

    /**
     * 书架收藏批量删除操作的接口方法
     * 该方法接收前端传来的要删除的书架收藏记录的ID列表，然后调用业务服务层去执行批量删除操作，
     * 最后将操作的结果反馈给前端。
     *
     * @param ids 要删除的书架收藏ID列表，其数据来源于请求体（RequestBody），
     *            这个列表明确指定了需要从系统中批量删除的书架收藏记录的唯一标识。
     * @return Result<Void> 通用响应体，用于向前端传达此次批量删除操作的执行情况，
     *         例如操作是否成功完成，如果出现错误也会通过响应体携带相应的错误信息告知前端。
     */
    @PostMapping(value = "/batchDelete")
    public Result<Void> batchDelete(@RequestBody List<Integer> ids) {
        return bookSaveService.batchDelete(ids);
    }

    /**
     * 书架收藏修改操作的接口方法
     * 此方法接收前端传来的包含修改后书架收藏信息的参数对象，接着让业务服务层去更新对应的收藏记录，
     * 并将最终的修改结果返回给前端知晓。
     *
     * @param bookSave 包含修改后的书架收藏信息的参数对象，它的数据从请求体（RequestBody）获取，
     *                 代表着系统中某条书架收藏记录需要更新的新内容。
     * @return Result<Void> 通用响应体，用于将书架收藏修改操作的完成情况返回给前端，
     *         比如是否成功修改了对应记录，若有异常也会通过响应体体现出来。
     */
    @PutMapping(value = "/update")
    public Result<Void> update(@RequestBody BookSave bookSave) {
        return bookSaveService.update(bookSave);
    }

    /**
     * 查询当前用户书架收藏记录的接口方法
     * 该方法先从请求体获取查询参数对象，然后设置查询参数中的用户ID（通过 LocalThreadHolder 获取当前用户ID），
     * 再调用业务服务层按照设定的条件查询当前用户的书架收藏记录，最后将查询结果以通用响应体的形式返回给前端。
     *
     * @param bookSaveQueryDto 包含书架收藏查询相关条件和参数的对象，它从请求体（RequestBody）中获取，
     *                         这些参数决定了要查询的具体范围、筛选条件等信息，用于精准获取用户期望的书架收藏记录。
     * @return Result<List<BookSaveVO>> 通用响应体，返回符合查询条件的当前用户的书架收藏记录列表（以 BookSaveVO 类型展示），
     *         这样前端就能获取并展示用户的书架收藏相关信息了。
     */
    @Pager
    @PostMapping(value = "/queryUser")
    public Result<List<BookSaveVO>> queryUser(@RequestBody BookSaveQueryDto bookSaveQueryDto) {
        bookSaveQueryDto.setUserId(LocalThreadHolder.getUserId());
        return bookSaveService.query(bookSaveQueryDto);
    }

    /**
     * 书架收藏通用查询操作的接口方法
     * 此方法接收前端传来的查询参数对象，然后调用业务服务层根据这些参数进行书架收藏记录的查询，
     * 最后将查询得到的结果通过通用响应体返回给前端应用。
     *
     * @param bookSaveQueryDto 包含书架收藏查询相关条件和参数的对象，它从请求体（RequestBody）中获取，
     *                         这些参数用于指定要查找的书架收藏记录的范围、条件等具体要求。
     * @return Result<List<BookSaveVO>> 通用响应体，返回根据给定查询参数查找到的书架收藏记录列表（以 BookSaveVO 形式展示），
     *         方便前端进行展示或者做进一步的处理。
     */
    @Pager
    @PostMapping(value = "/query")
    public Result<List<BookSaveVO>> query(@RequestBody BookSaveQueryDto bookSaveQueryDto) {
        return bookSaveService.query(bookSaveQueryDto);
    }
}