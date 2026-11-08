typedef unsigned short u16;
typedef unsigned char u8;
struct Self { u16 id; u16 side:1, slot:5, rest:10; u16 pad:6, value:9, tail:1; u16 pad6[3]; u16 state; };
struct Entry { unsigned int id:13, bit:1, rest:8, value:8, tail:2; unsigned int more[4]; };
struct Node;
struct node;
extern char data_ov002_022cf16c[];
/* This caller forwards incoming r1; the callee C definition ignores it. */
extern int func_ov002_0220e74c(void *x, int arg);
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern void func_ov002_021d5f2c(int arg0, int arg1);
int func_ov002_02214738(struct Self *self, int arg) {
    int packed;
    switch (self->state) {
    case 1:
        return func_ov002_0220e74c(self, arg);
    case 2:
    {
        struct Entry *e = (struct Entry *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x30);
        if (self->value != e[self->slot].value * 2 + e[self->slot].bit) return 0;
        if (func_ov002_0223df38((struct Node *)self, 0, 0)) {
            packed = func_ov002_0223de94((struct node *)self, 0);
            int a = packed & 0xff;
            int b = ((u16)packed >> 8) & 0xff;
            if (func_ov002_0225764c((int)self, a, b)) {
                func_ov002_021d5f2c(packed & 0xffff, (u16)((u8)self->side | ((u8)self->slot << 8)));
            }
        }
        return 0;
    }
    }
    return 0;
}





