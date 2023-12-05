defmodule BirdCount do
  def today([]), do: nil
  def today([todays_count | _rest_days_count]) do
    todays_count
  end

  def increment_day_count([]), do: [1]
  def increment_day_count([todays_count | rest_days_count]), do: [1 + todays_count | rest_days_count]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _rest_days_count]), do: true
  def has_day_without_birds?([_ | rest_days_count]), do: has_day_without_birds?(rest_days_count)  

  def total([]), do: 0
  def total([todays_count | rest_days_count]), do: todays_count + total(rest_days_count)

  def busy_days([]), do: 0
  def busy_days([todays_count | rest_days_count]) when todays_count >= 5, do: 1 + busy_days(rest_days_count)
def busy_days([_todays_count | rest_days_count]), do: busy_days(rest_days_count)
end
