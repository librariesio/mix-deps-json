defmodule MixupTest do
  use ExUnit.Case

  test "lockfile can parse mix.lock" do
    {:ok, lockfile} = File.read("./test/fixtures/lockfile")
    result = Lockfile.parse(lockfile)

    assert result == [{:hex, :cowboy, "1.0.0"}]
  end

  test "mixfile can parse mix.exs" do
    {:ok, mixfile} = File.read("./test/fixtures/mixfile")
    result = Mixfile.parse(mixfile)

    assert result == [poison: "~> 1.3.1", plug: "~> 0.11.0"]
  end

  test "encoder can encode mixfiles" do
    {:ok, mixfile} = File.read("./test/fixtures/mixfile")
    result = Mixfile.parse(mixfile)

    json = Encoder.mixfile_json(result)

    assert json == "{\"poison\":\"~> 1.3.1\",\"plug\":\"~> 0.11.0\"}"
  end

  test "encoder can encode lockfiles" do
    {:ok, lockfile} = File.read("./test/fixtures/lockfile")
    result = Lockfile.parse(lockfile)

    json = Encoder.lockfile_json(result)

    assert json == "{\"cowboy\":{\"version\":\"1.0.0\",\"source\":\"hex\"}}"
  end

  test "encoder can encode new lockfiles" do
    {:ok, lockfile} = File.read("./test/fixtures/newlockfile")
    result = Lockfile.parse(lockfile)

    json = Encoder.lockfile_json(result)

    assert json ==
             "{\"ranch\":{\"version\":\"1.2.1\",\"source\":\"hex\"},\"poison\":{\"version\":\"2.1.0\",\"source\":\"hex\"},\"plug\":{\"version\":\"1.1.6\",\"source\":\"hex\"},\"cowlib\":{\"version\":\"1.0.2\",\"source\":\"hex\"},\"cowboy\":{\"version\":\"1.0.4\",\"source\":\"hex\"}}"
  end
end
