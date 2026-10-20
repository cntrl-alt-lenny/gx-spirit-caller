struct Arg { unsigned short id; unsigned short side:1; unsigned short rest:15; };
struct Global { char pad[0x5a8]; int state; };
struct Mode { char pad[0xd44]; int value; };
struct Record { unsigned int card:13; unsigned int bit:1; unsigned int pad:8; unsigned int value:8; unsigned int top:2; };
extern struct Global data_ov002_022ce288;
extern struct Mode data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021ae638(int p, unsigned int b, unsigned int c);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021bc618(int arg0);
/* This call supplies only r0; the thunk definition has four parameters. */
extern int func_ov002_021ca2b8();
extern int func_ov002_0220e518(void *self);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0227ac64(int a, struct Record *b, int c, int d, unsigned int e);
int func_ov002_02236d58(struct Arg *p) {
    struct Record *r;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        return func_ov002_0220e518(p) != 0 ? 0x7f : 0;
    case 0x7f:
        if (func_ov002_021bc618(1 - p->side) == 0) return 0;
        if (func_ov002_021ca2b8(p->side) == 0) return 0;
        if (func_ov002_0225368c(p->side, p->id, 0) == 0) return 0;
        func_ov002_021ae400(p->side, 0xf0);
        return 0x7e;
    case 0x7e:
        func_ov002_021af9d0(p->side, 6, p->id, 0);
        return 0x7d;
    case 0x7d:
        if (data_ov002_022cd744[p->side] == 1) {
            data_ov002_022d016c.value = 0;
        } else {
            r = (struct Record *)func_ov002_021afb74();
            func_ov002_021ae638(0xf7, ((struct Record *)func_ov002_021afb74())->value * 2 + r->bit, 1);
        }
        return 0x7c;
    case 0x7c:
        func_ov002_0227ac64(1 - p->side, (struct Record *)func_ov002_021afb74(), 1, data_ov002_022d016c.value, ((unsigned int)p->id << 16) | 0x10);
        break;
    }
    return 0;
}

