/* CAMPAIGN-PREP candidate for func_022145ec (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D/branch-table: phase switch returning constants; h2.bit0 :1; case 0x80 first to lay jump-table bodies
 *   risk:       permuter-class + TRUNCATED: orig uses sub#0x78;addls pc table for 0x78..0x80 plus beq 0x64; mwcc may emit a single dense table or different case order -> the 0x64 body and table layout/return slots cannot be byte-confirmed.
 *   confidence: low
 */
/* func_ov002_022145ec (ov002, cls D): phase switch via base-0x78 jump table
 * (0x78,0x7e,0x7f,0x80) plus a separate 0x64 case, each returning a constant
 * next-state. h2.bit0 feeds most calls; h0 used as a key.
 * WARNING: source asm TRUNCATED at '.L_10c: ldrh r0,[r4,#2]'; the 0x64 case
 * body and the default (.L_124, presumed 'return 0') are reconstructed. */

extern unsigned char data_ov002_022ce288[];   /* [0x5a8]=phase */
extern int  func_ov002_021ae400(int b0, int b);
extern int  func_ov002_021af9d0(int b0, int b, int h0, int d);
extern int  func_ov002_021afb64(int a);
extern int  func_ov002_021afb74(void);
extern int  func_ov002_021d8288(int b0, int b);
extern int  func_ov002_021e286c(void);
extern int  func_ov002_0225368c(int b0, int h0, int c);
extern int  func_ov002_0226b054(int a);

extern const unsigned short data_ov002_KEY94;   /* _LIT1 compared against h0 */

typedef struct Obj {
    unsigned short h0;          /* 0x00 */
    unsigned short b0  : 1;     /* 0x02 bit0 */
    unsigned short h2hi : 15;
} Obj;

int func_ov002_022145ec(void *obj) {
    Obj *o = (Obj *)obj;
    int phase = *(int *)(data_ov002_022ce288 + 0x5a8);

    switch (phase) {
    case 0x78:
        func_ov002_0226b054(1 - o->b0);
        return 0x64;
    case 0x7e:
        func_ov002_021d8288(o->b0, func_ov002_021afb74());
        return 0x64;
    case 0x7f:
        if (o->h0 == data_ov002_KEY94)
            func_ov002_021af9d0(o->b0, 6, o->h0, 0);
        else
            func_ov002_021afb64(0);
        return 0x7e;
    case 0x80:
        if (func_ov002_0225368c(o->b0, o->h0, 0) != 0)
            return 0x7f;
        func_ov002_021ae400(o->b0, 0x15);
        return 0x78;
    case 0x64:
        /* TRUNCATED body */
        return 0;
    default:
        return 0;
    }
}
