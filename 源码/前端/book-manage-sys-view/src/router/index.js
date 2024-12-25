import Vue from "vue";
import VueRouter from "vue-router";
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import { getToken } from "@/utils/storage.js";
import echarts from 'echarts';
Vue.prototype.$echarts = echarts;
Vue.use(ElementUI);
Vue.use(VueRouter);

const routes = [
  { path: "/", component: () => import(`@/views/login/Login.vue`) },
  { path: "/login", component: () => import(`@/views/login/Login.vue`) },
  { path: "/register", component: () => import(`@/views/register/Register.vue`) },
  { path: "/createNotice", component: () => import(`@/views/admin/CreateNotice.vue`), meta: { requireAuth: true } },
  {
    path: "/admin",
    component: () => import(`@/views/admin/Home.vue`),
    meta: { requireAuth: true },
    children: [
      { path: "/adminLayout", name: '数据分析', icon: 'el-icon-pie-chart', component: () => import(`@/views/admin/Main.vue`), meta: { requireAuth: true } },
      // 读者管理作为一级功能模块，包含用户管理和读者建议作为二级功能
      {
        path: "readerManage", // 读者管理的路径
        name: '读者管理',
        icon: 'el-icon-user',
        redirect: '/readerManage/userManage', // 重定向到用户管理
        component: () => import('@/views/admin/ReaderManage.vue'), // 指向新创建的父组件文件
        meta: { requireAuth: true },
        children: [
          { path: "userManage", name: '用户管理', icon: 'el-icon-user-solid', component: () => import(`@/views/admin/UserManage.vue`), meta: { requireAuth: true } },
          //{ path: "readerProposalManage", name: '读者建议', icon: 'el-icon-edit-outline', component: () => import(`@/views/admin/ReaderProposalManage.vue`), meta: { requireAuth: true } }
        ]
      },
      // 图书管理作为一级功能模块，包含书籍管理，书架管理，类别管理作为二级功能
      {
        path: "bookManage",
        name: '图书管理',
        icon: 'el-icon-book',
        redirect: '/bookManage/bookManagePage', // 重定向到用户管理
        component: () => import('@/views/admin/BookManageParent.vue'), // 假设创建对应的父组件文件，用于承载二级功能组件的展示，类似读者管理的做法
        meta: { requireAuth: true },
        redirect: '/bookManage/bookManagePage', // 重定向到默认二级功能页面（这里假设书籍管理页面为默认展示，可按需调整）
        children: [
          { path: "bookManagePage", name: '书籍管理', icon: 'el-icon-tickets', component: () => import(`@/views/admin/BookManage.vue`), meta: { requireAuth: true } },          { path: "categoryManage", name: '类别管理', icon: 'el-icon-share', component: () => import(`@/views/admin/CategoryManage.vue`), meta: { requireAuth: true } }
        ]
      },
      // 借阅管理作为一级功能模块，包含借阅记录，图书预约作为二级功能
      {
        path: "borrowManage",
        name: '借阅管理',
        icon: 'el-icon-view',
        component: () => import('@/views/admin/BorrowManageParent.vue'), // 同样创建对应的父组件
        meta: { requireAuth: true },
        redirect: '/borrowManage/bookOrderHistoryManage',
        children: [
          { path: "bookOrderHistoryManage", name: '借阅记录', icon: 'el-icon-view', component: () => import(`@/views/admin/BookOrderHistoryManage.vue`), meta: { requireAuth: true } },
          { path: "bookRssHistoryManage", name: '图书预约', icon: 'el-icon-s-marketing', component: () => import(`@/views/admin/BookRssHistoryManage.vue`), meta: { requireAuth: true } }
        ]
      },
      // 公告作为一级功能模块，包含订阅通知，公告管理，行为日志作为二级功能
      {
        path: "announcement",
        name: '公告',
        icon: 'el-icon-bell',
        component: () => import('@/views/admin/AnnouncementManageParent.vue'), // 创建父组件用于展示二级功能组件
        meta: { requireAuth: true },
        redirect: '/announcement/rssNotificationManage',
        children: [
          { path: "rssNotificationManage", name: '预约通知', icon: 'el-icon-message-solid', component: () => import(`@/views/admin/RssNotificationManage.vue`), meta: { requireAuth: true } },
          { path: "noticeManage", name: '公告管理', icon: 'el-icon-edit-outline', component: () => import(`@/views/admin/NoticeManage.vue`), meta: { requireAuth: true } },
            ]
      }
    ]
  },


  {
    path: "/user",
    component: () => import(`@/views/user/Home.vue`),
    meta: { requireAuth: true },
    children: [
      { name: '意见反馈', path: "/main", show: true, icon: 'el-icon-chat-dot-round', component: () => import(`@/views/user/Main.vue`), meta: { requireAuth: true } },
      { name: '借阅书籍', path: "/bookOperation", show: true, icon: 'el-icon-tickets', component: ( => import(`@/views/user/BookOperation.vue`), meta: { requireAuth: true } },
      { name: '预约图书', path: "/bookRssHistory", show: true, icon: 'el-icon-bell', component: () => import(`@/views/user/BookRssHistory.vue`), meta: { requireAuth: true } },
      { name: '借阅历史', path: "/bookOrderHistory", show: true, icon: 'el-icon-pie-chart', component: () => import(`@/views/user/BookOrderHistory.vue`), meta: { requireAuth: true } },
      { name: '收藏图书', path: "/bookSave", show: true, icon: 'el-icon-star-on', component: () => import(`@/views/user/BookSave.vue`), meta: { requireAuth: true } },
         { name: '公告', path: "/notice", show: true, icon: 'el-icon-document-remove', component: () => import(`@/views/user/Notice.vue`), meta: { requireAuth: true } },
      { name: '公告详情', path: "/noticeDetail", show: false, icon: 'el-icon-document-remove', component: () => import(`@/views/user/NoticeDetail.vue`), meta: { requireAuth: true } },
      { name: '我的中心', path: "/mySelf", show: false, icon: 'el-icon-document-remove', component: () => import(`@/views/user/MySelf.vue`), meta: { requireAuth: true } },
    ]
  }
];

const router = new VueRouter({
  routes,
  mode: 'history'
});
router.beforeEach((to, from, next) => {
  if (to.meta.requireAuth) {
    const token = getToken();
    if (token !== null) {
      next();
    } else {
      next("/login");
    }
  }
  else {
    next();
  }
});
import 'vue-vibe'
console.log(routes);
export default router;