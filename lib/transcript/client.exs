defmodule Client do
  def send_log do
    { :ok, socket } = :gen_tcp.connect {127,0,0,1}, 3000, [{:active, false}, :binary]

    :gen_tcp.send socket, "Info\nThis is a log message."
    :gen_tcp.close socket
  end
end
