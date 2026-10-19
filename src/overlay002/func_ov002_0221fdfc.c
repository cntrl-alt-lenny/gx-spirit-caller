struct Card { unsigned short id; unsigned short side : 1; unsigned short rest : 15; };
struct State { char pad[0x5a8]; int mode; };
struct Packed { unsigned int low : 13; unsigned int flag : 1; unsigned int middle : 8; unsigned int index : 8; unsigned int high : 2; };
extern struct State data_ov002_022ce288;
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern int *func_ov002_021afb74(void);
extern void func_ov002_021e1870(int arg0, int idx, int arg2);
extern int func_ov002_021e286c(int arg0);
extern void func_ov002_02244fe4(int a, int b);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0226b054(int arg0);
int func_ov002_0221fdfc(struct Card *c) {
    struct Packed *p;
    switch (data_ov002_022ce288.mode) {
    case 0x80:
        if (func_ov002_0225368c(c->side, c->id, 0) == 0) {
            func_ov002_021ae400(c->side, 0xd);
            return 0x7e;
        } else {
            func_ov002_021af9d0(c->side, 6, c->id, 0);
            return 0x7f;
        }
    case 0x7f:
        p = (struct Packed *)func_ov002_021afb74();
        func_ov002_021e1870(c->side, ((struct Packed *)func_ov002_021afb74())->index * 2 + p->flag, 0);
        return 0x7d;
    case 0x7e:
        func_ov002_0226b054(1 - c->side);
        return 0x7d;
    case 0x7d:
        func_ov002_021e286c(c->side);
        func_ov002_02244fe4(0x24, 0);
        return 0;
    }
    return 0;
}
