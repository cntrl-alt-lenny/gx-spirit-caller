typedef unsigned short u16;
typedef unsigned char u8;
struct node { char pad[8]; u16 arr8[5]; u16 f18; };
struct Node;
struct Self { u16 id; u16 pad[2]; u16 lo:8; u16 count:8; };
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern int func_ov002_021c848c(int a, int b);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
int func_ov002_022214dc(struct Self *self) {
    int a, b;
    int x, y, z, w;
    int first, second;
    if (self->count == 2) {
        a = func_ov002_0223de94((struct node *)self, 0);
        b = func_ov002_0223de94((struct node *)self, 1);
        x = (u8)a;
        y = (u8)((u16)a >> 8);
        z = (u8)b;
        w = (u8)((u16)b >> 8);
        if (func_ov002_0223df38((struct Node *)self, 0, 0) != 0 &&
            func_ov002_0223df38((struct Node *)self, 1, 0) != 0) {
            first = func_ov002_021c848c(x, y);
            second = func_ov002_021c848c(z, w);
            func_ov002_021d59cc(x, y, self->id, 2, (u16)(second > 65535 ? 65535 : second));
            func_ov002_021d59cc(z, w, self->id, 2, (u16)(first > 65535 ? 65535 : first));
        }
    }
    return 0;
}

