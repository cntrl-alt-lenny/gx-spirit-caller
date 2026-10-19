typedef unsigned short u16;
struct Obj {
    u16 card;
    struct { u16 side:1; u16 rest:15; } flags;
    u16 f4;
    struct { u16 low:8; u16 count:8; } f6;
    u16 entries[1];
};
struct State { char pad[0x5b4]; int step; };
struct Packed { unsigned int lo:13; unsigned int flag:1; unsigned int mid:8; unsigned int value:8; unsigned int top:2; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf178[];
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern void func_ov002_021d7a1c(void *arg0, int arg1);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void *func_ov002_021afb90(int i);
extern void *func_ov002_021afbc4(void);
int func_ov002_021f71a0(struct Obj *self) {
    int i;
    switch (data_ov002_022ce288.step) {
    case 0:
        func_ov002_021e2b3c(data_ov002_022ce288.step);
        data_ov002_022ce288.step++;
        return 0;
    case 1: {
        int side = self->flags.side;
        if (*(int *)(data_ov002_022cf178 + (side & 1) * 0x868) != 0) {
            func_ov002_021d7a1c((void *)side, 0);
            return 0;
        }
        func_ov002_021e2c5c(side);
        data_ov002_022ce288.step++;
        return 0;
    }
    case 2:
        func_ov002_0225368c(self->flags.side, self->card, 0);
        for (i = 0; i < (int)func_ov002_021afbc4(); i++) {
            struct Packed *p1 = func_ov002_021afb90(i);
            struct Packed *p2 = func_ov002_021afb90(i);
            self->entries[i] = p2->value * 2 + p1->flag;
        }
        self->f6.count = (u16)(int)func_ov002_021afbc4();
        break;
    }
    return 1;
}
