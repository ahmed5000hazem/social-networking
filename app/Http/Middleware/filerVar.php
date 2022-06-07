<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\DB;

class filerVar
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $id = $request->route("id");
        $is_int = filter_var($id, FILTER_VALIDATE_INT) ? 1:0;
        $user =  DB::table('users')->where('id', $id)->exists() ? 1: 0;
        if (!$is_int) {
            return redirect('/');
        }else{
            if ($user) {
                return $next($request);
            } else {
                return redirect('/');
            }
        }
    }
}
