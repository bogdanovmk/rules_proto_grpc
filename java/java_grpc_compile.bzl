"""Generated definition of java_grpc_compile."""

load(
    "//:defs.bzl",
    "ProtoPluginInfo",
    "proto_compile_attrs",
    "proto_compile_impl",
    "proto_compile_toolchains",
)

# Create compile rule
java_grpc_compile = rule(
    implementation = proto_compile_impl,
    attrs = dict(
        proto_compile_attrs,
        _plugins = attr.label_list(
            providers = [ProtoPluginInfo],
            default = [
                Label("//java:java_plugin"),
                Label("//java:grpc_java_plugin"),
            ],
            doc = "List of protoc plugins to apply",
        ),
        _fixer = attr.label(
            doc = "The fixer tool",
            default = "//tools/fixer",
            executable = True,
            cfg = "exec",
        ),
    ),
    toolchains = proto_compile_toolchains,
)
