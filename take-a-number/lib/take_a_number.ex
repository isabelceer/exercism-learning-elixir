defmodule TakeANumber do
  def start() do
    spawn(fn -> loop(0) end)
  end

  defp loop(last_state) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, last_state)
        loop(last_state)

      {:take_a_number, sender_pid} ->
        send(sender_pid, last_state + 1)
        loop(last_state + 1)

      :stop ->
        last_state

      _ ->
        loop(last_state)
    end
  end
end
