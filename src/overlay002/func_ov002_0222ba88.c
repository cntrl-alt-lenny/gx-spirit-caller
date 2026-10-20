typedef unsigned short u16;
struct Self { u16 id; u16 pad[3]; u16 values[4]; };
struct State { char pad[0x5a8]; int mode; int side; };
struct Context { char pad[0xcec]; int side; };
extern struct State data_ov002_022ce288;
extern struct Context data_ov002_022d016c;
extern u16 data_ov002_022d0f1c[];
extern int func_ov002_021b9b64(int unused0);
extern int func_ov002_021bc618(int arg0);
/* Original caller supplies only r0; remaining callee parameters are unused here. */
extern int func_ov002_021ca2b8();
/* Original caller supplies no argument for the unused parameter. */
extern void func_ov002_021e2b3c();
/* Original caller supplies no argument for the unused parameter. */
extern void func_ov002_021e2c5c();
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern int func_ov002_0226b194(int arg0, int arg1, int arg2);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
int func_ov002_0222ba88(u16 *self) {
    int side = data_ov002_022ce288.side;
    switch (data_ov002_022ce288.mode) {
    case 0x80:
        data_ov002_022ce288.side = data_ov002_022d016c.side;
        self[6] = func_ov002_021ca2b8(0);
        self[7] = func_ov002_021ca2b8(1);
        func_ov002_021e2b3c();
        return 0x7f;
    case 0x7f:
        if (((struct Self *)self)->values[side + 2] == 0) return 0x78;
        if (func_ov002_021bc618(side) < func_ov002_0225368c(side, self[0], 0))
            self[5] = func_ov002_021bc618(side);
        else
            self[5] = func_ov002_0225368c(side, self[0], 0);
        if (self[5] == 0) return 0x78;
        return 0x7e;
    case 0x7e:
        func_ov002_0226b194(side, self[0], self[5]);
        self[4] = 0;
        return 0x7d;
    case 0x7d:
        if (self[4] >= self[5]) return 0x78;
        func_ov002_0227adb8(side, func_ov002_021b9b64(data_ov002_022d0f1c[self[4] + 1]), 1, 0);
        self[4]++;
        return 0x7d;
    case 0x78:
        data_ov002_022ce288.side = 1 - side;
        if (data_ov002_022ce288.side != data_ov002_022d016c.side) return 0x7f;
        func_ov002_021e2c5c();
        return 0;
    default: return 0;
    }
}


