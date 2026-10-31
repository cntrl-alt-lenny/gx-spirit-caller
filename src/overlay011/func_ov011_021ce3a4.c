typedef unsigned int u32;
struct State { char pad[0x2a0]; u32 mode; };
struct View {
    char pad0[0x238];
    u32 x, y;
    u32 status:3; u32 status_rest:29;
    char pad1[0x14];
    u32 a_low:10; u32 a:8; u32 a_rest:14;
    u32 b_low:15; u32 b:8; u32 b_rest:9;
    u32 flags_low:16; u32 classification:4; u32 active:1; u32 flags_high:11;
    u32 unused264;
    u32 low:5; u32 mode:4; u32 next:4; u32 high:19;
    u32 unused26c, unused270;
    u32 field274;
    u32 unused278, unused27c;
    u32 field280:8; u32 rest280:24;
    u32 unused284;
    u32 counter;
};
extern struct State data_ov011_021d4000;
extern struct View data_ov011_021d403c;
extern void func_ov011_021ccfcc(void);
extern void func_ov011_021ce344(void);
extern unsigned func_ov011_021cdb7c(void);
extern void func_ov011_021cad00(int arg0);
extern void func_ov011_021ceffc(void);
/* The existing void forwarder leaves the classifier result in r0. */
extern int func_020139b4(void);
int func_ov011_021ce3a4(void) {
    struct View *v = &data_ov011_021d403c;
    switch (data_ov011_021d4000.mode) {
    case 0:
        if (v->mode != 0 && v->mode == v->field280) {
            if (v->mode != v->next) func_ov011_021ccfcc();
            v->counter = 0;
            func_ov011_021ce344();
            v->active = 1;
            return 1;
        }
        break;
    case 1:
        if (v->status == 3 && v->x == 0 && v->y == 0 && v->b == v->a) {
            v->field274 = (v->field274 & 0xffe01fff) | 0xc000;
            if (func_ov011_021cdb7c() == 0) func_ov011_021cad00(v->a);
            if (func_ov011_021cdb7c() != 0) {
                func_ov011_021ceffc();
                func_ov011_021ccfcc();
            }
            v->classification = func_020139b4();
            v->active = 1;
            return 1;
        }
        break;
    }
    return 0;
}

