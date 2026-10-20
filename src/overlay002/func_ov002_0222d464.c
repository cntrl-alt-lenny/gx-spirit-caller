typedef unsigned short u16;
struct Obj { u16 id; u16 pad[3]; u16 values[2]; };
struct State { char pad[0x5a8]; int state; int count; };
struct Player { char pad[0xcec]; int side; };
struct Result { char pad[0xb2]; u16 value; };
extern struct State data_ov002_022ce288;
extern struct Player data_ov002_022d016c;
extern struct Result data_ov002_022d0e6c;
extern int func_ov002_021b9b64(int unused0);
/* Original caller supplies only r0 and r1 to the four-argument thunk. */
extern int func_ov002_021d8288();
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0226b054(int arg0);
extern int func_ov002_0226b194(int arg0, int arg1, int arg2);
int func_ov002_0222d464(struct Obj *self) {
    int state = data_ov002_022ce288.state;
    int side = data_ov002_022d016c.side ^ data_ov002_022ce288.count;
    switch (state) {
    case 0x80:
        data_ov002_022ce288.count = 0;
        self->values[0] = 0;
        self->values[1] = 0;
        return 0x7f;
    case 0x7f:
        if (func_ov002_0225368c(side, self->id, 0) == 0) return 0x79;
        func_ov002_0226b194(side, self->id, 0);
        return 0x7e;
    case 0x7e:
        self->values[side] = data_ov002_022d0e6c.value;
        return 0x78;
    case 0x79:
        func_ov002_0226b054(1 - side);
        return 0x78;
    case 0x78:
        if (++data_ov002_022ce288.count < 2) return 0x7f;
        data_ov002_022ce288.count = 0;
        return 0x77;
    case 0x77:
        if (self->values[side] != 0) {
            func_ov002_021d8288(side, func_ov002_021b9b64(self->values[side]));
        }
        return ++data_ov002_022ce288.count < 2 ? 0x77 : 0x6e;
    case 0x6e:
        func_ov002_021e286c(data_ov002_022d016c.side);
        func_ov002_021e286c(1 - data_ov002_022d016c.side);
        return 0;
    default:
        return 0;
    }
}

