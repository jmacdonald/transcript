defmodule Server do
  def start do
    IO.puts "Starting server"

    tcp_options = [{:active, false}, :binary]

    # Start listening and accepting connections.
    { :ok, socket } = :gen_tcp.listen 3000, tcp_options
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
