typedef struct { char pad[0x2c]; int field_2c; } Ctx;
extern void func_ov003_021cedf8(int unused0, int a1, Ctx *self, int a3, int a4, int a5, int a6, int a7, int a8, int a9);
extern int func_02037208(int a0, int a1, int a2, int a3);
extern char data_ov003_021cf6c0[];
extern char data_021040ac[];
extern int data_02104cec[];
typedef struct { int field0; int state; int field8; int timer; char pad[0x14]; Ctx *a; Ctx *b; Ctx *c; } Scene;
void func_ov003_021cec24(Scene *self) {
    int blocked = 0;
    int side = *(int *)(data_ov003_021cf6c0 + 0x50) < 0;
    int mode = data_02104cec[*(int *)(data_021040ac + 0xc3c) ^ side];
    int blink;
    switch (mode) { case 1: case 2: blocked = 1; break; }
    switch (self->state) {
    case 3: blocked = 0; break;
    case 11: break;
    default: return;
    }
    if (blocked) return;
    func_ov003_021cedf8((int)self, 2, self->a, 0, 0x18, 0x90, 1, 0, 0xc00, 0);
    if (self->timer < 360) {
        func_ov003_021cedf8((int)self, 2, self->b, -1, 0x18, 0x90, 0, 0, 0xc00, 0);
    } else {
        if (self->timer % 60 == 0) func_02037208(0x8e, -1, 0, 1);
        blink = (self->timer >> 2) & 1;
        func_ov003_021cedf8((int)self, 2, self->c, -1, 0x18, 0x90, blink, 0, 0xc00, 0);
        func_ov003_021cedf8((int)self, 2, self->b, -1, 0x18, 0x90, 1 - blink, 0, 0xc00, 0);
    }
}

