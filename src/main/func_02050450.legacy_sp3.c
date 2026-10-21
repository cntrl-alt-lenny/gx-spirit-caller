extern void *func_020498f0(void);
extern int func_0204682c(void);
extern void *func_020467e4(int i);
extern void *func_02046760(int i);
extern void func_02050054(void *a0, void *a1);
extern void func_02050118(void);
extern void func_0204c40c(int state);
extern int func_020acca0(char *s, int end, int base);
/* Thunk source signatures omit forwarded arguments and the 62790 return. */
extern void func_02062784(void *p, char *msg, int code);
extern int func_02062790(void *p, void *src);
typedef struct { char pad[0x40]; int field_40; } Obj020624cc;
extern void func_020624cc(Obj020624cc *self, int val);
extern char data_020ffa60[], data_020ffa6c[], data_020ffa78[];
#define BYTE(p,n) (*(unsigned char *)((char *)(p)+(n)))
#define HALF(p,n) (*(unsigned short *)((char *)(p)+(n)))
#define WORD(p,n) (*(int *)((char *)(p)+(n)))
void func_02050450(int unused, Obj020624cc *obj, int a, int b, int amount, char *text) {
    int slot;
    void *base;
    void *other;
    int value;
    void *entry;
    void *ptr;
    if (!func_020498f0() || WORD(func_020498f0(),0x1a0) != 7 || BYTE(func_020498f0(),0x1a9) != 0) {
        func_02062784(obj,data_020ffa60,-1);
        return;
    }
    slot = func_0204682c();
    if (slot == -1) {
        func_02062784(obj,data_020ffa6c,-1);
        func_02050054((void *)6,(void *)0xfffeabc4);
        return;
    }
    base = func_020498f0();
    if (a != WORD((char *)base + BYTE(func_020498f0(),0xd)*4,0x210) ||
        (base = func_020498f0(), b != HALF((char *)base + BYTE(func_020498f0(),0xd)*2,0x290))) {
        if (*(unsigned char *)text != 0 && (value = func_020acca0(text,0,10), other = func_020498f0(), value == WORD((char *)other + BYTE(func_020498f0(),0xd)*4,0xf4))) {
                base = func_020498f0();
                WORD((char *)base + BYTE(func_020498f0(),0xd)*4,0x210) = a;
                base = func_020498f0();
                HALF((char *)base + BYTE(func_020498f0(),0xd)*2,0x290) = b;
        } else {
            func_02062784(obj,data_020ffa78,-1);
            return;
        }
    }
    base = func_020498f0();
    WORD(base,0x18c) = 0;
    WORD(base,0x190) = 0;
    if (!func_02062790(obj,*(void **)((char *)func_020498f0()+8))) {
        func_02050054((void *)6,(void *)0xfffec5e6);
        return;
    }
    func_02050118();
    if (BYTE(func_020498f0(),0xd) == 0) {
        value = amount >> 1;
        if (value >= 0xffff) value = 0xffff;
        HALF(func_020498f0(),0x1b0) = value;
    }
    ptr = func_020467e4(slot);
    entry = func_02046760(slot);
    *(Obj020624cc **)ptr = obj;
    base = func_020498f0();
    BYTE(base,0xd)++;
    BYTE(entry,0) = slot;
    base = func_020498f0();
    BYTE(entry,1) = BYTE((char *)base + (BYTE(func_020498f0(),0xd)-1),0x2d0);
    HALF(entry,2) = 0;
    WORD(entry,4) = 0;
    func_020624cc(obj,(int)entry);
    func_0204c40c(2);
}

