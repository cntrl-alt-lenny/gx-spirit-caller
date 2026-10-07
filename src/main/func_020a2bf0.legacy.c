typedef struct { char pad[0x24]; int lo,hi,cur; } obj_t;
extern int func_02097ea4(obj_t *,int,int);
extern int func_02097f10(int,int,int);
unsigned int func_020a2bf0(obj_t *file) {
 unsigned int header[24]; unsigned int *p=0; unsigned int result=0; int old;
 if(file) { old=file->cur-file->lo; if((unsigned int)func_02097f10((int)file,(int)header,0x60)>=0x60) p=header; func_02097ea4(file,old,0); }
 else p=(unsigned int *)0x027ffe00;
 if(p) { result=p[0x2c/4]+0x268+p[0x3c/4]; if(result<0x10000) result=0x10000; }
 return result;
}
