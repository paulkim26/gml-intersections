# gml-intersections
A set of functions to determine whether various lines and 2D polygons intersect with one another in Game Maker.

## Compatibility
Tested with `Game Maker 8.1 Standard`. Utilizes 'pro' functionality for Game Maker versions `8.1` and lower. Untested with `Game Maker Studio`.

## Functions
| Function | Arguments | Returns | Description |
| - | - | - | - |
| `line_intersect` | `x1`, `y1`, `x2`, `y2`, `x3`, `y3`, `x4`, `y4`, `segment` | `boolean` | Returns whether two lines intersect with one another. `x1,y1,x2,y2` denote the coordinates of line 1. `x3,y3,x4,y4` denote the coordinates of line 2. `segment` denotes whether two lines are line segments (`true`) or infinitely long lines (`false`). |
| `line_circle_intersect` | `x1`, `y1`, `x2`, `y2`, `radius` | `boolean`, `intersect1_x`, `intersect1_y`, `intersect2_x`, `intersect2_y` | Returns whether or not a given line intersects with a circle with an origin of (0, 0). If an intersection is detected, will also return the points of intersection. |
| `line_circle_intersect_origin` | `x1`, `y1`, `x2`, `y2`, `circle_x`, `circle_y`, `radius` | `boolean`, `intersect1_x`, `intersect1_y`, `intersect2_x`, `intersect2_y` | Returns whether or not a given line intersects with a circle with a given origin. If an intersection is detected, will also return the points of intersection. |
| `line_segment_circle_intersect_origin` | `x1`, `y1`, `x2`, `y2`, `circle_x`, `circle_y`, `radius` | `boolean`, `intersect1_x`, `intersect1_y`, `intersect2_x`, `intersect2_y` | Returns whether or not a given line segment intersects with a circle with a given origin. If an intersection is detected, will also return the points of intersection. |
| `rect_intersect` | `rect1_x`, `rect1_y`, `rect1_width`, `rect1_height`, `rect2_x`, `rect2_y`, `rect2_width`, `rect2_height` | `boolean` | Returns whether two given rectangles overlap with one another or not. |
| `rect_intersect2` | `rect1_x`, `rect1_y`, `rect1_width`, `rect1_height`, `rect2_x`, `rect2_y`, `rect2_width`, `rect2_height` | `boolean` | Returns whether two given rectangles overlap with one another or not. |
