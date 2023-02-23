def _write_file_impl(repository_ctx):
    repository_ctx.file(
        "BUILD.bazel",
        "exports_files([{}])".format(repr(repository_ctx.attr.filename)),
        executable = False,
    )
    repository_ctx.file(
        repository_ctx.attr.filename,
        repository_ctx.attr.content,
        executable = False,
    )

write_file = repository_rule(
    _write_file_impl,
    attrs = {
        "filename": attr.string(),
        "content": attr.string(),
    },
)
