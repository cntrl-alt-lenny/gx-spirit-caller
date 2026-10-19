typedef unsigned short u16;
extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern int func_ov002_021bae7c(int, int, int);
extern void func_ov002_021d479c(u16, u16, u16, u16);
extern void func_ov002_022562f0(int);
extern void func_ov002_02244fe4(int, unsigned int);
typedef union {
    unsigned int packed;
    struct { unsigned int amount:16; unsigned int side:1; unsigned int unused:15; } bits;
} Event;
int func_ov002_021df938(int side, int amount, int check, int card) {
    int v;
    Event event;
    if (amount == 0) return 0;
    if (check != 0) {
        if (func_ov002_021b3ecc(side, 11, 0x1805) != 0) return 0;
    }
    if (func_ov002_021b3ecc(side, 11, 0x1850) != 0) return 0;
    if (func_ov002_021b3ecc(side, 11, 0x1a06) != 0) return 0;
    if (func_ov002_021bae7c(side, 0x18c4, -1) != 0) return 0;
    if (amount > 0xffff) amount = 0xffff;
    v = side != 0 ? 0x8000 : 0;
    func_ov002_021d479c((u16)(v | 0x25), (u16)amount, 0, (u16)card);
    if (card != 0x159b) func_ov002_022562f0(side);
    event.bits.side = side;
    event.bits.amount = amount;
    func_ov002_02244fe4(0x10, event.packed);
    return 1;
}

