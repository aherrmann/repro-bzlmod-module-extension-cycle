load("//:write_file.bzl", "write_file")

def _extension_1_impl(module_ctx):
    number_of_tags = 0
    for module in module_ctx.modules:
        for tag in module.tags.tag:
            print("MODULE", module.name, "TAG", tag.name)
            number_of_tags += 1
    write_file(
        name = "extension_1",
        filename = "defs.bzl",
        content = 'value = "hello from extension_1, {} tags"'.format(number_of_tags),
    )

_tag = tag_class(
    attrs = {
        "name": attr.string(),
    },
)


extension_1 = module_extension(
    _extension_1_impl,
    tag_classes = {
        "tag": _tag,
    },
)
