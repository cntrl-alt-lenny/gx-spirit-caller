extern void *func_020498f0(void);
extern int func_0204682c(void);
extern void *func_020467e4(int i);
extern void *func_02046760(int i);
extern int func_0204a8bc(int code);
extern int func_0204cc20(int a0);
extern void func_02050054(void *a0, void *a1);
extern void func_0204c40c(int state);
typedef struct { char pad[0x40]; int field_40; } Obj020624cc;
extern void func_020624cc(Obj020624cc *self, int val);
extern char *func_02064f84(unsigned int addr, int port, char *buf);
extern int func_02062600(void *obj, void *out, char *addr, char *text, int a, int timeout, void *arg, int flag);
extern int OS_SNPrintf(char *buf, unsigned int len, const char *fmt, ...);
extern char data_020ff968[];
typedef struct { char pad[0x14]; volatile unsigned char index; char pad2[0x1fb]; unsigned int ips[32]; unsigned short ports[32]; } Context;
#define B(p,n) (*(unsigned char *)((char *)(p)+(n)))
#define H(p,n) (*(unsigned short *)((char *)(p)+(n)))
#define W(p,n) (*(int *)((char *)(p)+(n)))
#define P(p,n) (*(void **)((char *)(p)+(n)))
void func_020501cc(Obj020624cc *obj, int action) {
    char buf[12];
    void *base;
    void *a;
    void *b;
    void *c;
    char *addr;
    int result;
    int slot;
    void *entry;
    void *ptr;
    void *d;
    unsigned int ip;
    int port;
    int ix, iy;
    if (!func_020498f0()) return;
    if (W(func_020498f0(),0x1a0) != 7 && W(func_020498f0(),0x1a0) != 12) return;
    if (action != 0) {
        if (action == 5) {
        return;
    } else if (action == 6) {
        base = func_020498f0();
        B(base,0xc)++;
        if (B(func_020498f0(),0xc) > 5) {
            B(func_020498f0(),0xc) = 0;
            base = func_020498f0();
            func_0204cc20(W((char *)base + B(func_020498f0(),0x14)*4,0xf4));
            return;
        }
        OS_SNPrintf(buf,12,data_020ff968,W(func_020498f0(),0x200));
        base = func_020498f0();
        a = func_020498f0();
        b = func_020498f0();
        c = func_020498f0();
        d = func_020498f0();
        addr = func_02064f84(W((char *)a + ((Context *)b)->index*4,0x210),H((char *)c + ((Context *)d)->index*2,0x290),0);
        result = func_02062600(*(void **)P(base,4),0,addr,buf,-1,5000,P(func_020498f0(),8),0);
        if (result == 1) {
            func_0204a8bc(result);
            return;
        }
        if (result == 0) return;
        base = func_020498f0();
        if (func_0204cc20(W((char *)base + B(func_020498f0(),0x14)*4,0xf4)) == 0) return;
    } else {
        base = func_020498f0();
        if (func_0204cc20(W((char *)base + (B(func_020498f0(),0xd)+1)*4,0xf4)) == 0) return;
    }    } else {
        slot = func_0204682c();
        if (slot == -1) {
            func_02050054((void *)6,(void *)0xfffeabc4);
            return;
        }
        ptr = func_020467e4(slot);
        entry = func_02046760(slot);
        *(Obj020624cc **)ptr = obj;
        base = func_020498f0();
        B(base,0xd)++;
        B(entry,0) = slot;
        H(entry,2) = 0;
        W(entry,4) = 0;
        base = func_020498f0();
        B(entry,1) = B((char *)base + B(func_020498f0(),0xd),0x2d0);
        func_020624cc(obj,(int)entry);
        if (W(func_020498f0(),0x1a0) == 12) {
            func_0204c40c(0);
            return;
        }
        func_0204c40c(1);
    }
}













