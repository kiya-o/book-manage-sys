<template>
  <el-menu :collapse-transition="false" :collapse="flag" style="padding: 5px 20px; max-width: 253px;" :default-active="activeIndex" :background-color="bag" text-color="#666" @select="handleSelect">
    <el-submenu v-for="item in routes" :key="item.path" v-if="item.children && item.children.length" :index="item.path">
      <template slot="title">
        <span style="font-size: 14px;">{{ item.name }}</span>
      </template>
      <el-menu-item v-for="(child, childIndex) in item.children" :key="child.path" :index="getCorrectIndex(child)">
        {{ child.name }}
      </el-menu-item>
    </el-submenu>
    <el-menu-item v-else :key="item.path" :index="item.path">
      <span slot="title" style="font-size: 14px;">{{ item.name }}</span>
    </el-menu-item>
  </el-menu>
</template>

<script>
export default {
  name: 'VerticalMenu',
  data() {
    return {
      activeIndex: "/adminLayout", // 这里设置一个默认值，你可以根据实际需求调整
      isCollapse: true,
      selectedMenuItem: '',
    };
  },
  props: {
    routes: {
      type: Array,
      required: true
    },
    flag: {
      type: Boolean,
      required: true,
      // 可以给个默认值，若父组件没传则使用默认值，根据实际情况调整是否需要默认值
      default: false
    },
    bag: {
      type: String,
      default: 'rgb(248,248,248)'
    }
  },
  created() {
    // 上次选中路径
    const saveLastPath = sessionStorage.getItem('activeMenuItem');
    if (saveLastPath === null) {
      // 加载首页
      this.handleSelect('/adminLayout');
    } else {
      this.handleSelect(saveLastPath);
    }
  },
  methods: {
    handleSelect(index) {
      // 更新 activeIndex，以便样式等相关逻辑能正确反映当前选中项
      this.activeIndex = index;
      // 发射事件，通知父组件（如果有）当前选中项变化，可用于其他相关逻辑处理
      this.$emit('select', this.activeIndex);
      // 将当前选中的菜单项路径保存到 sessionStorage，方便下次加载时恢复状态
      sessionStorage.setItem('activeMenuItem', this.activeIndex);

      // 添加路由跳转逻辑，使用 $router.push 进行编程式路由跳转
      // 先判断 index 是否为有效的路由路径，如果是则进行跳转
      if (typeof index ==='string' && index.trim()!== '') {
        this.$router.push({ path: index });
      }
    },
    getCorrectIndex(child) {
      // 根据菜单项的 name 属性来返回正确的 index（路径）值
      if (child.name === '用户管理') {
        return "/admin/readerManage/userManage";
      } else if (child.name === '读者建议') {
        return "/admin/readerManage/readerProposalManage";
      } else if (child.name === '书籍管理') {
        return "/admin/bookManage/bookManagePage";
      } else if (child.name === '书架管理') {
        return "/admin/bookManage/bookshelfManage";
      } else if (child.name === '类别管理') {
        return "/admin/bookManage/categoryManage";
      } else if (child.name === '借阅记录') {
        return "/admin/borrowManage/bookOrderHistoryManage";
      } else if (child.name === '图书预约') {
        return "/admin/borrowManage/bookRssHistoryManage";
      } else if (child.name === '订阅通知') {
        return "/admin/announcement/rssNotificationManage";
      } else if (child.name === '公告管理') {
        return "/admin/announcement/noticeManage";
      } else if (child.name === '行为日志') {
        return "/admin/announcement/userOperationLogManage";
      }
      // 如果还有其他菜单项，可以按照类似的逻辑在这里添加更多的判断分支来返回正确路径
      return child.path;
    }
  },
  mounted() {
    const menuItems = this.$el.querySelectorAll('el-menu-item, el-submenu__title');
    menuItems.forEach((item) => {
      // 获取菜单项对应的name属性
      const name = item.querySelector('span').textContent;
      // 根据name获取图标类名
      const iconClass = this.getIconClassByName(name);
      if (iconClass) {
        // 创建<i>元素并设置类名
        const icon = document.createElement('i');
        icon.className = iconClass;
        icon.style.fontSize = '20px';
        // 将<i>元素插入到菜单项中合适的位置
        if (item.classList.contains('el-menu-item')) {
          item.insertBefore(icon, item.firstChild);
        } else if (item.classList.contains('el-submenu__title')) {
          item.insertBefore(icon, item.querySelector('span'));
        }
      }
    });
  },
  // 新增的方法，用于获取图标类名，根据实际菜单项名称返回对应图标类名
  getIconClassByName(name) {
    const iconMap = {
      '图书管理': 'el-icon-book',
      '书籍管理': 'el-icon-tickets',
      '书架管理': 'el-icon-film',
      '类别管理': 'el-icon-share',
      '借阅记录': 'el-icon-view',
      '图书预约': 'el-icon-s-marketing',
      '订阅通知': 'el-icon-message-solid',
      '公告管理': 'el-icon-edit-outline',
      '行为日志': 'el-icon-s-promotion',
      '用户管理': 'el-icon-user-solid',
      '读者建议': 'el-icon-edit-outline'
    };
    return iconMap[name] || '';
  }
};
</script>

<style scoped>
.is-active {
  background-color: rgb(242, 242, 242)!important;
  color: #1c1c1c!important;
  font-weight: bold;
  border-radius: 6px;
}

.el-menu-item,
.el-submenu__title {
  height: 45px!important;
  line-height: 45px!important;
  user-select: none;
  color: #333;
}

.el-menu-item:focus,
.el-menu-item:hover {
  box-sizing: border-box;
  border-radius: 5px;
  background-color: rgb(242, 242, 242)!important;
}

.el-menu-item {
  height: 45px!important;
  line-height: 45px!important;
  margin: 3px;
}
</style>