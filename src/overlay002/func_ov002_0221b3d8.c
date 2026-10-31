typedef unsigned short u16;
struct node {
    u16 kind;
    u16 owner:1; u16 slot:5; u16 rest:10;
    u16 pad4;
    u16 count;
    u16 arr8[5];
    u16 f18;
};
struct Node;
struct State { char pad[0x5a8]; int state; };
struct Saved { char pad[0xd44]; int value; };
struct Ready { char pad[0xb2]; u16 value; };
extern struct State data_ov002_022ce288;
extern int data_ov002_022cd744[];
extern struct Saved data_ov002_022d016c;
extern struct Ready data_ov002_022d0e6c;
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern unsigned int func_ov002_021b00d0(unsigned int x);
extern int func_ov002_021ae664(int x);
extern void func_ov002_0226b22c(int arg0, int arg1, int arg2, int arg3);
/* This caller forwards r1; the current callee C definition consumes only r0. */
extern int func_ov002_0220e74c(void *x, int arg);
int func_ov002_0221b3d8(struct node *self, int arg) {
    int pair;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_0223df38((struct Node *)self, 0, 0)) {
            pair = func_ov002_0223de94(self, 0);
            if (func_ov002_0225764c((int)self, (unsigned char)pair, (unsigned char)((u16)pair >> 8))) {
                if (data_ov002_022cd744[self->owner] == 1)
                    data_ov002_022d016c.value = func_ov002_021b00d0(2);
                else
                    func_ov002_021ae664(0x38);
                return 0x7f;
            }
        }
        return 0;
    case 0x7f:
        func_ov002_0226b22c(self->owner, self->slot, 1, data_ov002_022d016c.value);
        return 0x7e;
    case 0x7e:
        if (data_ov002_022d0e6c.value == 0) return 0;
        return func_ov002_0220e74c(self, arg);
    }
    return 0;
}


