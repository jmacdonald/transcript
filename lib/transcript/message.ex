defmodule Message do
  def parse(message) do
    [ level, content | _ ] = String.split(message, "\n")
    { :ok, level, content }
  end
end
