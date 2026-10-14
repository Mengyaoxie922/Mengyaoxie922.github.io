A Github Pages template for academic websites. This was forked (then detached) by [Stuart Geiger](https://github.com/staeiou) from the [Minimal Mistakes Jekyll Theme](https://mmistakes.github.io/minimal-mistakes/), which is © 2016 Michael Rose and released under the MIT License. See LICENSE.md.

I think I've got things running smoothly and fixed some major bugs, but feel free to file issues or make pull requests if you want to improve the generic template / theme.

### Note: if you are using this repo and now get a notification about a security vulnerability, delete the Gemfile.lock file. 

# Instructions

1. Register a GitHub account if you don't have one and confirm your e-mail (required!)
1. Fork [this repository](https://github.com/academicpages/academicpages.github.io) by clicking the "fork" button in the top right. 
1. Go to the repository's settings (rightmost item in the tabs that start with "Code", should be below "Unwatch"). Rename the repository "[your GitHub username].github.io", which will also be your website's URL.
1. Set site-wide configuration and create content & metadata (see below -- also see [this set of diffs](http://archive.is/3TPas) showing what files were changed to set up [an example site](https://getorg-testacct.github.io) for a user with the username "getorg-testacct")
1. Upload any files (like PDFs, .zip files, etc.) to the files/ directory. They will appear at https://[your GitHub username].github.io/files/example.pdf.  
1. Check status by going to the repository settings, in the "GitHub pages" section
1. (Optional) Use the Jupyter notebooks or python scripts in the `markdown_generator` folder to generate markdown files for publications and talks from a TSV file.

See more info at https://academicpages.github.io/

## 在 Resume 项目中维护和本地预览

本项目关联仓库：<https://github.com/Mengyaoxie922/Mengyaoxie922.github.io>，默认分支为 `master`。

### Windows 本地预览

1. 在项目目录双击 `start-preview.cmd`，或在终端运行 `.\start-preview.cmd`。
2. 等待终端显示服务器地址后，打开 <http://localhost:4000>。
3. 修改 Markdown 或 `_data/` 中的内容后，Jekyll 会自动重新生成页面并刷新浏览器。修改 `_config.yml` 后，需要重新启动预览。
4. 在运行窗口按 `Ctrl+C` 停止服务；下次再次运行启动文件即可。

启动脚本优先使用项目内 `_local/ruby` 的 Ruby，也支持 PATH 中已有的 Ruby。
在新电脑上，先从 <https://rubyinstaller.org/downloads/> 安装 Ruby 3.3 + Devkit，再运行启动脚本；首次运行会安装 Gemfile 中的依赖。
本机运行环境、依赖与缓存放在 `_local/`，生成的网页放在 `_site/`，这些目录不会提交到 Git。
本地设置来自 `_config.dev.yml`，预览仅监听本机，统计和评论功能关闭。

### 常用内容文件

默认首页 `/` 为英文，中文版为 `/zh/`。点击页眉中的 **English / 中文** 切换；各版本可通过对应网址直接访问和分享，刷新后仍保持当前网址的语言。
本次双语范围为个人主页、页眉、侧栏和页脚；独立的 Publications、CV、Talks、Teaching 等栏目仍保留原有内容。
论文题名、作者及正式文献信息保留原文，其他简历内容在 `en` / `zh` 字段中分别维护。
论文列表按文献信息中的年份倒序排列，同年按谢梦瑶的实际署名顺序从前到后排列；年份与署名顺序均相同时保留原相对顺序。调整排序不改动论文条目文字。
专利展示已在 `_includes/resume.html` 中使用 Liquid 注释暂时关闭，数据仍保留在 `_data/resume.json`；恢复时移除该段的注释标记即可。
双语首页的基础字号为桌面端 14px、窄屏 12px，在 `_sass/_reset.scss` 的 `html.resume-home` 中维护。
项目金额保留原文数值及其数量级，原资料未注明币种，因此没有补充币种。

| 内容 | 文件位置 |
| --- | --- |
| 双语简介、共享论文列表、专利、获奖、项目和学术服务 | `_data/resume.json` |
| 两种语言的姓名、职称、地点及界面标签 | `_data/languages.yml` |
| 英文 / 中文首页入口与页面摘要 | `_pages/about.md` / `_pages/about-zh.md` |
| 站点配置、头像文件名与社交链接 | `_config.yml` |
| 独立 CV 页面 | `_pages/cv.md` |
| 导航菜单 | `_data/navigation.yml` |
| 照片与图片 | `images/` |
| PDF 等附件 | `files/` |

修改后先在本地预览，再查看 `git diff`。确认内容后可提交并推送到 `origin/master`，由 GitHub Pages 发布线上网站。
本地预览更新不会自动同步到线上；必须提交、推送并等待 GitHub Pages 构建完成，再检查线上 `/` 和 `/zh/` 页面。
日常同步远程修改可使用 `git pull --ff-only`；有未提交修改时，先保存并处理本地更改。

### 其他系统

安装 Ruby 和 Bundler 后运行 `bundle install`，再运行：

```sh
bundle exec jekyll serve --config _config.yml,_config.dev.yml --livereload
```

# Changelog -- bugfixes and enhancements

There is one logistical issue with a ready-to-fork template theme like academic pages that makes it a little tricky to get bug fixes and updates to the core theme. If you fork this repository, customize it, then pull again, you'll probably get merge conflicts. If you want to save your various .yml configuration files and markdown files, you can delete the repository and fork it again. Or you can manually patch. 

To support this, all changes to the underlying code appear as a closed issue with the tag 'code change' -- get the list [here](https://github.com/academicpages/academicpages.github.io/issues?q=is%3Aclosed%20is%3Aissue%20label%3A%22code%20change%22%20). Each issue thread includes a comment linking to the single commit or a diff across multiple commits, so those with forked repositories can easily identify what they need to patch.
