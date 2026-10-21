typedef unsigned short u16;
struct Self { u16 id; u16 player:1; u16 :15; u16 pad[2]; u16 masks[2]; u16 value; };
struct node;
struct Node;
struct State { char pad[0x5a8]; int step; int count; };
struct Command { char pad[0xd44]; int ready; char pad2[0x28]; int side; int index; int extra; };
extern struct State data_ov002_022ce288;
extern struct Command data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
/* The original supplies two arguments to these four-argument thunks. */
extern int func_ov002_021c84e0();
extern int func_ov002_02257878();
extern int func_ov002_021e7584(void *arg0, int arg1, int arg2);
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021ae484(int x);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern int func_ov002_021d873c(int arg0, int arg1);
extern int func_ov002_021de9c0(int a, int b);
int func_ov002_02239b68(struct Self *self) {
    switch (data_ov002_022ce288.step) {
    case 0x80: {
        unsigned int result;
        unsigned short half;
        int a, b;
        if (func_ov002_0223df38((struct Node *)self, 0, 0) != 0) {
            result = func_ov002_0223de94((struct node *)self, 0);
            a = result & 0xff;
            half = (unsigned short)result;
            b = (half >> 8) & 0xff;
            if (func_ov002_0225764c((int)self, a, b) != 0) {
                self->masks[1] = 0;
                self->masks[0] = 0;
                self->value = func_ov002_021c84e0(a, b);
                data_ov002_022ce288.count = 0;
                return 0x7f;
            }
        }
        return 0;
    }
    case 0x7f:
        if (func_ov002_02257878((int)self, (int)func_ov002_021e7584) == 0) return 0x7c;
        if (data_ov002_022ce288.count == 0) {
            func_ov002_021ae400(self->player, 0x61);
            data_ov002_022d016c.ready = 1;
        } else {
            if (data_ov002_022cd744[self->player] == 1) data_ov002_022d016c.ready = 1;
            else func_ov002_021ae484(0x75);
        }
        return 0x7e;
    case 0x7e:
        if (data_ov002_022d016c.ready == 0) return 0x7c;
        func_ov002_0225935c(self->player, self->id, (int)func_ov002_021e7584);
        return 0x7d;
    case 0x7d:
        if (func_ov002_022593f4() != 0) {
            int side = data_ov002_022d016c.side;
            int index = data_ov002_022d016c.index + data_ov002_022d016c.extra;
            self->masks[side] |= 1 << index;
            func_ov002_021d873c(side, index);
            data_ov002_022ce288.count++;
            return data_ov002_022ce288.count < 2 ? 0x7f : 0x7c;
        }
        return 0x7f;
    case 0x7c:
        func_ov002_021de9c0((int)self, self->masks[0] | (self->masks[1] << 16));
        return 0;
    }
    return 0;
}
