typedef unsigned short u16;
struct Self { u16 id; u16 side:1; u16 rest:15; };
struct State { char pad[0x5b8]; int state; };
struct Request { char pad[0xd70]; int side; int first; int second; };
struct Self02240a10;
extern int data_ov002_022cd744[];
extern struct State data_ov002_022ce288;
extern struct Request data_ov002_022d016c;
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_0223dcc0(struct Self *self, int side, int slot);
extern int func_ov002_02240a10(struct Self02240a10 *self, int arg1, int arg2);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
/* The original caller consumes r0; the recovered callee's void return is incomplete. */
extern int func_ov002_0228c81c(int a, int b, int c, int d, int e);
int func_ov002_02240ab0(struct Self *self) {
    int first, second;
    if (data_ov002_022cd744[self->side] == 1) {
        first = func_ov002_0228c81c((int)self, self->side, -1, -1, -1);
        if (first < 0) return 1;
        func_ov002_0223dcc0(self, self->side, first);
        second = func_ov002_0228c81c((int)self, self->side, -1, -1, first);
        if (second < 0) return 1;
        func_ov002_0223dcc0(self, self->side, second);
        second = func_ov002_0228c81c((int)self, 1-self->side, 1, 0, -1);
        if (second < 0) return 1;
        func_ov002_0223dcc0(self, 1-self->side, second);
        return 1;
    }
    switch (data_ov002_022ce288.state) {
    case 0:
        func_ov002_021ae400(self->side, 0x82);
        func_ov002_0225935c(self->side, self->id, (int)func_ov002_02240a10);
        data_ov002_022ce288.state++;
        return 0;
    case 2:
        func_ov002_021ae400(self->side, 0x83);
        func_ov002_0225935c(self->side, self->id, (int)func_ov002_02240a10);
        data_ov002_022ce288.state++;
        return 0;
    case 4:
        func_ov002_021ae400(self->side, 0x84);
        func_ov002_0225935c(self->side, self->id, (int)func_ov002_02240a10);
        data_ov002_022ce288.state++;
        return 0;
    case 1: case 3: case 5:
        if (func_ov002_022593f4() != 0) {
            func_ov002_0223dcc0(self, data_ov002_022d016c.side, data_ov002_022d016c.first + data_ov002_022d016c.second);
            data_ov002_022ce288.state++;
            return 0;
        } else {
            data_ov002_022ce288.state--;
        }
        return 0;
    }
    return 1;
}

