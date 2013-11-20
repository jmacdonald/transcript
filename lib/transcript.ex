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

    # Start the server on the specified port.
    Server.start port
  end
end
