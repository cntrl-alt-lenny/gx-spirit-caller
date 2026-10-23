typedef struct { int a,b; } Pair;
typedef struct Node Node;
struct Node { int kind; int p4,p8,key; char pad[0x2c]; Node *next; };
typedef struct { char pad[0x100]; int active; char pad104[0x330]; Node *head; } Owner;
typedef struct { int a,b,c; Pair callback; int x14,x18; } Item;
typedef struct { char *s0,*s4,*s8,*sc,*s10,*s14; int f18; char s1c[11],s27[3]; float f2c,f30; char s34[128]; int fb4,fb8,fbc,fc0,fc4; char *sc8; int fcc,fd0,fd4,fd8,fdc,fe0,fe4,fe8,fec; } Src;
typedef struct { int kind,key; char rest[0x1fc]; } Dst;
extern int func_020603cc(char **ctx,char *line,int check);
extern int func_020ab054(unsigned char *s1,unsigned char *s2,int n);
extern void func_0205ffd4(int *a0,int a1,int a2);
extern void func_020585d4(void *,int,int);
extern int func_020602c4(char *,char *,char *,int);
/* These thunks receive only r0 here, fewer arguments than their C definitions. */
extern int func_020ace00();
extern int func_020453b4();
extern int func_020ac45c();
extern float func_020b1c7c(int);
extern void func_020a6d54(int,int,int,int);
extern int func_0205d6bc(void **pp,int val,int *out);
extern int func_0205d6f8(char **pp,int key);
extern int func_0205b9ac(void *,int,int *,int *,int *);
extern int func_020552dc(void *self);
extern int func_02059e5c(void *,void *,Src *);
extern void *func_020453e8(int a);
extern int func_0205ffc0(int *p,int b);
extern void func_0205b7a8(Src *src,Dst *dst);
extern int func_02058528(Owner **pp,Pair key,int a3,Item *src,int a5);
extern void func_0205bd58(Owner **pp,Item *item);
extern char data_02100780[],data_021007a8[],data_021007d8[],data_021007f4[],data_021007fc[],data_0210080c[],data_02100820[],data_0210082c[],data_02100838[],data_02100844[],data_02100868[],data_02100884[],data_0210088c[],data_021008cc[],data_021008d4[],data_021008dc[],data_021008e4[],data_021008ec[],data_021008f4[],data_021008fc[],data_02100904[],data_021009d8[],data_021009e0[],data_02100a10[],data_02100a20[],data_02100a2c[],data_02100a34[],data_02100a3c[],data_02100a44[],data_02100a4c[],data_02100a54[],data_02100a5c[];
int func_0205af90(Owner **pp,Item *item,char *line) {
    int key;
    Owner *o=*pp;
    int found;
    Pair callback;
    char buf[0x40];
    char s0[0x1f],s4[0x15],s8[0x33],sc[0x1f],s10[0x1f],sc8[0x33];


    Node *n;
    int update;
    Dst *dst;
    int result;
    if(func_020603cc((char **)pp,line,1)) return 4;
    if(func_020ab054((unsigned char *)line,(unsigned char *)data_021009d8,4)) {
        func_0205ffd4((int *)pp,1,(int)data_021009e0);
        func_020585d4(pp,3,1); return 3;
    }
    if(!func_020602c4(line,data_021007a8,buf,0x40)) {
        func_0205ffd4((int *)pp,1,(int)data_021009e0);
        func_020585d4(pp,3,1); return 3;
    }
    key=func_020ace00(buf);
    if(key<=0) func_020a6d54((int)data_02100a10,(int)data_02100a20,0,0x15a);
    func_0205d6bc((void **)pp,key,&found);
    Src src={0};
    char s14[0x4c];
    src.s0=s0; src.s4=s4; src.s8=s8; src.sc=sc; src.s10=s10; src.s14=s14; src.sc8=sc8;
    if(!func_020602c4(line,data_021007f4,src.s0,0x1f)) src.s0[0]=0;
    if(!func_020602c4(line,data_021007fc,src.s4,0x15)) src.s4[0]=0;
    if(!func_020602c4(line,data_0210080c,src.s8,0x33)) src.s8[0]=0;
    if(!func_020602c4(line,data_02100820,src.sc,0x1f)) src.sc[0]=0;
    if(!func_020602c4(line,data_0210082c,src.s10,0x1f)) src.s10[0]=0;
    if(!func_020602c4(line,data_0210088c,buf,0x40)) src.f18=-1;
    else src.f18=func_020ace00(buf);
    if(!func_020602c4(line,data_02100838,src.s14,0x4c)) src.s14[0]=0;
    if(!func_020602c4(line,data_02100844,src.s1c,11)) src.s1c[0]=0;
    if(!func_020602c4(line,data_02100868,src.s27,3)) src.s27[0]=0;
    if(!func_020602c4(line,data_02100a2c,buf,0x40)) src.f2c=0;
    else src.f2c=func_020b1c7c(func_020ac45c(buf));
    if(!func_020602c4(line,data_02100a34,buf,0x40)) src.f30=0;
    else src.f30=func_020b1c7c(func_020ac45c(buf));
    if(!func_020602c4(line,data_02100a3c,src.s34,0x80)) src.s34[0]=0;
    if(!func_020602c4(line,data_021007d8,buf,0x40)) { src.fb4=0; src.fb8=0; src.fbc=0; }
    else {
        result=func_0205b9ac(pp,func_020ace00(buf),&src.fb4,&src.fb8,&src.fbc);
        if(result) return result;
    }
    if(!func_020602c4(line,data_02100884,buf,0x40)) src.fc0=0x502;
    else if(buf[0]=='0') src.fc0=0x500;
    else if(buf[0]=='1') src.fc0=0x501;
    else src.fc0=0x502;
    if(!func_020602c4(line,data_02100a44,buf,0x40)) src.fc4=-1;
    else src.fc4=func_020ace00(buf);
    if(!func_020602c4(line,data_021008cc,src.sc8,0x33)) src.sc8[0]=0;
    if(!func_020602c4(line,data_021008d4,buf,0x40)) src.fcc=0;
    else src.fcc=func_020ace00(buf);
    if(!func_020602c4(line,data_021008dc,buf,0x40)) src.fd0=0;
    else src.fd0=func_020ace00(buf);
    if(!func_020602c4(line,data_021008e4,buf,0x40)) src.fd4=0;
    else src.fd4=func_020ace00(buf);
    if(!func_020602c4(line,data_021008ec,buf,0x40)) src.fd8=0;
    else src.fd8=func_020ace00(buf);
    if(!func_020602c4(line,data_021008f4,buf,0x40)) src.fdc=0;
    else src.fdc=func_020ace00(buf);
    if(!func_020602c4(line,data_021008fc,buf,0x40)) src.fe0=0;
    else src.fe0=func_020ace00(buf);
    if(!func_020602c4(line,data_02100904,buf,0x40)) src.fe4=0;
    else src.fe4=func_020ace00(buf);
    if(!func_020602c4(line,data_02100a4c,buf,0x40)) src.fe8=0;
    else src.fe8=func_020ace00(buf);
    if(!func_020602c4(line,data_02100a54,buf,0x40)) src.fec=0;
    else src.fec=func_020ace00(buf);
    if(!func_020602c4(line,data_02100a5c,buf,0x40)) {
        func_0205ffd4((int *)pp,1,(int)data_021009e0);
        func_020585d4(pp,3,1); return 3;
    }
    n=o->head; update=o->active;
    for(;n;n=n->next) {
        if(n->key==key && n->kind==0x65) {
            if(!found) found=func_0205d6f8((char **)pp,key);
            n->kind=0x66; update=1;
        }
    }
    if(!found && o->active) found=func_0205d6f8((char **)pp,key);
    if(update) {
        func_020453b4(((Item *)found)->x18);
        ((Item *)found)->x18=0;
        ((Item *)found)->x18=func_020552dc(buf);
    }
    if(o->active) func_02059e5c(pp,(void *)found,&src);
    callback=item->callback;
    if(callback.a) {
        dst=func_020453e8(0x204);
        if(!dst) { func_0205ffc0((int *)pp,(int)data_02100780); return 1; }
        func_0205b7a8(&src,dst);
        dst->kind=0; dst->key=key;
        result=func_02058528(pp,callback,(int)dst,item,0);
        if(result) return result;
    }
    func_0205bd58(pp,item);
    return 0;
}







