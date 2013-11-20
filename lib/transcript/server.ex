defmodule Server do
  def start(port) do
    # Use a binary/string, explicit exchange TCP configuration.
    tcp_options = [{:active, false}, :binary]

    # Bind and listen on the specified port.
    { :ok, socket } = :gen_tcp.listen port, tcp_options

    IO.puts "Started server on port #{port}."

    handle_connections socket
  end

  def handle_connections(socket) do
    # Block until we receive a connection.
    { :ok, connection } = :gen_tcp.accept socket    

    # Process the connection.
    spawn Server, :process_connection, [connection]

    # Wait for another connection.
    handle_connections socket
  end

  def process_connection(connection) do
    # Read the data from the socket.
    { :ok, data } = :gen_tcp.recv connection, 0

    # Parse and print the log.
    { :ok, level, content } = Message.parse(data)
    IO.puts "#{level}: #{content}"

    # Close the connection socket.
    :gen_tcp.close connection
  end
end
