typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { int index; u16 first,last,previous,other,pad0c,saved; int pad10; int active; } State;
extern char data_ov020_021ae0a8[];
extern char data_ov020_021ae0e8[];
extern void func_0207ec68(State *s);
extern void func_0207ed94(State *s);
extern int func_0207f05c(State *s, void *p, u16 n);
extern int func_ov020_021ab81c(int a0, int *a1);
extern void func_0208c940(void);
extern int func_020b3870(int numerator, int denominator);
extern void func_0208c884(unsigned short *a0, int a1);
extern int func_020373cc(int a, int b, int c, int d);
int func_ov020_021ac4fc(void) {
    int i;
    char *base = data_ov020_021ae0a8;
    int result = 0;
    char *p = data_ov020_021ae0e8;
    int ptrs[2];
    int counts[2] = {0, 0};
    char *p2;
    char *q;
    int value;
    int j;
    for (i = 0; i < 2; p += 0x41c, i++) {
        func_0207ed94((State *)p);
        func_0207ec68((State *)p);
    }
    ptrs[0] = (int)(base + 0x5c);
    ptrs[1] = (int)(base + 0x478);
    counts[0] += func_ov020_021ab81c((int)(base + 0x40), ptrs);
    p2 = base + 0x5c;
    q = base + 0x40;
    for (j = 0; j < 2; p2 += 0x41c, q += 0x41c, j++) {
        if (counts[j] > 0) func_0207f05c((State *)q, p2, (u16)counts[j]);
    }
    *(volatile u32 *)0x04000000 = (*(volatile u32 *)0x04000000 & ~0x1f00) | 0x1b00;
    *(volatile u16 *)0x04000008 = (*(volatile u16 *)0x04000008 & ~3) | 1;
    *(volatile u16 *)0x0400000a = (*(volatile u16 *)0x0400000a & ~3) | 2;
    *(volatile u16 *)0x0400000c = *(volatile u16 *)0x0400000c & ~3;
    *(volatile u16 *)0x0400000e = (*(volatile u16 *)0x0400000e & ~3) | 3;
    *(volatile u32 *)0x04001000 = (*(volatile u32 *)0x04001000 & ~0x1f00) | 0x1900;
    *(volatile u16 *)0x04001008 = *(volatile u16 *)0x04001008 & ~3;
    *(volatile u16 *)0x0400100a = (*(volatile u16 *)0x0400100a & ~3) | 1;
    *(volatile u16 *)0x0400100c = (*(volatile u16 *)0x0400100c & ~3) | 2;
    *(volatile u16 *)0x0400100e = (*(volatile u16 *)0x0400100e & ~3) | 3;
    func_0208c940();
    *(volatile u32 *)0x04001000 |= 0x10000;
    *(int *)(base + 0x87c) -= 0x1000;
    if (*(int *)(base + 0x87c) < 0) *(int *)(base + 0x87c) = 0;
    value = func_020b3870(-(*(int *)(base + 0x87c) << 4), *(int *)(base + 0x878));
    func_0208c884((u16 *)0x0400006c, value);
    func_0208c884((u16 *)0x0400106c, value);
    if (*(int *)(base + 0x87c) == 0) {
        func_0208c884((u16 *)0x0400006c, 0);
        func_0208c884((u16 *)0x0400106c, 0);
        *(int *)base = 1;
        func_020373cc(0x1b, 1, 0, -1);
        result = 1;
    }
    return result;
}



