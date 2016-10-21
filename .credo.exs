# This file contains the configuration for Credo and you are probably reading
# this after creating it with `mix credo.gen.config`.
#
# If you find anything wrong or unclear in this file, please report an
# issue on GitHub: https://github.com/rrrene/credo/issues
#
%{
  #
  # You can have as many configs as you like in the `configs:` field.
  configs: [
    %{
      #
      # Run any config using `mix credo -C <name>`. If no config name is given
      # "default" is used.
      name: "default",
      #
      # these are the files included in the analysis
      files: %{
        #
        # you can give explicit globs or simply directories
        # in the latter case `**/*.{ex,exs}` will be used
        included: ["lib/", "test/"],
        excluded: [~r"/_build/", ~r"/deps/"]
      },
      #
      # If you create your own checks, you must specify the source files for
      # them here, so they can be loaded by Credo before running the analysis.
      requires: [],
      #
      # Credo automatically checks for updates, like e.g. Hex does.
      # You can disable this behaviour below:
      check_for_updates: true,
      #
      # You can customize the parameters of any check by adding a second element
      # to the tuple.
      #
      # To disable a check put `false` as second element:
      #
      #     {Credo.Check.Design.DuplicatedCode, false}
      #
      checks: [
        {Credo.Check.Readability.ModuleDoc, false},
      ]
    }
  ]
}
