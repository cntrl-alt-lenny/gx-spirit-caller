typedef unsigned short u16;
struct Node;
struct node;
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021dea04(int a, int b, int c);

int func_ov002_02233348(struct Node *self)
{
    int v;
    int lo, hi;
    if (func_ov002_0223df38(self, 0, 0)) {
        v = func_ov002_0223de94((struct node *)self, 0);
        lo = v & 0xff;
        hi = ((u16)v >> 8) & 0xff;
        if (func_ov002_0225764c((int)self, lo, hi)) {
            func_ov002_021dea04((int)self, lo, hi);
        }
    }
    return 0;
}
