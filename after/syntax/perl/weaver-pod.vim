" POD commands
syn match podCommand    "^=sub"  nextgroup=podCmdText contains=@NoSpell
syn match podCommand    "^=attrib"  nextgroup=podCmdText contains=@NoSpell
" vim: ts=8
