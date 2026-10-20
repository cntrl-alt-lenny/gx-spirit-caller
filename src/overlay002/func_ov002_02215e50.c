typedef unsigned short u16;
typedef unsigned char u8;
struct node;
struct Node;
struct Obj { u16 id; u16 side:1; u16 rest:15; u16 a:2; u16 skip:1; u16 b:13; };
extern char data_ov002_022ce288[];
extern char data_ov002_022d016c[];
extern char data_ov002_022d0e6c[];
extern int data_ov002_022cd3f4[];
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
/* This caller supplies r1 as an extra argument to the one-argument C callee. */
extern int func_ov002_022016bc(void *arg0, int arg1);
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, u16 arg4);
extern void func_ov002_0226b11c(int unused0, int unused1);
extern int func_ov002_021be384(int a0, int a1, int a2);
extern void func_ov002_021d479c(u16 a0, u16 a1, u16 a2, u16 a3);
extern int func_ov002_0226b204(unsigned int arg);
int func_ov002_02215e50(struct Obj *p, int arg1) {
    int x, y;
    int pair = func_ov002_0223de94((struct node *)p, 0);
    x = (u8)pair;
    y = (u8)((u16)pair >> 8);
    if (p->skip) return 0;
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        if (func_ov002_022016bc(p, arg1) == 0) return 0;
        if (*(unsigned int *)(data_ov002_022d016c + 0xd0) & 1) return 0;
        if (!((*(unsigned int *)(data_ov002_022d016c + 0xd0) >> 1) & 1)) return 0;
        if (func_ov002_0223df38((struct Node *)p, 0, 0) == 0) return 0;
        if (func_ov002_0225764c((int)p, x, y) == 0) return 0;
        func_ov002_021d59cc(x, y, p->id, 1, p->side);
        func_ov002_0226b11c(x, y);
        return 0x7f;
    case 0x7f:
        if (*(u16 *)(data_ov002_022d0e6c + 0xb0) == 0xffff) return 0;
        if (func_ov002_021be384(data_ov002_022cd3f4[0], data_ov002_022cd3f4[7], 0) == 0) return 0;
        func_ov002_021d479c((u16)((1 - p->side ? 0x8000 : 0) | 0x19), (u16)data_ov002_022cd3f4[7], *(u16 *)(data_ov002_022d0e6c + 0xb0), p->side);
        return 0x7e;
    case 0x7e:
        func_ov002_0226b204(1);
        return 0;
    }
    return 0;
}


