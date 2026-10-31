typedef struct { int a,b; } Pair;
typedef struct Owner Owner;
typedef struct Src Src;
typedef struct Item Item;
typedef struct T_0205d688 T_0205d688;
extern int func_020453e8(int a);
extern void func_02054868(int a0,int a1,int a2);
extern int func_02058528(Owner **pp,Pair key,int a3,Src *src,int a5);
extern void func_020585d4(void *,int,int);
extern int func_020590f0(char **,char *);
extern int func_0205938c(char **,char *);
extern void func_0205bd58(Owner **pp,Item *item);
extern void func_0205d688(T_0205d688 **p,int a1);
extern int func_0205d6f8(char **pp,int key);
extern int func_0205ffc0(int *p,int b);
extern void func_0205ffd4(int *a0,int a1,int a2);
extern int func_020602c4(char *,char *,char *,int);
extern int func_020603cc(char **ctx,char *line,int check);
extern void func_020604b0(char *dst,char *src,int n);
extern int func_020a73d4(int x,int unused1,int unused2);
extern int func_020a7440(unsigned char *p0,unsigned char *p1,int count);
extern int func_020a978c(char *,char *,...);
extern int func_020aaddc(const char *s);
extern int func_020ab054(unsigned char *s1,unsigned char *s2,int n);
extern unsigned char *func_020ab0c4(unsigned char *haystack,const unsigned char *needle);
/* The original prepares only r0, leaving the thunk's extra arguments unspecified. */
extern int func_020ace00();
extern char data_021003c0[],data_021003c8[],data_021003d0[],data_021003d8[];
extern char data_02100408[],data_02100414[],data_0210041c[],data_02100428[];
extern char data_02100458[],data_02100464[],data_0210046c[],data_02100478[];
extern char data_02100488[],data_02100490[],data_02100498[],data_021004a8[];
extern char data_021004dc[],data_021004e4[],data_02100504[];
#define I(p,o) (*(int *)((p)+(o)))
#define ERROR(code,msg) { func_0205ffd4((int *)ctx,code,(int)msg); func_020585d4(ctx,3,1); return 3; }
int func_02058a08(char **ctx,char *entry,char *line) {
    char *st=*ctx;
    char *obj;
    int result;
    struct { Pair key;
    unsigned char digest[0x21];
    char name[0x15];
    char buf[0x200];
    char fallback[0x50]; } work;
    char *text;
    if(func_020603cc(ctx,line,0)) {
        if(I(st,0x418)==0x106 && I(st,0x1a0)!=0) {
            func_0205d688((T_0205d688 **)ctx,I(st,0x1a0));
            I(st,0x19c)=0;
            I(st,0x1a0)=0;
        } else if(I(st,0x418)==0x201) {
            if(func_020602c4(line,data_021003c0,work.buf,0x200))
                I(st,0x1a0)=func_020ace00(work.buf);
        }
        if(func_020ab0c4((unsigned char *)line,(unsigned char *)data_021003c8)) {
            func_0205ffd4((int *)ctx,I(st,0x418),(int)st);
            func_020585d4(ctx,4,1); return 4;
        }
        func_0205ffd4((int *)ctx,I(st,0x418),(int)st);
        func_020585d4(ctx,4,0); return 4;
    }
    obj=*(char **)(entry+4);
    switch(I(entry,0x14)) {
    case 1:
        if(func_020ab054((unsigned char *)line,(unsigned char *)data_021003d0,5)) ERROR(1,data_021003d8)
        if(!func_020602c4(line,data_02100408,obj,0x80)) ERROR(1,data_021003d8)
        if(I(obj,0x304)) {
            result=func_020590f0(ctx,obj);
            if(result) return result;
            I(entry,0x14)=3;
        } else {
            result=func_0205938c(ctx,obj);
            if(result) return result;
            I(entry,0x14)=2;
        }
        break;
    case 3:
        if(func_020ab054((unsigned char *)line,(unsigned char *)data_02100414,5)) ERROR(1,data_021003d8)
        if(!func_020602c4(line,data_0210041c,work.buf,0x200)) ERROR(1,data_02100428)
        I(st,0x19c)=func_020ace00(work.buf);
        if(!func_020602c4(line,data_02100458,work.buf,0x200)) ERROR(1,data_02100428)
        I(st,0x1a0)=func_020ace00(work.buf);
        result=func_0205938c(ctx,obj);
        if(result) return result;
        I(entry,0x14)=2;
        break;
    case 2:
        if(func_020ab054((unsigned char *)line,(unsigned char *)data_02100464,5)) ERROR(1,data_021003d8)
        if(!func_020602c4(line,data_0210046c,work.buf,0x200)) ERROR(1,data_02100428)
        I(st,0x198)=func_020ace00(work.buf);
        if(!func_020602c4(line,data_0210041c,work.buf,0x200)) ERROR(1,data_02100428)
        I(st,0x19c)=func_020ace00(work.buf);
        if(!func_020602c4(line,data_02100458,work.buf,0x200)) ERROR(1,data_02100428)
        I(st,0x1a0)=func_020ace00(work.buf);
        if(!func_020602c4(line,data_02100478,work.name,0x15)) work.name[0]=0;
        if(!func_020602c4(line,data_02100488,st+0x474,0x19)) st[0x474]=0;
        if(obj[0xc2]) text=obj+0xc2;
        else if(st[0x12f]) text=st+0x12f;
        else {
            func_020a978c(work.fallback,data_02100490,st+0x110,st+0x144);
            text=work.fallback;
        }
        func_020a978c(work.buf,data_02100498,obj+0xa1,data_021004a8,text,obj,obj+0x80,obj+0xa1);
        result=func_020aaddc(work.buf);
        func_02054868((int)work.buf,result,(int)work.digest);
        if(!func_020602c4(line,data_021004dc,work.buf,0x200)) ERROR(1,data_02100428)
        if(func_020a7440(work.digest,(unsigned char *)work.buf,0x20)) ERROR(0x108,data_021004e4)
        if(I(st,0x100)) {
            int *p=(int *)func_0205d6f8(ctx,I(st,0x1a0));
            p[0]=I(st,0x1a0);
            p[1]=I(st,0x19c);
        }
        I(st,0x1d8)=3;
        work.key=*(Pair *)(entry+0xc);
        if(work.key.a) {
            obj=(char *)func_020453e8(0x20);
            if(!obj) {
                func_0205ffc0((int *)ctx,(int)data_02100504);
                return 1;
            }
            func_020a73d4((int)obj,0,0x20);
            I(obj,4)=I(st,0x1a0);
            I(obj,0)=0;
            func_020604b0(obj+8,work.name,0x15);
            result=func_02058528((Owner **)ctx,work.key,(int)obj,(Src *)entry,0);
            if(result) return result;
        }
        func_0205bd58((Owner **)ctx,(Item *)entry);
        break;
    }
    return 0;
}



