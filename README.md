# Hacking With Swift (UIKit)
This repository serves to track my progress in attempting lessons from [Hacking With Swift (UIKit)](https://www.hackingwithswift.com/100) to learn iOS development.

Due to having limited time, I tend *not* to follow the one-lesson-a-day structure. However, I will try to space lessons out as much as I can. Also note that Milestone 1 here differs from the one on the website. I had mistakenly thought that the first Milestone would be the consolidation of the first 3 projects.

Every time I work on a single project, I will create a new branch to work in. Upon completion, I will create a Pull Request where I will Squash and Merge the commits. This is to allow a more clean commit history. 

I will also write proper commit messages and document additional information in the body where appropriate. I hope that this will serve as good reference should I need to re-visit some code in the future. However, as commits as squashed, viewing these commit details can be done through viewing the PR or the relevant branch.

The following section will serve as a quick way to navigate around this repository and information about the projects.

# Table of Contents

| Name | Description |
|---|---|
| [Project 1](#project-1) | Storm Viewer. Clicking on table cell to view images. |
| [Project 2](#project-2) | Game to choose the correct flag out of 3. |
| [Project 3](#project-3) | Sharing action on navigation bar. |
| [Milestone 1](#milestone-1) | Flag Viewer. Similar as Project 1. |
| [Project 4](#project-4) | Simple browser with WebKit. |
| [Project 5](#project-5) | Game to create anagrams from a given word. |
| [Project 6](#project-6) | More on Auto Layout, learning Visual Format Language and Anchors. |
| [Milestone 2](#milestone-2) | Creating Shopping List via user input. |

## Project 1
[Code](Project1)

[Site](https://www.hackingwithswift.com/read/1/)

Part of initial commit. No PR created.

Description: Storm Viewer. Clicking on table cell to view images.

Notable aspects:
* Creating Table Views
* Basic navigation by pushing `ViewController`
* App bundles and using `FileManager`
* Introduction to Auto Layout
* Usage of outlet for `UIImage`

## Project 2
[Code](Project2)

[Site](https://www.hackingwithswift.com/read/2/)

Part of initial commit. No PR created.

Description: Game to choose the correct flag out of 3.

Notable aspects:
* Asset catalogs
* Usage of `UIButton` and actions
* Introduction to `CALayer` and `UIColor`

## Project 3
[Code](Project3)

[Site](https://www.hackingwithswift.com/read/3/)

Part of initial commit. No PR created.

Description: Sharing action on navigation bar.

Notable aspects:
* Introduction to `UIBarButtonItem`
* Introduction to sharing, via `UIActivityViewController`

## Milestone 1
[Code](Milestone1)

[Site](https://www.hackingwithswift.com/guide/ios-classic/2/3/challenge)

[PR](https://github.com/chrisjwelly/hacking-with-swift-uikit/pull/1)

Description: Flag Viewer. Similar as Project 1.

Notable aspects:
* I attempted to create `Flag` class to handle the String conversions
* Maintaining Aspect Ratio when using Auto Layout to fill screen

## Project 4
[Code](Project4)

[Site](https://www.hackingwithswift.com/read/4/)

[PR](https://github.com/chrisjwelly/hacking-with-swift-uikit/pull/2)

Description: Simple browser with WebKit.

Notable aspects:
* Overriding `loadView()` to initialise `WKWebView()`
* Introduction to delegates
* Using `URL` and `URLRequest`
* Using `UIToolbar` and components like `UIProgressView`
* Introduction to Key-Value Observing 

Existing issue: [#4](https://github.com/chrisjwelly/hacking-with-swift-uikit/issues/4)

## Project 5
[Code](Project5)

[Site](https://www.hackingwithswift.com/read/5/)

[PR](https://github.com/chrisjwelly/hacking-with-swift-uikit/pull/3)

Description: Game to create anagrams from a given word.

Notable aspects:
* Capture lists in Swift (weak, strong, unowned references)
* Adding text fields to `UIAlertController` for user input
* More on Swift strings, closures, `NSRange`

## Project 6
[Code (Part a)](Project6a)

[Code (Part b)](Project6b)

[Site](https://www.hackingwithswift.com/read/6/)

Description: More on Auto Layout, learning Visual Format Language and Anchors.

Notable Aspects:
* Learning Visual Format Language
* Learning Auto Layout Anchors 

Existing Issue: [#6](https://github.com/chrisjwelly/hacking-with-swift-uikit/issues/6)

## Milestone 2
[Code](Milestone2)

[Site](https://www.hackingwithswift.com/guide/ios-classic/3/3/challenge)

[PR](https://github.com/chrisjwelly/hacking-with-swift-uikit/issues/7)

Description: Creating Shopping List via user input.

Notable Aspects:
* Mostly review of Tabel View and prompting user input as per Project 5
* Discovering about `rightBarButtonItems` (with the s at the end) array.
* Reviewed a bit more about closures
