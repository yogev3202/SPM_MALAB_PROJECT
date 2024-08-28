function mex_name = casadi_fun_to_mex(casadi_fun, dir, opt_flag)
    arguments
        casadi_fun (1,1) casadi.Function
        dir char
        opt_flag = '-O3'
    end

    disp(['Compiling with ',opt_flag])
    
    mex_name = casadi_fun.name;
    full_name = [dir, '/', mex_name, '.c'];
    opts = struct('main', true, ...
        'mex', true);
    casadi_fun.generate(mex_name, opts);
    if ~strcmp(dir,pwd)
        movefile([mex_name,'.c'], dir);
    end
    mex(full_name, '-largeArrayDims', ['COPTIMFLAGS="',opt_flag,'"']);
    
    if ~strcmp(dir,pwd)
        movefile([mex_name,'.mexa64'], dir);
    end
end