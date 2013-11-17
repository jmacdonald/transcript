defmodule Transcript.Mixfile do
  use Mix.Project

  def project do
    [ app: :transcript,
      version: "0.0.1",
      elixir: "~> 0.11.0",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [mod: { Transcript, [] }]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "~> 0.1", git: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    [
      { :socket, "~> 0.1", git: "https://github.com/meh/elixir-socket.git" }
    ]
  end
end
