# Custom TabBar (SwiftUI)

## Description
<p align="center">
<img src= "https://github.com/skaunited/CustomTabBar/blob/main/Curved%20Custom%20TabBar/demo/demo_CustomTabBAR.gif" width="250" >
</p>

<p align="center">
This is an example of a smoothly animated CustomTabBar implemented with SwiftUI 4.0. The tab bar is customized with unique shapes and animations.

In the project, the `Home` struct uses `@ViewBuilder` to return different views dynamically. This allows for flexible content within the tab bar.

Key features used in this project:
- `@State`: Used to manage and track variables within the view.
- `@Namespace`: Defines a default namespace for the style sheet, allowing for synchronized animations.
- `@Binding`: Enables two-way communication between views, allowing them to share and update data.
- `Path`: Used to draw custom shapes such as rectangles and curves.
- Extension in `View`: Added an extension to export the `viewPosition` as a `CGRect`, which defines the position of the view. This was useful for animating.
</p>
