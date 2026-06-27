/* CAMPAIGN-PREP candidate for func_0206c4b0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order: eng->f8=0 store between setup and ce0 call; f70|=4 then tail call
 *   risk:       store-order: orig stores eng[0xf8]=0 AFTER func_02070e54 but BEFORE func_02070ce0, and reads back only outA([sp]) using r (not outB). f70|=4 is ldrsh-orr-strh just before func_02092748. reshape-able: place the f8=0 store at that exact point, keep outB unread. struct-guessed offsets.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_0206c4b0 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: ordered stores; eng->f8=0 store mid-body; ctx->f70|=4 then final call
 * func_0206c4b0(cmd):
 *   ctx = cmd->p04; eng = ctx->eng64;
 *   func_020927b8(eng+0xe0);
 *   func_02070f78(cmd->h10, 0, 0);
 *   func_02070e54();
 *   eng->w_f8 = 0;
 *   func_02070ce0(&a, &b);   ; writes a (u16), returns r
 *   *(short*)cmd->p14 = a; *(int*)cmd->p18 = r;
 *   ctx->f70 |= 4;
 *   func_02092748(eng+0xe0);
 *   return 0;
 */
typedef struct Ctx Ctx;
struct Ctx {
    char  _pad_00[0x64];
    char *eng64;          /* +0x64 engine */
    char  _pad_68[0x70 - 0x68];
    short f70;            /* +0x70 ldrsh/strh |=4 */
};
typedef struct {
    char  _pad_00[0x4];
    Ctx  *p04;            /* +0x4  ctx */
    char  _pad_08[0x10 - 0x8];
    unsigned short h10;   /* +0x10 ldrh */
    char  _pad_12[0x14 - 0x12];
    short *p14;           /* +0x14 strh dst */
    int   *p18;           /* +0x18 str dst */
} Cmd;

extern void func_020927b8(void *p);
extern void func_02070f78(int h10, int z1, int z2);
extern void func_02070e54(void);
extern int  func_02070ce0(unsigned short *outA, int *outB);
extern void func_02092748(void *p);

int func_0206c4b0(Cmd *cmd) {
    Ctx *ctx = cmd->p04;
    char *eng = ctx->eng64;
    unsigned short a;
    int b;
    int r;
    func_020927b8(eng + 0xe0);
    func_02070f78(cmd->h10, 0, 0);
    func_02070e54();
    *(int *)(eng + 0xf8) = 0;
    r = func_02070ce0(&a, &b);
    *cmd->p14 = (short)a;
    *cmd->p18 = r;
    ctx->f70 |= 4;
    func_02092748(eng + 0xe0);
    return 0;
}
