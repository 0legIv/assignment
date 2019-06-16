defmodule Assignment.Page do

  defstruct assets: [],
            links: []

  @type t() :: %__MODULE__{
    assets: list(String.t()),
    links: list(String.t())
  }


  def to_struct(assets, links) do
    %__MODULE__{
      assets: assets,
      links: links
    }
  end
end
