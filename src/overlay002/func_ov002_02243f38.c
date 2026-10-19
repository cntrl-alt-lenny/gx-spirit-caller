typedef unsigned short u16;
struct S0223dad0 { u16 id; u16 side:1; u16 rest:15; char pad[2]; u16 lo:8; u16 hi:8; u16 arr[1]; };
struct GState { char pad[0x5b8]; int state; };
struct GValue { char pad[0xb0]; u16 a; u16 b; };
extern struct GState data_ov002_022ce288;
extern struct GValue data_ov002_022d0e6c;
extern void func_ov002_0223dad0(struct S0223dad0 *self, unsigned short val);
extern void func_ov002_0226b0b0(int arg0, int arg1, int arg2);
extern void func_ov002_0226b0f0(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_0226b158();
int func_ov002_02243f38(struct S0223dad0 *self) {
    switch (data_ov002_022ce288.state) {
    case 0:
        func_ov002_0226b0f0(self->side, self->id, 1, 0xff);
        data_ov002_022ce288.state++;
        return 0;
    case 1:
        func_ov002_0223dad0(self, data_ov002_022d0e6c.b);
        func_ov002_0226b0b0(1 - self->side, 0x171f, data_ov002_022d0e6c.b);
        data_ov002_022ce288.state++;
        return 0;
    case 2:
        func_ov002_0226b158(self->side, self->id);
        data_ov002_022ce288.state++;
        return 0;
    case 3:
        func_ov002_0223dad0(self, data_ov002_022d0e6c.a);
        func_ov002_0226b0b0(1 - self->side, 0x1357, data_ov002_022d0e6c.a);
        data_ov002_022ce288.state++;
        return 0;
    }
    return 1;
}

