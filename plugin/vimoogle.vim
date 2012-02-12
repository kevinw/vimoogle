if has("python")
    python << EOF
import os.path
try:
    import xgoogle
except ImportError:
    scriptdir = os.path.join(os.path.dirname(vim.eval('expand("<sfile>")')), 'xgoogle')
    sys.path.insert(0, scriptdir)

    import xgoogle
EOF
endif

" <Leader>z opens Google's "I'm feeling lucky" result for the word at the cursor
function! Lucky()
    if has("python")
        python << EOF
from xgoogle.search import GoogleSearch
import webbrowser
import os
term = vim.eval("expand(\"<cword>\")")
gs = GoogleSearch(term)
results = gs.get_results()
if results:
    url = results[0].url
    webbrowser.open(url, new=2)
else:
    print 'no google results'
EOF
    endif
endfunction

map <Leader>z :call Lucky()<CR>


