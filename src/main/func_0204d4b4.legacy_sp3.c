extern void *func_020498f0(void);
extern void func_0204b034(int keep_start);
extern int func_0204b300(void);
typedef struct Mgr Mgr;
extern void func_020673dc(Mgr *m);
extern int func_0204ead0(int, int, int, int, int *, int);
#define W(p,o) (*(int *)((char *)(p)+(o)))
#define H(p,o) (*(unsigned short *)((char *)(p)+(o)))
#define B(p,o) (*(unsigned char *)((char *)(p)+(o)))
typedef struct { char pad[0x24]; int arr24[32]; unsigned short arra4[40]; int arrf4[48]; } Obj;
int func_0204d4b4(int a, int b, int c) {
    int args[2];
    int i;
    int result;
    void *p, *q, *t;
    if (B(func_020498f0(),0x17) != 0) {
        if (a == W(func_020498f0(),0x20)) return 0;
    }
    B(func_020498f0(),0x17) = 1;
    W(func_020498f0(),0x20) = a;
    W(func_020498f0(),0x1bc) = 0;
    W(func_020498f0(),0x1c8) = 0;
    func_020673dc(*(Mgr **)((char *)func_020498f0()+0x10));
    W(func_020498f0(),0x204) = 0;
    p = func_020498f0();
    W((char *)p + (B(func_020498f0(),0x14)+1)*4,0xf4) = a;
    p = func_020498f0();
    W((char *)p + (B(func_020498f0(),0x14)+1)*4,0x24) = b;
    p = func_020498f0();
    H((char *)p + (B(func_020498f0(),0x14)+1)*2,0xa4) = c;
    W(func_020498f0(),0x1b8) = b;
    H(func_020498f0(),0x1b4) = c;
    p = func_020498f0();
    q = func_020498f0();
    B((char *)p + (B(q,0x14)+1),0x2d0) = func_0204b300();
    args[0] = a;
    p = func_020498f0();
    args[1] = B((char *)p + (B(func_020498f0(),0x14)+1),0x2d0);
    for (i = 1; i <= B(func_020498f0(),0x14); i++) {
        p = func_020498f0();
        q = func_020498f0();
        t = func_020498f0();
        result = func_0204ead0(7,((Obj *)p)->arrf4[i],((Obj *)q)->arr24[i],((Obj *)t)->arra4[i],args,2);
        if (result != 0) return result;
    }
    func_0204b034(1);
    return 0;
}


