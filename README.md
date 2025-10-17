# KMP Sample project & playground

This repository contains a personal Kotlin Multiplatform (KMP) project, created as a demo and playground for my own learning and experimentation. It demonstrates a basic setup for sharing code between Android and iOS, showcasing how to structure a multiplatform project, implement shared business logic, and integrate platform-specific features. This project serves as a hands-on environment to explore KMP concepts, test ideas, and refine my understanding of Kotlin Multiplatform development.

## 🔨 Tech stack

- Kotlin
- Swift
- Jetpack Compose
- SwiftUI
- Ktor
- Koin
- Coroutines
- Skie
- Moko Resources (<em>not implemented yet</em>)
- SQLDelight (<em>not implemented yet</em>)

## 🔨 Architecture

This project follows a Kotlin Multiplatform Clean Architecture, sharing ViewModels, use cases, and data logic across Android (Jetpack Compose) and iOS (SwiftUI) using Ktor, Koin, Coroutines, and Skie for seamless cross-platform integration.

![Architecture diagram](https://i.ibb.co/rRk4n6xZ/Untitled.png)


## 🚀 Current features

![Screens](https://i.ibb.co/x85cWYjd/screens.png)


#### Shared
- Network client (Ktor)
- Repositories
- Use Cases
- BaseViewModel and BasicUiState for better state handling
- Injected modules, repositories, use cases
- Skie for better Swift/Kotlin interface

#### iOS
- Rocket listing
- Rocket detail
- Rocket launch screen using accelerometer
- Navigation controller built on NavigationStack

#### Android not implemented yet

## ✨Future features

- Moko Resource for shared resources (translations, colors, images)
- SQLDelight for data persistence
- Android app

##Future features

## 🌐 Another resources

- SpaceX Data API V4