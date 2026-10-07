typedef struct {
    unsigned short a : 6;
    unsigned short pad : 2;
    unsigned short b : 6;
} Win;

typedef struct {
    unsigned int cnt;
    char pad4[0x44];
    Win w48;
    Win w4a;
    char pad4c[4];
    unsigned short h50;
} EngA;

typedef struct {
    Win w48;
    Win w4a;
    char pad4[4];
    unsigned short h8;
} EngB;

extern void func_0208c884(unsigned int *addr, int v);

int func_0202a998(void) {
    EngA *a;
    EngB *b;
    func_0208c884((unsigned int *)0x0400006c, 0);
    func_0208c884((unsigned int *)0x0400106c, 0);
    a = (EngA *)0x4000000;
    a->cnt &= ~0xe000;
    *(unsigned int *)0x4001000 &= ~0xe000;
    b = (EngB *)0x4001048;
    a->w48.a = 0x20;
    a->w48.b = 0x20;
    a->w4a.a = 0x20;
    b->w48.a = 0x20;
    b->w48.b = 0x20;
    b->w4a.a = 0x20;
    a->h50 = 0;
    b->h8 = 0;
    return 1;
}
