typedef unsigned short u16;
struct node { u16 id; u16 side:1; u16 rest:15; char pad[6]; u16 card; };
struct Node;
struct state { char pad[0x5a8]; int state; };
struct row { unsigned int id:13; unsigned int bit:1; unsigned int pad:8; unsigned int hi:8; unsigned int rest:2; };
extern struct state data_ov002_022ce288;
extern unsigned short func_0202b9b0(unsigned short key);
extern int func_0202e2c8(int unused0);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021bbda8(int a, int b);
extern void func_ov002_021e1870(int arg0, int idx, int arg2);
extern int func_ov002_021e286c(int arg0);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern int func_ov002_0223f6c4(struct node *self);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern void func_ov002_0226b054(int arg0);
int func_ov002_02236228(struct node *self) {
    switch (data_ov002_022ce288.state) {
    case 128: {
        int val, lo, hi;
        if (func_ov002_0223df38((struct Node *)self, 0, 0) != 0) {
            val = func_ov002_0223de94(self, 0);
            lo = val & 0xff;
            hi = (((u16)val) >> 8) & 0xff;
            if (func_ov002_0225764c((int)self, lo, hi) != 0) {
                self->card = func_ov002_021b9ecc(lo, hi);
                val = func_ov002_0223f6c4(self);
                if (func_ov002_0225368c(self->side, self->id, val) == 0) {
                    if (func_0202e2c8(self->card) != 0) return 0;
                    func_ov002_021ae400(self->side, 0xd);
                    return 120;
                } else {
                    func_ov002_021ae400(self->side, 0x3a);
                    return 126;
                }
            }
        }
        return 0;
    }
    case 126: {
        int val = func_ov002_0223f6c4(self);
        func_ov002_021af9d0(self->side, 6, self->id, val);
        return 125;
    }
    case 125: {
        struct row *p = (struct row *)func_ov002_021afb74();
        struct row *q = (struct row *)func_ov002_021afb74();
        func_ov002_021e1870(self->side, q->hi * 2 + p->bit, 0);
        return 100;
    }
    case 120: {
        int count = func_ov002_021bbda8(self->side, self->card);
        if (count < func_0202b9b0(self->card)) func_ov002_0226b054(1 - self->side);
        return 100;
    }
    case 100:
        if (func_0202e2c8(self->card) == 0) func_ov002_021e286c(self->side);
        return 0;
    default: return 0;
    }
}
