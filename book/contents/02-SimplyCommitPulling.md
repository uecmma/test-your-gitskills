# 問題2 「リモートのコミットを取り込む」

## 課題内容

1. `work-2`ブランチにチェックアウトしてください
1. `work2.txt`を以下のように編集したコミットを、作成してください

    ```text
    Complete Work 2 content
    ```

### 課題内容の状態

課題を完成させた状態は以下のようになります。なお、コミットIDやオブジェクトIDは異なる場合があります。

```diff
$ git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s' --abbrev-commit -p work-2...master
3b24553 - (HEAD -> work-2) Fix work 2 content
diff --git a/work2.txt b/work2.txt
index e0db2b0..0c18bd2 100644
--- a/work2.txt
+++ b/work2.txt
@@ -1 +1 @@
-Work 2 content
+Complete Work 2 content

2b4eada - Add work 2 content
diff --git a/work2.txt b/work2.txt
new file mode 100644
index 0000000..e0db2b0
--- /dev/null
+++ b/work2.txt
@@ -0,0 +1 @@
+Work 2 content
```

## ヒント

## 課題解説

## 課題解答例

```bash
$ git checkout work-2
$ cat > work2.txt
Complete Work 2 content
$ git commit -am "Fix work 2 content"
```
