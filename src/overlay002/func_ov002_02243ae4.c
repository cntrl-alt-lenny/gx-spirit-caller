typedef unsigned short u16;
struct Self { u16 id; u16 side:1; u16 rest:15; u16 pad; u16 f6; };
struct State { char pad[0x5b8]; int state; };
struct Command { char pad[0xd44]; int flag; char pad2[0x28]; int side; int slot; int extra; };
extern struct State data_ov002_022ce288;
extern struct Command data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021ae484(int x);
extern void func_ov002_0223dcc0(struct Self *self, int side, int slot);
extern int func_ov002_022577dc(void *self);
/* The original supplies only r0/r1 to this four-argument forwarding thunk. */
extern int func_ov002_02257878();
extern int func_ov002_02257ab8(int a, int b);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern int func_ov002_0223fd74(void *arg0, int arg1, int arg2);
int func_ov002_02243ae4(struct Self *self) {
    int limit, message, other;
    int next;
    other = 0;
    switch (self->id) {
    case 0x17e2: limit = 2; message = 0x8d; next = 0x21; break;
    case 0x17ec: limit = 3; other = 1; message = 0x73; next = 0x75; break;
    }
    switch (data_ov002_022ce288.state) {
    case 0:
        if (func_ov002_022577dc(self) == 0) return 1;
        if (other) {
            if (data_ov002_022cd744[self->side] == 1)
                data_ov002_022d016c.flag = 1;
            else
                func_ov002_021ae484(message);
        } else {
            func_ov002_021ae400(self->side, message);
            data_ov002_022d016c.flag = 1;
        }
        data_ov002_022ce288.state++;
        return 0;
    case 1:
    case 4:
        if (data_ov002_022d016c.flag == 0) return 1;
        func_ov002_0225935c(self->side, self->id, (int)func_ov002_0223fd74);
        data_ov002_022ce288.state++;
        return 0;
    case 2:
    case 5:
        if (func_ov002_022593f4() != 0) {
            func_ov002_0223dcc0(self, data_ov002_022d016c.side, data_ov002_022d016c.slot + data_ov002_022d016c.extra);
            if (func_ov002_02257878(self, func_ov002_0223fd74) == 0) return 1;
            if (limit <= (int)((unsigned)self->f6 << 16 >> 24)) return 1;
            data_ov002_022ce288.state = 3;
            return 0;
        }
        data_ov002_022ce288.state -= 2;
        return 0;
    case 3:
        if (data_ov002_022cd744[self->side] == 1) {
            data_ov002_022d016c.flag = func_ov002_02257ab8((int)self, 1 - self->side) > (int)((unsigned)self->f6 << 16 >> 24);
        } else {
            func_ov002_021ae484(next);
        }
        data_ov002_022ce288.state++;
        return 0;
    }
    return 0;
}


