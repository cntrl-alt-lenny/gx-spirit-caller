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
extern char data_ov010_021b9260[];
extern State data_ov010_021b9270;
extern Widget data_ov010_021b9294;
extern char data_ov010_021b8d44[];
extern u16 data_ov010_021b9484[];
extern int func_0208c844(u16 *p);
extern void func_0208c884(u16 *a0, int a1);
extern void func_0207ec68(State *s);
extern void func_0207ed94(State *s);
extern int func_0207f05c(State *s, u16 *p, u16 count);
extern int func_ov010_021b4884(u16 **out);
extern int func_ov010_021b2924(Widget *self, void *rngArg, int arg2);
int func_ov010_021b5c3c(void) {
    u16 *out = data_ov010_021b9484;
    char *self = data_ov010_021b9260;
    int saved = func_0208c844((u16 *)0x0400006c);
    int n;
    u32 control;
    *(volatile u32 *)0x04001000 = (*(volatile u32 *)0x04001000 & ~0x1f00) | 0x1f00;
    control = *(volatile u16 *)0x04001008;
    *(volatile u16 *)0x04001008 = (control & ~3) | 2;
    control = *(volatile u16 *)0x0400100a;
    *(volatile u16 *)0x0400100a = control & ~3;
    control = *(volatile u16 *)0x0400100c;
    *(volatile u16 *)0x0400100c = (control & ~3) | 1;
    control = *(volatile u16 *)0x0400100e;
    *(volatile u16 *)0x0400100e = (control & ~3) | 3;
    *(volatile u32 *)0x04001010 = 0x1dc0000;
    *(volatile u32 *)0x04001014 = 0;
    *(volatile u32 *)0x04001018 = 0;
    *(volatile u32 *)0x0400101c = 0;
    *(volatile u32 *)0x04001000 |= 0x10000;
    func_0207ed94(&data_ov010_021b9270);
    func_0207ec68(&data_ov010_021b9270);
    n = 0;
    n += func_ov010_021b4884(&out);
    n += func_ov010_021b2924(&data_ov010_021b9294, &data_ov010_021b9270, (int)&out);
    if (n > 0) func_0207f05c((State *)(self + 0x10), data_ov010_021b9484, (u16)n);
    func_0208c884((u16 *)0x0400106c, saved);
    if (*(int *)(data_ov010_021b8d44 + 0x64) == 0) {
        int newState = 2;
        *(u32 *)(*(char **)(self + 0x2c) + 0x70) &= ~2;
        *(u32 *)(self + 0xf8) &= ~1;
        *(int *)(self + 4) = newState;
    }
    return 1;
}







