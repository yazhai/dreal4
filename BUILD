# -*- python -*-
# This file contains rules for Bazel; see https://bazel.io/ .

exports_files([
    "CPPLINT.cfg",
    ".clang-format",
])

load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_deb", "pkg_tar")
load("//tools:dreal.bzl", "dreal_cc_library", "DREAL_VERSION", "DREAL_PREFIX")

genrule(
    name = "generate_pkg_file",
    outs = [
        "dreal.pc",
    ],
    cmd =
        select({
            "@//tools:linux": "$(location //tools:generate_pkg_file_ubuntu) %s %s> $@" % (DREAL_VERSION, DREAL_PREFIX),
            "@//conditions:default": "$(location //tools:generate_pkg_file_osx) %s > $@" % DREAL_VERSION,
        }),
    tools = [
        "//tools:generate_pkg_file_osx",
        "//tools:generate_pkg_file_ubuntu",
    ],
)

pkg_tar(
    name = "package_pkg_file",
    srcs = ["dreal.pc"],
    extension = "tar.gz",
    package_dir = "lib/pkgconfig",
    tags = ["manual"],
    visibility = ["//visibility:public"],
)

pkg_tar(
    name = "package_license_file",
    srcs = ["LICENSE.txt"],
    extension = "tar.gz",
    package_dir = "share/doc/dreal",
    tags = ["manual"],
    visibility = ["//visibility:public"],
)

pkg_tar(
    name = "archive",
    extension = "tar.gz",
    package_dir = DREAL_PREFIX,
    tags = ["manual"],
    deps = [
        ":package_license_file",
        ":package_pkg_file",
        "//dreal:package_bin",
        "//dreal:package_headers",
        "//dreal:package_sharedlib",
        "//dreal/api:package_headers",
        "//dreal/smt2:package_headers",
        "//dreal/solver:package_headers",
        "//dreal/symbolic:package_headers",
        "//dreal/util:package_headers",
    ],
)

pkg_deb(
    name = "package_debian",
    architecture = "amd64",
    built_using = "bazel (0.9.0)",
    data = ":archive",
    depends = [
        "coinor-libclp-dev",
        "libbz2-dev",
        "libibex-dev",
        "libnlopt-dev",
        # The followings are Build-Depends:
        # "bison",
        # "flex",
        # "pkg-config",
    ],
    description = "SMT solver for nonlinear theories",
    homepage = "http://dreal.github.io",
    maintainer = "Soonho Kong <soonho.kong@gmail.com>",
    package = "dreal",
    tags = ["manual"],
    version = DREAL_VERSION,
)

# External users need to include only this target and `dreal/dreal.h` header.
dreal_cc_library(
    name = "dreal",
    srcs = [],
    hdrs = [
        "//dreal:headers",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//dreal/api",
        "//dreal/solver",
        "//dreal/util:box",
    ],
)
