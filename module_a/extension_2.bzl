load("@extension_1//:defs.bzl", "value")
load("//:write_file.bzl", "write_file")

def _extension_2_impl(module_ctx):
    print("extension_2 found", value)
    write_file(
        name = "extension_2",
        filename = "defs.bzl",
        content = "value = {}".format(repr(value)),
    )

extension_2 = module_extension(_extension_2_impl)
