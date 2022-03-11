# Huawei obs-helper
obs-helper action用于访问管理华为云对象存储服务（[Object Storage Service，OBS](https://www.huaweicloud.com/product/obs.html)），您可以使用该工具对OBS进行上传文件/文件夹、下载文件/文件夹。

## 用法

### 上传文件
```yaml
jobs:
  upload_file:
    runs-on: ubuntu-latest
    steps:
      - name: Upload To Huawei OBS
        uses: huaweicloud/obs-helper@v1
        id: upload_file_to_obs
        with:
          access_key: ${{ secrets.ACCESSKEY }}
          secret_key: ${{ secrets.SECRETACCESSKEY }}
          region: 'region'
          bucket_name: 'bucket_name'
          local_file_path: '/path/to/file'
          operation_type: upload
```
桶内生成对象为：`obs://bucket_name/file`
实例：
```text
bucket_name=bucket-test
local_file_path=README.md
```
成功上传后，桶内生成对象为：
```text
/obs://bucket-test/README.md
```

### 上传文件夹
```yaml
jobs:
  upload_file:
    runs-on: ubuntu-latest
    steps:
      - name: Upload To Huawei OBS
        uses: huaweicloud/obs-helper@v1
        id: upload_file_to_obs
        with:
          access_key: ${{ secrets.ACCESSKEY }}
          secret_key: ${{ secrets.SECRETACCESSKEY }}
          region: 'region'
          bucket_name: 'bucket_name'
          local_file_path: '/path/to/file'
          operation_type: upload
```
桶内生成对象为：`obs://bucket_name/file`
实例：
```text
bucket_name=bucket-test
local_file_path=README.md
```
成功上传后，桶内生成对象为：
```text
/obs://bucket-test/README.md
```
