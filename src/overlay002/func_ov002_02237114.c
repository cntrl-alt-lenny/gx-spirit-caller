typedef unsigned short u16;
struct Obj { u16 a; u16 b : 1; u16 pad : 15; };
struct Bits { unsigned id : 13; unsigned side : 1; unsigned mid : 8; unsigned hi : 8; unsigned pad : 2; };
struct Row { char pad[0x260]; struct Bits v; char rest[0x604]; };
extern struct Row data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b8c0(int id);
extern int func_ov002_021c988c(int a, int b, int c);
extern int func_ov002_021ca5bc(int a);
extern void func_ov002_021d479c(u16 a, u16 b, u16 c, u16 d);
extern void func_ov002_021d87dc(int a);
extern int func_ov002_021e13f4();
extern void func_ov002_021e276c(void *self, int a, int b, int c);
extern void func_ov002_021e2818(int a);
int func_ov002_02237114(struct Obj *p) {
    int id, n;
    int off = (p->b & 1) * 0x868;
    if (*(int *)(data_ov002_022cf17c + off)) {
        struct Bits *v = &((struct Row *)((char *)data_ov002_022cf16c + off))->v;
        id = v->id;
        n = v->hi * 2 + v->side;
        if (func_ov002_021c988c(p->b, 13, 0) == 0) func_ov002_021e2818(p->b);
        func_ov002_021d87dc(p->b);
        if (func_0202b878(id) == 22 && func_0202b8c0(id) == 0) {
            func_ov002_021e13f4(p->b, 1, 1);
            if (func_ov002_021ca5bc(n)) func_ov002_021e276c((void *)p->b, p->a, 0x21, (u16)n);
        } else {
            func_ov002_021d479c((u16)((p->b ? 0x8000 : 0) | 0x57), 13, (u16)n, 1);
        }
    }
    return 0;
}



