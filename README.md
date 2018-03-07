# color_map

This is a MATLAB function to generate a colour map by linearly interpolating a
set of control points. It accepts as input a matrix, whose rows represent the
colour triplets of the control points, and it produces as output a matrix
representing the colour triplets of the colour map.

By default, the control points are equally spaced in the colour map.
It is possible to pass a second optional argument, constituted by an array of
coordinates in the range `[0,1]` that specify the position of the control points
in the normalised interval of the colour map. The default number of colours in
the resulting palette is 255, but it is possible to alter it through the
parameter `'number'`. Interpolation is done within the colour space of the input,
so if the input contains RGB or HSV triplets, then interpolation will be done
in RGB or HSV space respectively. The boolean parameter `'hsv'` allows to perform
interpolation of RGB colour triplets in HSV space.

# Examples
```matlab
surf(peaks);
colorbar;

% value of the control points in colour space (RGB)
colours = [1 0 0; 0 1 0; 1 1 0; 0 0 1];

cmap = color_map(colours);
colormap(cmap);
```
![ex1](https://user-images.githubusercontent.com/8300317/37118432-7e48842c-2254-11e8-927e-fb1d762244e2.png)
```matlab
% specify coordinates of the control points
coordinates = [0 .15 .9 1.0];

cmap = color_map(colours, coordinates);
colormap(cmap);
```
![ex2](https://user-images.githubusercontent.com/8300317/37118434-7e6a958a-2254-11e8-8241-68308a23af70.png)

# License
The program is distributed under the BSD2 license. See [LICENSE](./LICENSE)
for the full text.
