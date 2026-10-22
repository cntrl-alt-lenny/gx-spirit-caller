typedef struct { int scale; int mode; int unused[2]; void *entry; } Record;
typedef struct { char pad[0x54]; int state; int timer; char pad2[0x34]; int selected; char pad3[8]; int flag9c; int flaga0; } State;
extern State data_ov004_0220b500;
extern int data_ov004_0220e500[];
extern int func_0202c0c0(int id);
extern void func_ov004_021c9dd4(void *, void *, int, int);
extern void func_ov004_021c9ef0(void *selfv);
extern void func_ov004_021ca0a4(Record *self, int a, int x, int y, void *p, int index);
extern void func_ov004_021d6f20(int a, int b, int c);
extern void func_ov004_021d71ec(void);
extern void func_ov004_021d7440(int arg0);
extern void func_ov004_021d7564(void);
extern void func_ov004_021d7c84(void);
extern void func_ov004_021d7f2c(void);
#define F(o) (*(int *)((char *)b + (o)))
int func_ov004_021d83b0(void) {
    State *b = &data_ov004_0220b500;
    int i;
    int v;
    F(0xa0) = 0;
    F(0x9c) = 0;
    data_ov004_0220e500[0x323] = 0;
    switch (F(0x54)) {
    case 2:
        F(0x58) += 8;
        if (F(0x58) >= 0x100) { F(0x54) = 3; F(0x58) = 0; }
        break;
    case 3:
        func_ov004_021c9ef0((void *)0xe1);
        func_ov004_021d7c84();
        break;
    case 4:
        F(0x58) += 8;
        if (F(0x58) >= 0x100) { F(0x54) = 0; F(0x58) = 0; }
        break;
    case 5:
        F(0x58) += 8;
        if (F(0x58) == -0x40) {
            for (i = 0; i < 3; i++)
                func_ov004_021d6f20(i, func_0202c0c0(i + 0x3c4), 0xc0);
        }
        if (F(0x58) == 0x40) func_ov004_021d7440(-1);
        F(0x90) = -1;
        if (F(0x58) == 0) F(0x54) = 3;
        else if (F(0x58) >= 0x100) { F(0x54) = 6; F(0x58) = 0; }
        break;
    case 6:
        func_ov004_021c9ef0((void *)0xe0);
        func_ov004_021d7f2c();
        break;
    }
    func_ov004_021d71ec();
    func_ov004_021d7564();
    switch (F(0x54)) {
    case 0: case 1: v = 0x100; break;
    case 2: v = 0x100 - F(0x58); break;
    case 4: v = F(0x58); break;
    default: v = 0; break;
    }
    func_ov004_021ca0a4((Record *)((char *)b + 0x5f90), 2, 0xe0, 0xa4 + (v * 0x20) / 0x100, (void *)2, 0xc + (F(0xa0) == 1));
    switch (F(0x54)) {
    case 5:
        v = F(0x58);
        if (v < 0) v = -v;
        *(volatile int *)0x0400101c = -v & 0x1ff;
        break;
    case 6: *(volatile int *)0x0400101c = 0x100; break;
    default: *(volatile int *)0x0400101c = 0; break;
    }
    func_ov004_021c9dd4((void *)0x05000638, (char *)b + 0x5ef0, 4, 0x00600100);
    return 0;
}


