typedef unsigned short u16;
extern int func_ov002_021bae7c(int, int, int);
extern void func_ov002_021df680(int, int);
extern int func_ov002_021df938(int, int, int, int);
extern void func_ov002_021d479c(u16, u16, u16, u16);
extern void func_ov002_02244fe4(int, unsigned int);
extern void func_ov002_022538bc(int, int, int);
typedef union {
    unsigned int packed;
    struct { unsigned int amount:16; unsigned int side:1; unsigned int unused:15; } bits;
} Event;
void func_ov002_021e05fc(int side, int amount) {
    int other;
    int v;
    Event event;
    if (amount == 0) return;
    other = 1 - side;
    if (func_ov002_021bae7c(other, 0x1256, -1) != 0) {
        func_ov002_021df680(other, 0x1256);
        func_ov002_021df938(side, amount, 1, 0x1256);
        return;
    }
    if (amount > 0xffff) amount = 0xffff;
    v = side != 0 ? 0x8000 : 0;
    func_ov002_021d479c((u16)(v | 0x24), (u16)amount, 4, 0);
    event.bits.side = side;
    event.bits.amount = amount;
    func_ov002_02244fe4(0x11, event.packed);
    func_ov002_022538bc(side, 0x144d, 1);
}
