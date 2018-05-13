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
      { text: '项目规划', link: '/Iteration1/1-About.md' },
      { text: '团队组员', link: '/Iteration1/2-Team_Profile.md' },
      { text: 'API', link: '/api/' }
    ]
  }
};
