defmodule Transcript do
  use Application.Behaviour

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  def start(_type, _args) do
    Transcript.Supervisor.start_link
  end

  def main [ port, node_name | other_args ] do
    # Get an integer version of the port argument.
    { port, _ } = Integer.parse port

    # Set the node name for distribution.
    :net_kernel.start [:"#{node_name}", :shortnames]

    IO.puts "Registered as #{Node.self}."

    # Connect to another node, if specified.
    unless other_args == [] do
      # Parse the other node name.
      [ other_node_name | _ ] = other_args

      # Try to connect to the other node.
      if Node.connect :"#{other_node_name}" do
        IO.puts "Connected to #{other_node_name} successfully."
      end
    end

    # Start the server on the specified port.
    Server.start port
  end
end
