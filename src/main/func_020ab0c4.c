unsigned char *func_020ab0c4(unsigned char *haystack,const unsigned char *needle) {
 const unsigned char *n; unsigned char *h,*next; unsigned char first,c,a,b;
 if(needle && (first=*needle)!=0) {
  c=*haystack; next=haystack+1;
  while(c) {
   if(c==first) {
    h=next; n=needle+1;
    do { b=*n++; a=*h++; } while(a==b && a!=0);
    if(!b) return next-1;
   }
   c=*next++;
  }
  return 0;
 }
 return haystack;
}
