## create
- /users/createというURLは存在しない。/usersが正しい。
```
リストの表示・・・/users/index
更新・・・/users/1/update
ではなく、正しくは
↓
リストの表示・・・/users ←GET
更新・・・/users/1　← PATCH
である。
