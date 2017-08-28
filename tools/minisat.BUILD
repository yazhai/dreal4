# -*- python -*-
# This file contains rules for Bazel; see https://bazel.io/ .

cc_library(
    name = "minisat",
    srcs = [
        "minisat/core/Solver.cc",
        "minisat/simp/SimpSolver.cc",
        "minisat/utils/Options.cc",
        "minisat/utils/System.cc",
    ],
    hdrs = [
        "minisat/core/Solver.h",
        "minisat/core/SolverTypes.h",
        "minisat/mtl/Alg.h",
        "minisat/mtl/Alloc.h",
        "minisat/mtl/Heap.h",
        "minisat/mtl/IntMap.h",
        "minisat/mtl/IntTypes.h",
        "minisat/mtl/Map.h",
        "minisat/mtl/Queue.h",
        "minisat/mtl/Rnd.h",
        "minisat/mtl/Sort.h",
        "minisat/mtl/Vec.h",
        "minisat/mtl/XAlloc.h",
        "minisat/simp/SimpSolver.h",
        "minisat/utils/Options.h",
        "minisat/utils/ParseUtils.h",
        "minisat/utils/System.h",
    ],
    visibility = ["//visibility:public"],
)
