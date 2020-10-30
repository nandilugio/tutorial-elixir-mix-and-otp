defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    bucket = start_supervised!(KV.Bucket)
    %{bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "milk") == nil

    assert KV.Bucket.put(bucket, "milk", 3) == :ok
    assert KV.Bucket.get(bucket, "milk") == 3
    assert KV.Bucket.put(bucket, "milk", 5) == :ok
    assert KV.Bucket.get(bucket, "milk") == 5

    assert KV.Bucket.delete(bucket, "milk") == 5
    assert KV.Bucket.get(bucket, "milk") == nil
  end
end
