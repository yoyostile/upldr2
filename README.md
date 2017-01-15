# Upldr

![Upldr](https://up.r4r3.me/u/NippleHole)

Upldr is a quick'n'dirty, simple image/file uploading application.  
This code is fairly old, not tested and just something I did in a spare hour. It works for me, maybe it works for you as well.  
It's not secured in any way, there is no user management, no authentication, everybody can upload stuff.  

## Installing with docker
To set this up, clone this repo, edit docker-compose.yml and run `docker-compose up -d`. It should run out-of-the-box.

```
    POSTGRES_USER: fuckyeah
    POSTGRES_PASSWORD: yourpassword
    DATABASE_URL: postgres://fuckyeah:yourpassword@postgres:5432/upldr
    RAILS_ENV: production
    HTTP_BASIC_AUTH_USER: youruser
    HTTP_BASIC_AUTH_PASS: yourpassword
    SWEAR_WORDS_TOKEN: 'true'
```

Obviously, you should change some of these settings. If you don't want to use swear words as image tokens, just remove the line completely.
`HTTP_BASIC_AUTH_USER` & `HTTP_BASIC_AUTH_USER` are necessary to secure the uploads#index endpoint.

If you want to expose this application to the outer world, you should run a nginx reverse proxy or haproxy in front of it. Google this, if you're not sure, what I'm talking about. Also make sure you have `client_max_body_size` set for nginx.

## Installing without docker
It's a simple rails app. You'll figure it out. But you need to have `imagemagick` and `libmagickwand-dev` installed.

## Features & Questions
If there's a feature missing, you found a bug or you have trouble installing upldr: feel free to open an issue. If you want to contribute, feel free to open a pull request. 

## License

Copyright (c) 2008-2016 Norman Clarke and contributors, released under the MIT
license.

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
