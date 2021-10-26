# Bar Service

![](logo/hypto_grpc_kotlin.png)

## Overview

This directory contains a simple starter service written as a Kotlin gRPC example.
You can find detailed instructions for building and running example from below

- **Bar Service** using gRPC and Kotlin. For details, see the [project on github](https://gitlab.com/hwslabs/grpc-kotlin-starter).

## Service

The Bar service allows customers to order drinks and pay bills.

## File organization

The starter sources are organized into the following top-level folders:

- [starter-service-kotlin-server](starter-service-kotlin-server): Server that runs on a Kotlin coroutine inside a docker container.
- [starter-service-kotlin-client](starter-service-kotlin-client): Client that runs on a Kotlin coroutine

## Run the server client pair on macOS

- <details>
  <summary>Run the Server</summary>

  Follow the README in [starter-service-kotlin-server](starter-service-kotlin-server) to run the server

  </details>
- <details>
  <summary>Run the Client</summary>

  Follow the README in [starter-service-kotlin-client](starter-service-kotlin-client) to run the client
  </details>
[grpc.io Kotlin/JVM]: https://grpc.io/docs/languages/kotlin/
[Quick start]: https://grpc.io/docs/languages/kotlin/quickstart/
[Basics tutorial]: https://grpc.io/docs/languages/kotlin/basics/
[protos]: protos
[stub]: stub
