# 問題4 「ブランチに変更を載せる」

## 課題内容

1. `work-4`の変更を全て、`work-4-base`の上に載せてください

### 課題内容の状態

課題を完成させた状態は以下のようになります。なお、コミットIDやオブジェクトIDは異なる場合があります。

```diff
$ git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s' --abbrev-commit -p work-4...master
31ef43a - (HEAD -> work-4) Complete work 4 content
diff --git a/work4.txt b/work4.txt
index cc1e58a..ba19d31 100644
--- a/work4.txt
+++ b/work4.txt
@@ -1 +1,2 @@
 Work 4 content
+Complete

f038a4d - (work-4-base) Add sub resource
diff --git a/work4-base.txt b/work4-base.txt
new file mode 100644
index 0000000..2c0d908
--- /dev/null
+++ b/work4-base.txt
@@ -0,0 +1 @@
+Sub resource

259365d - Add work 4 content
diff --git a/work4.txt b/work4.txt
new file mode 100644
index 0000000..cc1e58a
--- /dev/null
+++ b/work4.txt
@@ -0,0 +1 @@
+Work 4 content
```

## ヒント

## 課題解説

## 課題解答例

```bash
git checkout work-4
git rebase work-4-base
```
