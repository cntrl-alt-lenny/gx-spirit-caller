typedef unsigned short u16;
struct Node { u16 f0; u16 side:1; u16 rest:15; u16 f4; u16 lo:8; u16 hi:8; };
struct node;
struct Ov002Self;
typedef struct { u16 f0; u16 flag0:1; u16 field:5; u16 rest:10; } Card021c1e44;
struct State { char pad[0x5a8]; int mode; };
extern struct State data_ov002_022ce288;
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021d6808(struct Ov002Self *self, int player, int idx, int arg3, int arg4);
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
extern int func_ov002_021bc8c8(int, int, int);
extern int func_ov002_021debe0(int a, int b, int c);
extern int func_ov002_02210810(struct Node *, int);
int func_ov002_02232854(struct Node *self, int arg) {
    int i;
    int pair;
    int lo, hi;
    int ret;
    switch (data_ov002_022ce288.mode) {
    case 0x80:
        for (i = 0; i < self->hi; i++) {
            if (func_ov002_0223df38(self, i, 0)) {
                pair = func_ov002_0223de94((struct node *)self, i);
                if (func_ov002_0225764c((int)self, pair & 0xff, ((u16)pair >> 8) & 0xff) == 0) return 0;
            } else return 0;
        }
        for (i = 0; i < self->hi; i++) {
            pair = func_ov002_0223de94((struct node *)self, i);
            func_ov002_021d6808((struct Ov002Self *)self, pair & 0xff, ((u16)pair >> 8) & 0xff, 0, 0);
        }
        return 0x7f;
    case 0x7f:
        pair = func_ov002_0223de94((struct node *)self, 0);
        lo = pair & 0xff;
        hi = ((u16)pair >> 8) & 0xff;
        if (func_ov002_021c1e44((Card021c1e44 *)self, lo, hi) != 0) return 0;
        if (func_ov002_021bc8c8(self->side, lo, hi) == 0) return 0;
        func_ov002_021debe0((int)self, lo, hi);
        return 0x7e;
    default:
        data_ov002_022ce288.mode += 2;
        ret = func_ov002_02210810(self, arg);
        return ret != 0 ? ret - 2 : 0;
    }
}

