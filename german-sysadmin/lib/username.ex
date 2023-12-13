defmodule Username do
  def sanitize(~c""), do: ~c""

  def sanitize([character | tail]) do
    sanitized_alias =
      case character do
        ?ä -> ~c"ae"
        ?ö -> ~c"oe"
        ?ü -> ~c"ue"
        ?ß -> ~c"ss"
        character when character >= ?a and character <= ?z -> [character]
        ?_ -> ~c"_"
        _ -> ~c""
      end

    sanitized_alias ++ sanitize(tail)
  end
end
