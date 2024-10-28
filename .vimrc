set number
set hlsearch

"vim更改注释颜色为天蓝色
hi comment ctermfg=6

set tags=tags;

"突出显示当前行
set cursorline

"每一个tab键为8个空格长
set tabstop=8
"保持换行时自动缩进1个tab
"与tabstop保持数值一致,在换行时自动缩进一个tab,否则是对应数量的空格
set shiftwidth=8

"默认打开Taglist
let Tlist_Auto_Open=1

"设置taglist宽度"
let Tlist_WinWidth=28

"在右侧窗口中显示taglist窗口
let Tlist_Use_Right_Window = 0

"列出当前目录文件  
map <F2> :Ve .<CR>	
map <F3> :vertical res 150<CR>
map <F4> :vertical res 75<CR>

"搜索忽略大小写
set ignorecase

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

"只同时显示1个文件的tag
let Tlist_Show_One_File=1


"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction
filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu
set path+=/data1/zhangbin36/sdr/srsRAN-master/lib/include


