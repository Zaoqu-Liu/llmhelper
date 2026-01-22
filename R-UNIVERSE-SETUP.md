# R-universe 设置指南

## 步骤 1: 创建 R-universe 仓库

在 GitHub 上创建一个新仓库，名称为: `Zaoqu-Liu.r-universe.dev`

## 步骤 2: 添加 packages.json

在该仓库的根目录创建 `packages.json` 文件：

```json
[
  {
    "package": "llmhelper",
    "url": "https://github.com/Zaoqu-Liu/llmhelper"
  }
]
```

## 步骤 3: 访问你的 R-universe

设置完成后，访问: https://Zaoqu-Liu.r-universe.dev

用户可以通过以下方式安装：

```r
install.packages("llmhelper", repos = "https://Zaoqu-Liu.r-universe.dev")
```

## 更多信息

- R-universe 文档: https://r-universe.dev/organizations/
- 官方指南: https://ropensci.org/blog/2021/06/22/setup-runiverse/
