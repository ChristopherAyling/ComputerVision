function boxColour = findBoxColour( index )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
if index == 1
    boxColour = 'r';
elseif index == 2
    boxColour = 'g';
elseif index == 3
    boxColour = 'b';
else
    error('colour index out of range')
end

end

