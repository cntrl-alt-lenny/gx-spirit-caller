typedef unsigned short u16;
struct Self { u16 f0; u16 b0:1; u16 rest:15; };
struct Card { unsigned int id:13; unsigned int owner:1; unsigned int rest:18; };
extern int func_ov002_022806a4(int a, int b, int c);
extern int *func_ov002_021afb74(void);
extern void func_ov002_02280a1c(int player, int *a, int *b, int flag);
extern int func_0202b8f0(int unused0);
extern int func_0202de9c(int unused0);
extern int func_0202f9e8(int id);
extern int func_ov002_0227d27c(int id);
int func_ov002_022932c0(struct Self *self) {
    struct Card *p;
    int id;
    int a, b;
    int max;
    if (func_ov002_022806a4(self->b0, self->f0, 0) >= 0) {
        p = (struct Card *)func_ov002_021afb74();
        id = p->id;
        func_ov002_02280a1c(1-self->b0, &a, &b, 0);
        if (func_0202b8f0(id) > 0x6a4 &&
            func_0202b8f0(id) > (a > b ? a : b) ||
            func_0202de9c(id) != 0 && func_0202f9e8(id) == 0) {
            if (p->owner != self->b0) {
                if (func_ov002_0227d27c(id) != 0) return 0;
            }
            return 1;
        }
    }
    return 0;
}
