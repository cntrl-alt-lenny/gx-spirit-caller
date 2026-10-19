typedef unsigned short u16;
typedef unsigned char u8;
typedef struct {
    char pad[0x1c];
    unsigned int a : 8;
    unsigned int b : 8;
} Obj;
typedef struct {
    u16 side : 1;
    u16 kind : 5;
    u16 idx : 8;
    u16 flag : 1;
    u16 flag2 : 1;
} Bits;
extern char data_ov002_022cc310[];
extern void *func_02006c0c(void *a, int b, int c);
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(void *a);
extern void Task_Invoke(void *p);
extern int func_02037208(int a0, int r1, int r2, int r3);
void func_ov002_022a8084(char *self, int side, int kind, int count) {
    unsigned int buf[10];
    Bits bits;
    void *h;
    int n = *(int *)(self + 0x5e4);
    if (count - 1 != n) return;
    bits.side = side;
    bits.kind = kind;
    bits.idx = 0;
    bits.flag = 0;
    bits.flag2 = 0;
    *(Bits *)(self + 0x5c4 + (*(int *)(self + 0x5e4))++ * 2) = bits;
    *(int *)(self + 0x5e8) = 0x10;
    h = func_02006c0c(data_ov002_022cc310, 4, 0);
    func_0201d47c((Obj *)buf);
    *(void **)((u8 *)buf + 0) = h;
    *(u16 *)((u8 *)buf + 0x14) = (*(u16 *)((u8 *)buf + 0x14) & ~0xf) | 9;
    *(int *)((u8 *)buf + 0xc) = 0xb980;
    *(short *)((u8 *)buf + 0x10) = -1;
    func_0201e5b8(buf);
    Task_Invoke(h);
    func_02037208(0x36, -1, 0, 1);
}


