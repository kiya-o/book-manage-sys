<template>
    <div class="login-container">
        <div style="display: flex;justify-content: left;margin: 20px 0;">
        </div>
        <div class="login-panel">
            <div style="width: 250px;padding: 10px;display: flex;justify-content: center;align-items: center;">
            </div>
            <div class="right-login">
                <div>
                    <h2>登录账户</h2>
                </div>
                <div class="text">
                    <input v-model="act" class="act" placeholder="请输入账号" />
                </div>
                <div class="text">
                    <input v-model="pwd" class="pwd" type="password" placeholder="请输入密码" />
                </div>
                <div>
                    <span class="login-btn" @click="login">立即登录</span>
                </div>
                <div class="tip">
                    <p>没有账号？<span class="no-act" @click="toDoRegister">点此注册</span></p>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Vue from 'vue'
const DELAY_TIME = 1300;
import request from "@/utils/request.js";
import { setToken } from "@/utils/storage.js";
import md5 from 'js-md5';
import Logo from '@/components/Logo.vue';
export default {
    name: "Login",
    components: { Logo },
    data() {
        return {
            act: '',
            pwd: '',
            colorLogo: 'rgb(82, 81, 81)',
        }
    },
    methods: {
        toDoRegister() {
            this.$router.push('/register');
        },
        async login() {
            if (!this.act || !this.pwd) {
                Vue.prototype.$swal.fire({
                    title: '填写校验',
                    text: '账号或密码不能为空',
                    icon: 'error',
                    showConfirmButton: false,
                    timer: DELAY_TIME,
                });
                return;
            }
            const hashedPwd = md5(md5(this.pwd));
            const paramDTO = { userAccount: this.act, userPwd: hashedPwd };
            try {
                const { data } = await request.post(`user/login`, paramDTO);
                if (data.code !== 200) {
                    Vue.prototype.$swal.fire({
                        title: '登录失败',
                        text: data.msg,
                        icon: 'error',
                        showConfirmButton: false,
                        timer: DELAY_TIME,
                    });
                    return;
                }
                setToken(data.data.token);
                setTimeout(() => {
                    const { role } = data.data;
                    this.navigateToRole(role);
                }, DELAY_TIME);
            } catch (error) {
                console.error('登录请求错误:', error);
                Vue.prototype.$message.error('登录请求出错，请重试！');
            }
        },
        navigateToRole(role) {
            switch (role) {
                case 1:
                    this.$router.push('/admin');
                    break;
                case 2:
                    this.$router.push('/user');
                    break;
                default:
                    console.warn('未知的角色类型:', role);
                    break;
            }
        },
    }
};
</script>

<style lang="scss" scoped>
* {
    user-select: none;
}

.login-container {
    width: 100%;
    min-height: 100vh;
    background-image: url('/bg.jpg'); // 使用背景图片，根据实际项目中图片存放路径调整此处
    background-size: cover;
    background-position: right;
    background-repeat: no-repeat;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

.login-panel {
    position: fixed; /* 或者 relative, fixed, sticky 等 */
    top: 50px; /* 根据需要调整 */
    right: 50px;
    padding: 15px;
    justify-content: space-between;
    height: auto;
    border-radius: 5px;
    background: linear-gradient(to right, rgb(255, 255, 255), rgba(165, 174, 171, 0.8));
    margin-right: 45px; // 确保.login-panel位于背景的右侧
}

.right-login {
    width: 250px;
    background-color: white;
    padding: 30px;
    border-radius: 5px;
}

.logo {
    margin: 10px 0 30px 0;
}

.act,
.pwd {
    margin: 8px 0;
    height: 63px;
    line-height: 63px;
    width: 100%;
    font-size: 20px;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    font-weight: 800;
    padding: 0 8px;
    background-color: rgba(47, 195, 145, 0.15);
    box-sizing: border-box;
    border: 2px solid rgba(47, 195, 145, 0.3);
    border-radius: 6px;
    padding: 0 15px;
    margin-top: 13px;
}

.act:focus,
.pwd:focus {
    outline: none;
    transition: 1.2s;
    background-color: rgba(47, 195, 145, 0.25);
}

.login-btn:hover {
    background-color: rgba(47, 195, 145, 0.8);
}

.login-btn {
    display: inline-block;
    text-align: center;
    border-radius: 3px;
    margin-top: 20px;
    height: 43px;
    line-height: 43px;
    width: 100%;
    background-color: rgb(47, 195, 145);
    font-size: 14px!important;
    border: none;
    color: white;
    padding: 0!important;
    cursor: pointer;
    user-select: none;
}

.tip {
    margin: 20px 0;

    p {
        padding: 3px 0;
        margin: 0;
        font-size: 14px;
        color: rgb(100, 120, 100);
        i {
            margin-right: 3px;
        }

        span {
            color: rgb(60, 80, 60);
            border-radius: 2px;
            margin: 0 6px;
        }

        .no-act:hover {
            color: rgba(47, 195, 145, 0.8);
            cursor: pointer;
        }
    }
}
</style>