typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
    int index;
    u16 first, last, previous, other, pad0c, saved;
    int pad10;
    int active;
} State;
typedef struct {
    char pad0[8];
    int mode, state, trigger;
    void (*callback)(int);
    int target;
    short rectX, rectY;
    u16 rectW, rectH;
} Widget;
extern char data_ov010_021b8d44[];
extern char data_ov010_021b9260[];
extern State data_ov010_021b9270;
extern Widget data_ov010_021b9294;
extern char data_ov010_021b9484[];
extern int func_0208c844(volatile u16 *value);
extern void func_0208c884(u16 *a0, int a1);
extern void func_0207ed94(State *s);
extern void func_0207ec68(State *s);
extern int func_0207f05c(State *s, void *p, u16 count);
extern int func_ov010_021b4884(char **p);
extern int func_ov010_021b2924(Widget *self, void *rngArg, int arg2);
int func_ov010_021b6514(void) {
    char *base = data_ov010_021b9260;
    char *p = data_ov010_021b9484;
    int n = 0;
    int saved = func_0208c844((volatile u16 *)0x0400006c);

    func_0207ed94(&data_ov010_021b9270);
    func_0207ec68(&data_ov010_021b9270);
    n += func_ov010_021b4884(&p);
    n += func_ov010_021b2924(&data_ov010_021b9294, &data_ov010_021b9270, (int)&p);
    if (n > 0) func_0207f05c((State *)(base + 0x10), data_ov010_021b9484, (u16)n);
    func_0208c884((u16 *)0x0400106c, saved);
    if (*(int *)(data_ov010_021b8d44 + 0x64) == 0) {
        *(u32 *)0x04001000 &= ~0x1f00;
        func_0208c884((u16 *)0x0400106c, -16);
    }
    return 1;
}


