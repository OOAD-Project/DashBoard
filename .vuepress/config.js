/**
 * Github Pages 配置
 * https://vuepress.vuejs.org/zh/default-theme-config/
 */
module.exports = {
    title: 'EasyOrder',
    description: 'DashBoard',
    base: '/DashBoard/',
    themeConfig: {
        nav: [
            { text: '项目规划', link: '/1-About.md' },
            { text: '团队组员', link: '/2-Team_profile.md' },
            { text: 'API', link: '/7-Design/7.3-API设计/' },
            { text: 'Github', link: 'https://github.com/OOAD-Project' }
        ]
    }
};
