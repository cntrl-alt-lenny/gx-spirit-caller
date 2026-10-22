typedef struct {
    unsigned short w0;
    unsigned short bit0:1, pad1:13, bit14:1, pad15:1;
} S021ff3bc;
struct Card { unsigned int id:13, rest:19; };
extern char data_ov002_022ce288[];
extern int data_ov002_022cd73c[];
extern int func_0202eab0(int unused0);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int player, int phase, int card, int arg);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021b0c04(int self, int arg1);
extern int func_ov002_021bc6c4(int arg0);
extern int func_ov002_021e27c0(int self_thing, int arg1);
extern int func_ov002_021e286c(int arg0);
/* The original passes only the object to this callee with an unused second parameter. */
extern int func_ov002_021ff3bc();
extern int func_ov002_0223f6c4(S021ff3bc *self);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0226b054(int arg0);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
int func_ov002_02211b64(S021ff3bc *self, int arg1) {
    int player = self->bit0 ^ self->bit14;
    int flag;
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        if (func_ov002_021ff3bc(self, arg1) == 0) return 0;
        if (self->w0 == 0x17f5) {
            if (func_ov002_0223f6c4(self) == 0) return 0;
        }
        if (func_ov002_0225368c(player, self->w0, func_ov002_0223f6c4(self)) == 0) {
            func_ov002_021ae400(player, 0x122);
            return 0x78;
        }
        func_ov002_021ae400(player, 0x11d);
        return 0x7f;
    case 0x7f:
        func_ov002_021af9d0(player, 6, self->w0, func_ov002_0223f6c4(self));
        return 0x7e;
    case 0x7e:
        flag = 0;
        switch (self->w0) {
        case 0x10e4:
            if ((((struct Card *)func_ov002_021afb74())->id) == 0xfe5) flag = 1;
            break;
        case 0x1529: case 0x1642: case 0x165a: case 0x167d:
        case 0x17af: case 0x17c9: case 0x17d3: case 0x17da:
        case 0x1814: case 0x1817: case 0x187e: case 0x18a3:
        case 0x1907: case 0x195c: case 0x19b1: case 0x19b5: case 0x19d8:
            flag = 1;
            break;
        }
        if (player == data_ov002_022cd73c[1]) {
            if (func_0202eab0(((struct Card *)func_ov002_021afb74())->id) != 0)
                func_ov002_021b0c04(0x32, 1);
        }
        *(int *)(data_ov002_022ce288 + 0x5ac) = func_ov002_021bc6c4(player);
        func_ov002_0227adb8(player, (int)func_ov002_021afb74(), 1,
            (unsigned short)flag | (self->w0 << 16));
        return 0x7d;
    case 0x7d:
        func_ov002_021e286c(player);
        return 1;
    case 0x78:
        func_ov002_021e27c0(player, 1);
        return 0x77;
    case 0x77:
        func_ov002_0226b054(1-player);
        return 0x76;
    case 0x76:
        func_ov002_021e27c0(player, 0);
        return 0x75;
    case 0x75:
        func_ov002_021e286c(player);
        return 0;
    }
    return 0;
}


