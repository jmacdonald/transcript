defmodule MessageTest do
  use ExUnit.Case

  test "parse" do
    # Read the message fixture.
    message = File.read! 'test/fixtures/message.txt'

    # Match the parse return value.
    { :ok, level, content } = Message.parse(message)

    # Validate the returned values.
    assert level == "Error"
    assert content == "This is an error."
  end
end
