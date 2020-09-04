// swift-tools-version:5.0
//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftNIO open source project
//
// Copyright (c) 2017-2018 Apple Inc. and the SwiftNIO project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftNIO project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

import PackageDescription

// This package contains a vendored copy of BoringSSL. For ease of tracking
// down problems with the copy of BoringSSL in use, we include a copy of the
// commit hash of the revision of BoringSSL included in the given release.
// This is also reproduced in a file called hash.txt in the
// Sources/CNIOBoringSSL directory. The source repository is at
// https://boringssl.googlesource.com/boringssl.
//
// BoringSSL Commit: 1c58648f14ed75f2a8cc3ae08897987d97f493ec

let package = Package(
    name: "XCrypto",
    products: [
        .library(name: "CNIOBoringSSLEcdh", targets: ["CNIOBoringSSLEcdh"]),
        .executable(name: "CNIOBoringSSLEcdhRun", targets: ["CNIOBoringSSLEcdhRun"]),
        .library(name: "NIOSSL", targets: ["NIOSSL"]),
        .executable(name: "NIOTLSServer", targets: ["NIOTLSServer"]),
        .executable(name: "NIOSSLHTTP1Client", targets: ["NIOSSLHTTP1Client"]),
/* This target is used only for symbol mangling. It's added and removed automatically because it emits build warnings. MANGLE_START
        .library(name: "CNIOBoringSSL", type: .static, targets: ["CNIOBoringSSL"]),
MANGLE_END */
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "XBoringSSL"),
    ],
    cxxLanguageStandard: .cxx11
)
