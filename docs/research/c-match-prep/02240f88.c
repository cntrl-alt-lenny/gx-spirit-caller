/* CAMPAIGN-PREP candidate for func_02240f88 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0 :1; if-chain classify; bind 0x5b8 step base; 0xd70/d74/d78 triple add
 *   risk:       asm truncated mid step==1 (step==2 + else-branch missing) AND the 3 classify constants are placeholders; struct-guessed (0x48c ptr/cat consts unverified). struct-guessed + truncated-target.
 *   confidence: low
 */
/* func_ov002_02240f88  ov002  class D  MED  (asm TRUNCATED mid step==1)
 * 3-way field0 classify -> category const r4; then 0x5b8 step machine.
 * recipe: bit0 :1 bitfield; bind step base across re-ldr; if-chain classify.
 */
typedef unsigned short u16;
typedef unsigned char  u8;
typedef int            s32;

struct Obj88 { u16 field0; u16 bit0:1; u16 pad2:15; };          /* [0]=id [2]=flags */
struct Glob5b8 { u8 pad48c[0x48c]; void *p48c; u8 pad5b8[0x5b8-0x48c-4]; s32 step; }; /* 0x48c ptr, 0x5b8 step */
struct Glob_d016c { u8 pad[0xd70]; s32 d70; s32 d74; s32 d78; };

extern struct Glob5b8    data_ov002_022ce288;
extern struct Glob_d016c data_ov002_022d016c;
extern int  func_0202b100(u16 x);
extern void func_ov002_021ae400(int bit);
extern void func_ov002_0223dcc0(void *obj, s32 a1, s32 a2, s32 cat);
extern void func_ov002_02240ee4(void);
extern void func_ov002_02240efc(void);
extern void func_ov002_02240f44(void);
extern void func_ov002_0225935c(int bit, u16 f0, s32 cat);
extern int  func_ov002_022593f4(void);
extern void func_ov002_0229ce5c(void *buf, int n, int v);

/* category constants chosen by field0 classify (_LIT1/_LIT2/_LIT3) */
extern s32 cat_022D016C, cat_LIT2, cat_LIT3, cat_LIT1;

int func_ov002_02240f88(struct Obj88 *obj, struct Obj88 *arg)
{
    u16 id = obj->field0;
    s32 cat;
    s32 step;
    if (id == 0x0)            cat = cat_LIT2;        /* placeholder: _LIT0 literal */
    else if (id == 0xe3)      cat = cat_LIT3;
    else if (id == 0x2a40)    cat = cat_LIT1;        /* rsb r2,#0x2a40 => 0x2a40-_LIT0 */
    else                      cat = cat_LIT1;
    step = data_ov002_022ce288.step;
    if (step == 0) {
        char buf[0x100];
        int t = func_0202b100(arg->field0);
        func_ov002_0229ce5c(buf, 0x8a, t);
        func_ov002_021ae400(obj->bit0);
        data_ov002_022ce288.p48c = arg;
        func_ov002_0225935c(obj->bit0, obj->field0, cat);
        data_ov002_022ce288.step = data_ov002_022ce288.step + 1;
        return 0;
    }
    if (step == 1) {
        char buf[0x100];
        (void)buf;
        if (func_ov002_022593f4() != 0) {
            func_ov002_0223dcc0(obj, data_ov002_022d016c.d70,
                                data_ov002_022d016c.d74 + data_ov002_022d016c.d78, cat);
            data_ov002_022ce288.step = data_ov002_022ce288.step + 1;
        }
        return 0;   /* TRUNCATED: step==1 else-branch + step==2 unknown */
    }
    return 0;
}
