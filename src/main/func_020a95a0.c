typedef struct { unsigned char *data; unsigned int limit; int cursor; } Buffer;
extern void *func_020a7368(void *,signed char *,int);
int func_020a95a0(Buffer *p,const void *src,int size) {
 int old=p->cursor;
 if((unsigned int)(old+size)>p->limit) size=p->limit-old;
 func_020a7368(p->data+old,(signed char *)src,size); p->cursor+=size; return 1;
}
