defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    needed_bits(color_count, 1)
  end

  defp needed_bits(color_count, bit_count) do
    if Integer.pow(2, bit_count) >= color_count do
      bit_count
    else
      needed_bits(color_count, bit_count + 1)
    end
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    bit_size = palette_bit_size(color_count)
    <<pixel_color_index::size(bit_size), picture::bitstring>>
  end

  def get_first_pixel(picture, color_count) do
    palette_bit_size = palette_bit_size(color_count)

    case picture do
      <<pixel::size(palette_bit_size), _rest::bitstring>> -> pixel
      _ -> nil
    end
  end

  def drop_first_pixel(picture, color_count) do
    palette_bit_size = palette_bit_size(color_count)

    case picture do
      <<pixel::size(palette_bit_size), rest::bitstring>> -> <<rest::bitstring>>
      <<>> -> <<>>
    end
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
