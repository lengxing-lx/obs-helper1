#!/bin/sh -l

if [ -z "$INPUT_ACCESS_KEY" ]; then
  echo "ak is not set. Quitting."
  exit 1
fi
if [ -z "$INPUT_SECRET_KEY" ]; then
  echo "sk is not set. Quitting."
  exit 1
fi
if [ -z "$INPUT_BUCKET_NAME" ]; then
  echo "bucket name is not set. Quitting."
  exit 1
fi
if [ -z "$INPUT_OPERATION_TYPE" ]; then
  echo "operation type is not set. Quitting."
  exit 1
fi
if [ -z "$INPUT_FILE_PATH" ]; then
  echo "file path is not set. Quitting."
  exit 1
fi

# Downloading and Installing obsutil
curl -O ${INPUT_OBSUTIL_URL}
tar -xzvf obsutil_linux_amd64.tar.gz
decompressingDirectory=`ls -l . |awk '/^d/ {print $NF}'|grep obsutil_linux_amd64`
echo $decompressingDirectory
chmod 755 $decompressingDirectory/obsutil

# Initializing obsutil
./$decompressingDirectory/obsutil config -i=${INPUT_ACCESS_KEY} -k=${INPUT_SECRET_KEY} -e=obs.${INPUT_REGION}.myhuaweicloud.com  
./$decompressingDirectory/obsutil cp ${INPUT_FILE_PATH} obs://${INPUT_BUCKET_NAME}/ -f -r