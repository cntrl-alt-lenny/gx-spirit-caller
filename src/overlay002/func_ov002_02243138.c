typedef unsigned short u16;
struct Self { u16 f0; u16 side:1; u16 rest:15; };
struct State { char pad[0x5b8]; int phase; };
struct Command { char pad[0xd44]; int value; };
struct Context { int f0; int side; char pad[0x18]; int index; };
extern struct State data_ov002_022ce288;
extern struct Command data_ov002_022d016c;
extern struct Context data_ov002_022cd3f4;
extern int data_ov002_022cd744[];
extern char data_ov002_022cf1a2[];
struct S0223dad0;
extern void func_ov002_0223dad0(struct S0223dad0 *self, unsigned short val);
extern int func_ov002_0226b0d0(int arg0, int arg1, int arg2);
extern void func_ov002_021ae514(int a, int b, int c, int d, int e, int f);
int func_ov002_02243138(struct Self *self) {
    switch (data_ov002_022ce288.phase) {
    case 0:
        if (data_ov002_022cd744[self->side] == 1) {
            int side = data_ov002_022cd3f4.side;
            if (side == self->side) {
                data_ov002_022d016c.value = 0;
            } else {
                data_ov002_022d016c.value = *(u16 *)(data_ov002_022cf1a2 + (side & 1) * 0x868 + data_ov002_022cd3f4.index * 20);
            }
        } else {
            func_ov002_021ae514(0x7f, 0x198, 0x199, 0, 0, 15);
        }
        data_ov002_022ce288.phase++;
        return 0;
    case 1:
        func_ov002_0223dad0((struct S0223dad0 *)self, (u16)(data_ov002_022d016c.value + 1));
        func_ov002_0226b0d0(1 - self->side, self->f0, data_ov002_022d016c.value);
        return 1;
    }
    return 0;
}
