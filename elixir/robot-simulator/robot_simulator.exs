defmodule RobotSimulator do
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """

  # First problem is that how do i store state in a robot?
  defstruct direction: :north, position: {0,0}

  @spec create(direction :: atom, position :: {integer, integer}) :: any

  def create(direction \\ :north, pos \\ {0,0})

  def create(direction, position={x,y})
    when direction in [:north, :east, :south, :west]
    and is_integer(x) and is_integer(y) do
    %RobotSimulator{direction: direction, position: position}
  end

  # https://hexdocs.pm/elixir/master/guards.html
  def create(_, {x,y}) when is_integer(x) and is_integer(y) do
    {:error, "invalid direction"}
  end

  # when direction not in [:north, :east, :south, :west]
  def create(_, _) do
    {:error, "invalid position"}
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    instruction_list = String.graphemes(instructions)
    robot = move_robot(robot, instruction_list)
  end

  def move_robot(robot, []) do
    robot
  end

  ## When robot is in north
  def move_robot(robot = %RobotSimulator{direction: :north, position: {x, y} }, ["R"|t]) do
    new_robot = %RobotSimulator{direction: :east, position: robot.position}
    move_robot(new_robot, t)
  end

  def move_robot(robot = %RobotSimulator{direction: :north, position: {x, y} }, ["L"|t]) do
    new_robot = %RobotSimulator{direction: :west, position: robot.position}
    move_robot(new_robot, t)
  end
  ##

  ## When robot is in west
  def move_robot(robot = %RobotSimulator{direction: :west, position: {x, y} }, ["R"|t]) do
    new_robot = %RobotSimulator{direction: :north, position: robot.position}
    move_robot(new_robot, t)
  end

  def move_robot(robot = %RobotSimulator{direction: :west, position: {x, y} }, ["L"|t]) do
    new_robot = %RobotSimulator{direction: :south, position: robot.position}
  end
  ##

  ## When robot is in south
  def move_robot(robot = %RobotSimulator{direction: :south, position: {x, y} }, ["R"|t]) do
    new_robot = %RobotSimulator{direction: :west, position: robot.position}
    move_robot(new_robot, t)
  end

  def move_robot(robot = %RobotSimulator{direction: :south, position: {x, y} }, ["L"|t]) do
    new_robot = %RobotSimulator{direction: :east, position: robot.position}
  end
  ##

  ## When robot is in east
  def move_robot(robot = %RobotSimulator{direction: :east, position: {x, y} }, ["R"|t]) do
    new_robot = %RobotSimulator{direction: :south, position: robot.position}
    move_robot(new_robot, t)
  end

  def move_robot(robot = %RobotSimulator{direction: :east, position: {x, y} }, ["L"|t]) do
    new_robot = %RobotSimulator{direction: :north, position: robot.position}
  end
  ##

  def move_robot(robot = %RobotSimulator{direction: :north, position: {x, y} }, [h|t]) when h == "A" do
    new_robot = %RobotSimulator{direction: robot.direction, position: {x, y+1}}
    move_robot(new_robot, t)
  end

  def move_robot(robot = %RobotSimulator{direction: :south, position: {x, y} }, [h|t]) when h == "A" do
    new_robot = %RobotSimulator{direction: robot.direction, position: {x, y-1}}
    move_robot(new_robot, t)
  end

  def move_robot(robot = %RobotSimulator{direction: :east, position: {x, y} }, [h|t]) when h == "A" do
    new_robot = %RobotSimulator{direction: robot.direction, position: {x+1, y}}
    move_robot(new_robot, t)
  end

  def move_robot(robot = %RobotSimulator{direction: :west, position: {x, y} }, [h|t]) when h == "A" do
    new_robot = %RobotSimulator{direction: robot.direction, position: {x-1, y}}
    move_robot(new_robot, t)
  end


  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot.direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    robot.position
  end

  defmacro valid_direction?(direction) do
    Enum.member?([:north, :east, :south, :west], direction)
  end
end
