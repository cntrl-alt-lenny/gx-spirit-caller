typedef unsigned int u32;
typedef struct {
    char pad0[0x268];
    u32 lo268:5;
    u32 value268:4;
    u32 hi268:23;
    u32 unused26c;
    u32 flags270;
    u32 lo274:9;
    u32 mode274:4;
    u32 value274:8;
    u32 hi274:11;
    u32 unused278, unused27c;
    u32 flags280;
    signed int state:8;
    u32 value284:4;
    u32 idx284:8;
    u32 end284:8;
    u32 hi284:4;
} State;
extern State data_ov011_021d403c;
extern unsigned func_ov011_021ca6ac(void);
extern void func_ov011_021cb218(void);
extern int func_ov011_021cc7f8(void);
extern void func_ov011_021ccf3c(void);
extern void func_ov011_021ccfcc(void);
extern void func_ov011_021cdb94(void);
extern void func_ov011_021ce344(void);
extern void func_ov011_021ceffc(void);
extern void func_ov011_021cf048(void);
extern int func_ov011_021cf060(void);
extern int func_ov011_021d1b48(void);
extern void func_ov011_021d1b70(int idx);
void func_ov011_021d1d30(void) {
    State *s = &data_ov011_021d403c;
    switch (s->state) {
    case 1:
        if (func_ov011_021ca6ac() == 0) s->state = 0;
        break;
    case 2:
        if (func_ov011_021cf060() != 0) s->state = 0;
        break;
    case 3:
        if ((s->mode274 == 0 && s->value274 == 20) ||
            (s->mode274 == 1 && s->value274 == 0)) {
            func_ov011_021cf048();
            s->value268 = s->value284;
            s->state = 4;
        }
        break;
    case 4:
        if (func_ov011_021ca6ac() == 0) {
            s->flags280 |= 0x200;
            func_ov011_021cb218();
            func_ov011_021ceffc();
            s->state = 5;
        }
        break;
    case 5:
        if (func_ov011_021cf060() != 0) {
            func_ov011_021cf048();
            func_ov011_021cc7f8();
            func_ov011_021cdb94();
            func_ov011_021ce344();
            func_ov011_021ccfcc();
            s->state = 6;
        }
        break;
    case 6:
        if ((s->mode274 == 0 && s->value274 == 20) ||
            (s->mode274 == 1 && s->value274 == 0)) {
            func_ov011_021d1b70(s->idx284);
            s->state = 7;
        }
        break;
    case 7:
        if (func_ov011_021d1b48() == 0) {
            func_ov011_021ccf3c();
            s->flags270 &= ~0x10000000;
            s->state = 0;
            s->end284 = 0;
        }
        break;
    }
}
