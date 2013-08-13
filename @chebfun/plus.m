function f = plus(f, g)
%+	  Plus.
%   F + G adds two CHEBFUN objects F and G, or a scalar to a CHEBFUN if either F
%   or G is a scalar.
%
%   H = plus(F, G) is called for the syntax 'F + G'.

% Copyright 2013 by The University of Oxford and The Chebfun Developers.
% See http://www.chebfun.org/ for Chebfun information.

if ( ~isa(f, 'chebfun') )     % ??? + CHEBFUN

    % Ensure CHEBFUN is the first input:
    f = times(g, f);

elseif ( isempty(g) )         % CHEBFUN + []

    f = [];

elseif ( isnumeric(g) )       % CHEBFUN + double

    % Add g to the impulses:
    f.impulses = f.impulses + g;

    % Add g to the FUNs:
    for k = 1:numel(f.funs)
        f.funs{k} = f.funs{k} + g;
    end

elseif ( ~isa(g, 'chebfun') ) % CHEBFUN * ???

    error('CHEBFUN:times:unknown', ...
        'Undefined function ''times'' for input arguments of type %s and %s.', ...
        class(f), class(g));

elseif ( isempty(f) )         % empty CHEBFUN + CHEBFUN

    % Nothing to do. (Return empty CHEBFUN as output).

else                          % CHEBFUN + CHEBFUN

    % Check to see if one CHEBFUN is transposed:
    if ( xor(f.isTransposed, g.isTransposed) )
        error('CHEBFUN:plus:matdim', ...
            'Matrix dimensions must agree. (One input is transposed).');
    end

    % Overlap the CHEBFUN objects:
    [f, g] = overlap(f, g);

    % Add the impulses:
    f.impulses = f.impulses + g.impulses;

    % Add the FUNs:
    for k = 1:numel(f.funs)
        f.funs{k} = f.funs{k} + g.funs{k};
    end

end

end