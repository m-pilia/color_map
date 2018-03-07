% Create a colormap interpolating a set of given colours.
% Author: Martino Pilia <martino.pilia@gmail.com>
% 
% colors:  matrix with n color triplets as rows (control points)
% indices: array with the indices (range [0,1]) of the control points
%          within the colormap (default: equally spaced)
% number:  number of colours (default: 255)
% hsv:     interpolate in hsv colour space (default: 0)
function cmap = color_map(colors, varargin)

    function res = check_colours(c)
        if ~ismatrix(c) || size(c,2) ~= 3
            error('The rows must be colour triplets.');
        end
        res = 1;
    end

    function res = check_indices(idx)
        if ~isrow(idx)
            error('Must be an array of indices.')
        elseif size(idx,2) ~= size(colors,1)
            error('The array size must match the number of colours.');
        elseif any(idx < 0) || any(idx > 1)
            error('The indices must be within range [0,1].');
        end
        res = 1;
    end

    % Parse and validate input
    p = inputParser;
    addRequired(p, 'colors', @check_colours)
    addOptional(p, 'indices', 0, @check_indices);
    addParameter(p, 'number', 255);
    addParameter(p, 'hsv', 0);    
    parse(p,colors,varargin{:});
   
    palette_size = p.Results.number;
    colour_number = size(colors,1);
    
    if p.Results.indices == 0
        idx = round(linspace(1, palette_size, colour_number));
    else
        idx = round(1 + p.Results.indices .* (palette_size - 1));
    end
    
    if p.Results.hsv
        colors = rgb2hsv(colors);
    end

    % Do interpolation
    [x, y] = meshgrid(1:3, 1:palette_size);
    cmap = interp2(x(idx,:), y(idx,:), colors, x, y);
    
    if p.Results.hsv
        cmap = hsv2rgb(cmap);
    end
end
