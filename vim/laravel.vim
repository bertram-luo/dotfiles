nmap <leader>lr :e app/Http/routes.php<cr>
nmap <leader>lca :e config/app.php<cr>
nmap <leader>lcd :e config/database.php<cr>
nmap <leader>lc :e composer.json<cr>
nmap <leader>lm :!php artisan make:
nmap <leader><leader>c :CtrlP<cr>app/Http/Controllers/
nmap <leader><leader>v :CtrlP<cr>resources/views/

abbrev gm !php artisan make:model
abbrev gmc !php artisan make:controller
abbrev gmig !php artisan make:migration

function! FacadeLookup()
    let facade = input('Facadename:')
    let classes = {
\       'Form' : 'Html/FormBuilder.php',
\       'Html' : 'Html/HtmlBuilder.php',
\       'File' : 'Filesystem/Filesystem.php',
\       'Eloquent' : 'Database/Eloquent/Model.php'
\    }
    execute ":edit vendor/laravel/framework/src/Illuminate/".classes[facade]
endfunction

nmap <leader>lf :call FacadeLookup()<cr>

"ctrlp
"set wildignore+=*/vendor/**
set wildignore+=*/public/**

function! Class()
    let name = input('Class name?:')
    let namespace = input('Any Namespace?:')

    if strlen(namespace)
        exec 'normal i<?php namespace ' . namespace . ';'
    else
        exec 'normal i<?php'
    endif

    exec 'normal iclass ' . name . '{}O'

    exec 'normal i public function __construct(){ }'
endfunction

nmap <leader>1 :call Class()<cr>

function! AddDependency()
    let dependency = input('Var Name: ')
    let namespace = input('Class Path: ')

    let segments = split(namespace, '\')
    let typehint = segments[-1]

    exec 'normal gg/constructf)i, ' . typehint . ' $' . dependency . '/}O$this->a' . dependency . ' = $' . dependency . ';?{kOprotected $' . dependency . ';?{Ouse ' . namespace . ';'

    " Remove opening comma if there is only one
    " dependency
    exec 'normal :%s/(, /(/g'
endfunction
nmap <leader>2 :call AddDependency()<cr>

nmap <leader>t :!clear && phpunit tests<cr>
nmap <leader>f :!clear && phpunit --stop-on-failure %<cr>
nmap <leader>m yiw:!clear && phpunit --filter "<cr>

