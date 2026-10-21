typedef unsigned short u16;
struct Obj { u16 id; u16 side:1; u16 index:5; u16 rest:10; u16 pad[4]; u16 result; };
struct State { char pad[0x5b4]; int step; };
struct Pending { char pad[0xd44]; int value; };
extern struct State data_ov002_022ce288;
extern struct Pending data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern int func_ov002_021b9e00(int arg0, int arg1);
extern int func_ov002_022577dc(void *self);
extern void func_ov002_021ae6d0(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_021d91e0(int a, int b, int c);
int func_ov002_021f9dac(struct Obj *self) {
    int i;
    int count;
    switch (data_ov002_022ce288.step) {
    case 0:
        count = func_ov002_021b9e00(self->side, self->index);
        for (i = 1; i < count; i++) {
            self->result = i;
            if (func_ov002_022577dc(self) != 0) break;
        }
        if (data_ov002_022cd744[self->side] == 1)
            data_ov002_022d016c.value = count;
        else
            func_ov002_021ae6d0(0x13d, 0x13e, i, count);
        data_ov002_022ce288.step++;
        return 0;
    case 1:
        self->result = data_ov002_022d016c.value;
        func_ov002_021d91e0(self->side, self->index, -data_ov002_022d016c.value);
        return 1;
    default:
        return 1;
    }
}

