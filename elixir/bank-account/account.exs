defmodule BankAccount do
  @moduledoc """
  A bank account that supports access from multiple processes.
  """
  use GenServer

  @name __MODULE__
  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  @doc """
  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account
  def open_bank() do
    {:ok, account} = GenServer.start_link(@name, 0)
    account
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: none
  def close_bank(account) do
    GenServer.stop(account)
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance(account) do
    safe_call(account, :balance)
  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  def update(account, amount) do
    safe_call(account, {:update, amount})
  end

  defp safe_call(account, msg) do
    try do
      GenServer.call(account, msg)
    catch
      :exit, _ -> {:error, :account_closed}
    end
  end

  ## Private API
  def init(state) do
    {:ok, state}
  end

  def handle_call(:balance, _from, balance ) do
    {:reply, balance, balance }
  end

  def handle_call({:update, amount}, _from, balance) do
    new_balance = balance + amount
    {:reply, new_balance, new_balance }
  end

end
