typedef unsigned short u16;
struct Node { u16 f0; u16 side:1; u16 index:5; u16 rest:10; char pad[8]; u16 f12; };
struct node { char _pad[8]; u16 arr8[5]; u16 f18; };
extern int func_ov002_021b9e00(int arg0, int arg1);
extern void func_ov002_021d91e0(int a, int b, int c);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
int func_ov002_0222800c(struct Node *self) {
    int packed, a, b;
    if (self->f12 == 0) return 0;
    if (func_ov002_0223df38(self, 0, 0) != 0) {
        packed = func_ov002_0223de94((struct node *)self, 0);
        a = packed & 0xff;
        b = ((u16)packed >> 8) & 0xff;
        if (func_ov002_0225764c((int)self, a, b) != 0) {
            if (func_ov002_021b9e00(self->side, self->index) != 0) {
                func_ov002_021d91e0(self->side, self->index, -1);
                func_ov002_021d91e0(a, b, 1);
            }
        }
    }
    return 0;
}
