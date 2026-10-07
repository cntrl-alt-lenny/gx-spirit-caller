typedef struct { char *text; int cursor; } Input;
extern int func_020aabac(void *,int,int);
extern int func_020a9e58(int (*)(void *,int,int),Input *,int,int,int);
int func_020aac30(char *src,int format,int args) {
 Input in; in.text=src;
 if(src && *src) { in.cursor=0; return func_020a9e58(func_020aabac,&in,format,args,0); }
 return -1;
}
