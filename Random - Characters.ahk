﻿NumpadMult::
{
s := (s := "0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z") "," s "," s
Sort, s, Random D,
i := SubStr(StrReplace(s, ","), 1, 4) ; 4 Dígitos
Send, % i
}
Return