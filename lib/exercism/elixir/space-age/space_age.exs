defmodule SpaceAge do
  @moduledoc"""
  Given an age in seconds, calculate how old someone would be on:

     - Earth: orbital period 365.25 Earth days, or 31557600 seconds
     - Mercury: orbital period 0.2408467 Earth years
     - Venus: orbital period 0.61519726 Earth years
     - Mars: orbital period 1.8808158 Earth years
     - Jupiter: orbital period 11.862615 Earth years
     - Saturn: orbital period 29.447498 Earth years
     - Uranus: orbital period 84.016846 Earth years
     - Neptune: orbital period 164.79132 Earth years

  So if you were told someone were 1,000,000,000 seconds old, you should
  be able to say that they're 31 Earth-years old.
  """

  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @secs_per_earth_year 31_557_600

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds / @secs_per_earth_year / orbital_period(planet)
  end

  def orbital_period(:mercury) do
    0.2408467
  end

  def orbital_period(:venus) do
    0.61519726
  end

  def orbital_period(:earth) do
    1
  end

  def orbital_period(:mars) do
    1.8808158
  end

  def orbital_period(:jupiter) do
    11.862615
  end

  def orbital_period(:saturn) do
    29.447498
  end

  def orbital_period(:neptune) do
    164.79132
  end

  def orbital_period(:uranus) do
    84.016846
  end
end
