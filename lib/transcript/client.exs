defmodule Client do
  def send_log 0 do
  end

  def send_log(iterations // 1) do
    # Use a binary/string, explicit exchange TCP configuration.
    tcp_options = [{:active, false}, :binary]

    # Connect to the server on the given port.
    { :ok, connection } = :gen_tcp.connect {127,0,0,1}, 3000, tcp_options

    # Send the message.
    :gen_tcp.send connection, "Info\nThis is a log message."

    # Rinse and repeat, as necessary.
    send_log iterations - 1
  end
end
