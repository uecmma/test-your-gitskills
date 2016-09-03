# 問題1 「リモートにコミットをアップロードする」

## 課題内容

1. `master`ブランチから`work-1`ブランチを作ってください
1. 以下の内容のテキストファイルを追加したコミットを、作成してください。

    * `work1.txt`

        ```text
        Work 1 content
        ```

    * `willremove.txt`

        ```text
        Will remove content
        ```

1. `work1.txt`を以下のように編集したコミットを、作成してください

    ```text
    Complete Work 1 content
    ```

1. `willremove.txt`を削除したコミットを、作成してください

### 課題内容の状態

課題を完成させた状態は以下のようになります。なお、コミットIDやオブジェクトIDは異なる場合があります。

```diff
$ git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)' --abbrev-commit -p HEAD...master
dd51d0b - (HEAD -> work-1) Remove willremove content (9 minutes ago)
diff --git a/willremove.txt b/willremove.txt
deleted file mode 100644
index 8fc862e..0000000
--- a/willremove.txt
+++ /dev/null
@@ -1 +0,0 @@
-Will remove content

6870931 - Fix work 1 content (9 minutes ago)
diff --git a/word1.txt b/word1.txt
index 84305bd..fff5634 100644
--- a/word1.txt
+++ b/word1.txt
@@ -1 +1 @@
-Work 1 content
+Complete Work 1 content

0d6dfde - Add two contents (10 minutes ago)
diff --git a/willremove.txt b/willremove.txt
new file mode 100644
index 0000000..8fc862e
--- /dev/null
+++ b/willremove.txt
@@ -0,0 +1 @@
+Will remove content
diff --git a/word1.txt b/word1.txt
new file mode 100644
index 0000000..84305bd
--- /dev/null
+++ b/word1.txt
@@ -0,0 +1 @@
+Work 1 content
```

## ヒント

## 課題解答例

```bash
$ git checkout master
$ git checkout -b work-1
$ cat > word1.txt
Work 1 content
$ cat > willremove.txt
Will remove content
$ git add .
$ git commit -m "Add two contents"
$ cat > word1.txt
Complete Work 1 content
$ git commit -am "Fix work 1 content"
$ git rm willremove.txt
$ git commit -m "Remove willremove content"
```

## 課題解説
