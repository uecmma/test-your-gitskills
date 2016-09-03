# 問題3 「特定のコミットを取ってくる」

## 課題内容

1. `master`ブランチから`work-3`ブランチを作ってください
1. `work-3-sub`タグのコミットを`work-3`に持ってきてください
1. `work3.txt`を以下のように編集したコミットを、作成してください

    ```text
    Complete Work 3 content
    ```

### 課題内容の状態

課題を完成させた状態は以下のようになります。なお、コミットIDやオブジェクトIDは異なる場合があります。

```diff
$ git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s' --abbrev-commit -p work-3...master
49b16db - (HEAD -> work-3) Fix work 3 content
diff --git a/work3.txt b/work3.txt
index 84ca050..c10b5cb 100644
--- a/work3.txt
+++ b/work3.txt
@@ -1 +1 @@
-Work 3 content
+Complete Work 3 content

e1f1346 - Add work 3 content
diff --git a/work3.txt b/work3.txt
new file mode 100644
index 0000000..84ca050
--- /dev/null
+++ b/work3.txt
@@ -0,0 +1 @@
+Work 3 content
```

## ヒント

## 課題解説

## 課題解答例

```bash
$ git checkout master
$ git checkout -b work-3
$ git cherry-pick work-3-sub
$ cat > work3.txt
Complete Work 3 content
$ git commit -am "Fix work 3 content"
```
