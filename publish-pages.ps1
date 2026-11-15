# 把 dist 发布到 GitHub Pages 使用的 gh-pages 分支
$ErrorActionPreference = 'Stop'
$site = "C:\Users\ASUS\Doubao\chats\2026-11-12\new-chat\visible-sea-portfolio"
$tmp = Join-Path $env:TEMP ("pages-publish-" + (Get-Random))
New-Item -ItemType Directory -Path $tmp -Force | Out-Null
Copy-Item -Path (Join-Path $site "dist\*") -Destination $tmp -Recurse -Force

Set-Location -LiteralPath $tmp
& "D:\Git\cmd\git.exe" init -b gh-pages | Out-Null
& "D:\Git\cmd\git.exe" config user.name "luc056"
& "D:\Git\cmd\git.exe" config user.email "luc056@users.noreply.github.com"
& "D:\Git\cmd\git.exe" config core.sshCommand "D:/Git/usr/bin/ssh.exe -F C:/Users/ASUS/.ssh/config"
& "D:\Git\cmd\git.exe" add -A
& "D:\Git\cmd\git.exe" commit -m ("发布：" + (Get-Date -Format "yyyy-MM-dd HH:mm"))
& "D:\Git\cmd\git.exe" remote add origin "git@github.com:luc056/lucky.git"
& "D:\Git\cmd\git.exe" push --force origin gh-pages
Set-Location -LiteralPath $site
Remove-Item -LiteralPath $tmp -Recurse -Force
