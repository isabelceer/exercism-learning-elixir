defmodule NameBadge do
  def print(id, name, department) do
      depart = if department == nil, do: "OWNER", else: String.upcase(department)
      if id == nil do
          "#{name} - #{depart}"
      else          
          "[#{id}] - #{name} - #{depart}"
      end
  end
end
