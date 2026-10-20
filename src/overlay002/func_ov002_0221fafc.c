struct Card { unsigned short id; unsigned short side : 1; unsigned short rest : 15; };
struct State { char pad[0x5a8]; int mode; };
extern struct State data_ov002_022ce288;
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021bc618(int arg0);
/* Original passes only the side; the C thunk has four parameters. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021e27c0(int self_thing, int arg1);
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0226b054(int arg0);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
int func_ov002_0221fafc(struct Card *self) {
    switch (data_ov002_022ce288.mode) {
    case 0x80:
        if (func_ov002_021bc618(self->side) == 0) return 0;
        if (func_ov002_021ca2b8(self->side) == 0) return 0;
        if (func_ov002_0225368c(self->side, self->id, 0) == 0) {
            func_ov002_021ae400(self->side, 0xd);
            return 0x6e;
        } else {
            func_ov002_021ae400(self->side, 0x11d);
            return 0x7f;
        }
    case 0x7f:
        func_ov002_021af9d0(self->side, 6, self->id, 0);
        return 0x7e;
    case 0x7e:
        func_ov002_0227adb8(self->side, (int)func_ov002_021afb74(), 1, 0);
        return 0x64;
    case 0x6e:
        func_ov002_021e27c0(self->side, 1);
        return 0x6d;
    case 0x6d:
        func_ov002_0226b054(1 - self->side);
        return 0x6c;
    case 0x6c:
        func_ov002_021e27c0(self->side, 0);
        return 0x64;
    case 0x64:
        func_ov002_021e286c(self->side);
        return 0;
    }
    return 0;
}

