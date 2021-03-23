#define angle_delta
//angle_delta(angle1,angle2)
return (argument0 - argument1 + 360) mod 360

#define angle_delta2
//angle_delta2(angle1,angle2)
//Will return positive if angle1 is CCW of angle2
var angle;
angle = (argument0 - argument1 + 360) mod 360
if angle > 180
angle = -abs(360 - angle)
return angle

#define line_intersect
//line_intersect(x1,y1,x2,y2,x3,y3,x4,y4,segment)
var x1,y1,dx1,dy1,x2,y2,dx2,dy2,segment;
x1 = argument0
y1 = argument1
dx1 = argument2 - argument0
dy1 = argument3 - argument1
x2 = argument4
y2 = argument5
dx2 = argument6 - argument4
dy2 = argument7 - argument5
segment = argument8

var a,b,e;
e = dx2 * dy1 - dx1 * dy2
if e == 0
return false //lines are parallel
else {
    a = (dx2 * y2 + dy2 * x1 - dx2 * y1 - dy2 * x2) / e
    b = (dy1 * x1 + dx1 * y2 - dx1 * y1 - dy1 * x2) / e
    intersect_x = x1 + dx1 * a
    intersect_y = y1 + dy1 * a
    if segment {
        if (0 <= a && a <= 1) && (0 <= b && b <= 1)
        return true //line segments intersect
        else
        return false //line segments are not parallel and do not intersect
    } else
    return true //lines intersect
}

/* LOGIC:
x1+dx1*a=x2+dx2*b
y1+dy1*a=y2+dy2*b
=> solve for a:
a=(x2+dx2*b-x1)/dx1
=> insert and solve for b:
y1+dy1*(x2+dx2*b-x1)/dx1=y2+dy2*b
dy1*(x2+dx2*b-x1)/dx1=y2+dy2*b-y1
dy1*(x2+dx2*b-x1)=y2*dx1+dy2*b*dx1-y1*dx1
x2*dy1+dx2*b*dy1-x1*dy1=y2*dx1+dy2*b*dx1-y1*dx1
dx2*b*dy1-dy2*b*dx1=y2*dx1-y1*dx1-x2*dy1+x1*dy1
b(dx2*dy1-dy2*dx1)=y2*dx1-y1*dx1-x2*dy1+x1*dy1
b=(y2*dx1-y1*dx1-x2*dy1+x1*dy1)/(dx2*dy1-dy2*dx1)
*/

#define sgn
//sgn(x)
if argument < 0
return -1
else
return 1

#define line_circle_intersect
//line_circle_intersect(x1,y1,x2,y2,radius)
//Determines the point(s) of intersection between a line and a circle with origin (0,0)
var x1,y1,x2,y2,radius;
x1 = argument0
y1 = argument1
x2 = argument2
y2 = argument3
radius = argument4

//calculate definitions
var dx,dy,dr,D;
dx = x2 - x1
dy = y2 - y1
dr = sqrt(sqr(dx) + sqr(dy))
D = x1 * y2 - x2 * y1

//calculate discriminant
discriminant = sqr(radius) * sqr(dr) - sqr(D)
if discriminant < 0 or dr == 0 {
    //no intersection
    return false
} else {
    //one or more solutions
    intersect1_x = (D * dy + sgn(dy) * dx * sqrt(discriminant)) / sqr(dr)
    intersect1_y = (-D * dx + abs(dy) * sqrt(discriminant)) / sqr(dr)
    intersect2_x = (D * dy - sgn(dy) * dx * sqrt(discriminant)) / sqr(dr)
    intersect2_y = (-D * dx - abs(dy) * sqrt(discriminant)) / sqr(dr)
    return true
}

#define line_circle_intersect_origin
//line_circle_intersect_origin(x1,y1,x2,y2,circle_x,circle_y,radius)
//Determines the point(s) of intersection between a line and a circle with a given origin
var x1,y1,x2,y2,circle_x,circle_y,radius;
x1 = argument0
y1 = argument1
x2 = argument2
y2 = argument3
circle_x = argument4
circle_y = argument5
radius = argument6

if line_circle_intersect(x1 - circle_x,y1 - circle_y,x2 - circle_x,y2 - circle_y,radius) {
    intersect1_x += circle_x
    intersect1_y += circle_y
    intersect2_x += circle_x
    intersect2_y += circle_y
    return true
} else
return false

#define line_segment_circle_intersect_origin
//line_segment_circle_intersect_origin(x1,y1,x2,y2,circle_x,circle_y,radius)
//Determines the point(s) of intersection between a line segment and a circle with a given origin
var x1,y1,x2,y2,circle_x,circle_y,radius;
x1 = argument0
y1 = argument1
x2 = argument2
y2 = argument3
circle_x = argument4
circle_y = argument5
radius = argument6

intersect1 = false
intersect2 = false
if line_circle_intersect_origin(x1,y1,x2,y2,circle_x,circle_y,radius) {
    var line_segment_lenth;
    line_segment_length = point_distance(x1,y1,x2,y2)
    //check intersect1
    if  point_distance(x1,y1,intersect1_x,intersect1_y) <= line_segment_length
    and point_distance(x2,y2,intersect1_x,intersect1_y) <= line_segment_length {
        intersect1 = true
    }
    //check intersect2
    if  point_distance(x1,y1,intersect2_x,intersect2_y) <= line_segment_length
    and point_distance(x2,y2,intersect2_x,intersect2_y) <= line_segment_length {
        intersect2 = true
    }
}
if intersect1 or intersect2
return true
else
return false

#define rect_intersect
//rect_intersect(rect1_x,rect1_y,rect1_width,rect1_height,rect2_x,rect2_y,rect2_width,rect2_height)
//Determines whether two rectangles intersect
var rect1_x,rect1_y,rect1_width,rect1_height,rect2_x,rect2_y,rect2_width,rect2_height;
rect1_x = argument0
rect1_y = argument1
rect1_width = argument2
rect1_height = argument3
rect2_x = argument4
rect2_y = argument5
rect2_width = argument6
rect2_height = argument7

if  abs(rect1_x - rect2_x) <= (rect1_width + rect2_width)
and abs(rect1_y - rect2_y) <= (rect1_height + rect2_height)
return true
else
return false

#define rect_intersect2
//rect_intersect2(rect1_x1,rect1_y1,rect1_x2,rect1_y2,rect2_x1,rect2_y1,rect2_x2,rect2_y2)
var rect1_x1,rect1_y1,rect1_x2,rect1_y2,rect2_x1,rect2_y1,rect2_x2,rect2_y2;
rect1_x1 = argument0
rect1_y1 = argument1
rect1_x2 = argument2
rect1_y2 = argument3
rect2_x1 = argument4
rect2_y1 = argument5
rect2_x2 = argument6
rect2_y2 = argument7

if  (rect1_y2 >= rect2_y1) and (rect1_y1 <= rect2_y2) //vertical
and (rect1_x2 >= rect2_x1) and (rect1_x1 <= rect2_x2) //horizontal
return true
else
return false


