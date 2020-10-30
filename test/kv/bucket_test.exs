defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  test "stores values by key" do
    {:ok, bucket} = KV.Bucket.start_link([])
    assert KV.Bucket.get(bucket, "milk") == nil

    assert KV.Bucket.put(bucket, "milk", 3) == :ok
    assert KV.Bucket.get(bucket, "milk") == 3
    assert KV.Bucket.put(bucket, "milk", 5) == :ok
    assert KV.Bucket.get(bucket, "milk") == 5

    assert KV.Bucket.delete(bucket, "milk") == 5
    assert KV.Bucket.get(bucket, "milk") == nil
  end
end
