typedef unsigned char u8;
typedef unsigned int u32;
typedef struct {
    u8 pad0[0x17c];
    u8 repeats;
    u8 pad17d[3];
    u32 value;
    int field184;
    int field188;
    u8 pad18c[0x14];
    int state;
    u8 pad1a4[0x228];
    u8 flag;
} State;
extern void *func_020498f0(void);
extern void func_020498dc(int state);
extern int func_0204ed50(int mode, unsigned int value, void *item);
extern int func_0204a9b0(int code);

void func_02049e84(u32 value) {
    State *s;
    if (((State *)func_020498f0())->state == 1) {
        func_020498dc(6);
    } else if (((State *)func_020498f0())->state != 6 &&
               ((State *)func_020498f0())->state != 11) {
        return;
    }
    if (value == ((State *)func_020498f0())->value) {
        ((State *)func_020498f0())->repeats++;
    } else {
        ((State *)func_020498f0())->repeats = 0;
        ((State *)func_020498f0())->value = value;
    }
    s = func_020498f0();
    s->field184 = 0;
    s->field188 = 0;
    if (func_0204a9b0(func_0204ed50(1, value, 0)) == 0) {
        ((State *)func_020498f0())->flag = 0xff;
    }
}
