function varargout = horzcat( varargin ) %#ok<STOUT>
%HORZCAT Horizontal concatenation of chebfun2 objects.
%   This is not allowed and returns an error.  This function exists so that the
%   error message is meaningful to a CHEBFUN2 user.

% Copyright 2013 by The University of Oxford and The Chebfun Developers.
% See http://www.maths.ox.ac.uk/chebfun/ for Chebfun information.

error('CHEBFUN2:HORZCAT', ...
    'Horizontal concatenation of CHEBFUN2 objects is not supported.')

end