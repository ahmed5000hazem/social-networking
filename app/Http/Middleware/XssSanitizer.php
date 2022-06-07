<?php

namespace App\Http\Middleware;

use Closure;

class XssSanitizer
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
        $input;
        if ($request->has("post_image") || $request->has("post_video")) {
            $input = $request->except("post_image", "post_video");
        } else {
            $input = $request->all();
        }

        foreach ($input as $key => $value) {
            $input[$key] = trim(strip_tags($value));
        }
        
        $request->merge($input);

        return $next($request);
    }
}
