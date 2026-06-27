/* CAMPAIGN-PREP candidate for func_0227a8fc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D scaffold: signed :8 hi-byte (asr#8), bitfield repack store@+0xa
 *   risk:       struct-guessed/TRUNCATED: body past `bl 021b1570` and the epilogue are absent (size 340 vs 75 shown); _LIT3=cd744 inferred. Also class-D: repack `((word<<2>>24)<<1)+(word<<18>>31)` and the signed-:8 hi extraction (asr#8 vs lsr#8) are the bitfield divergence points to confirm.
 *   confidence: low
 */
/* func_ov002_0227a8fc: SCAFFOLD -- TRUNCATED after `bl func_ov002_021b1570`
 * (size 340 / ~80 insns; ~75 shown). Literal pool stripped; mapped from the
 * extern list: _LIT0=cd300, _LIT1=cf16c, _LIT2=0x868, _LIT3=cd744 (the
 * int[] indexed by bit0, == 2 test, cf. func_ov002_021e2b3c). The body past
 * the f1570 call and the epilogue are ABSENT. cls C, but the scan loop is
 * dense class-D bitfield extraction -- store-order @+0xa is load-bearing.
 *
 * Per-iteration: read packed u16 @(0x10+i*2): lo=h&0xff, player=lo&1,
 * hi=(h>>8)&0xff (after asr#8). Index sub-row word @ cf16c+player*0x868+
 * 0x30+hi*0x14. Repack: ((word>>22 & 0xff) << 1) | ((word>>13)&1) -> @(0xa+i*2). */
typedef unsigned short u16;
struct CD300hdr { unsigned bit0:1; unsigned pad4:4; unsigned bit5:1; unsigned rest:26; };
/* the packed entry @(0x10+i*2): low byte unsigned, high byte SIGNED (the orig
 * ldrh+asr#8 == read a signed :8 field; a plain (h>>8) would emit lsr#8). */
struct Entry { u16 lo : 8; short hi : 8; };
extern char data_ov002_022cd300[];   /* _LIT0 */
extern char data_ov002_022cf16c[];   /* _LIT1 row table */
extern int  data_ov002_022cd744[];   /* _LIT3 state->code table */
extern int  func_ov002_021b1570(int a, int b, u16 *c, int d);
extern int  func_ov002_021e2d20(int a, int b, int c, int d);
int func_ov002_0227a8fc(void) {
    int i;
    int count;
    int player, hi;
    unsigned word;
    u16 local;
    *(int *)(data_ov002_022cd300 + 0x18) = 0;
    *(u16 *)(data_ov002_022cd300 + 0x16) =
        (u16)((*(u16 *)(data_ov002_022cd300 + 0x16) | 0x40) & ~0x80);
    count = (unsigned char)data_ov002_022cd300[0x8];
    for (i = 0; i < count; i++) {
        struct Entry *e = (struct Entry *)(data_ov002_022cd300 + 0x10 + i * 2);
        player = e->lo & 1;
        hi = e->hi & 0xff;   /* signed :8 read -> asr#8, then mask back to 8 bits */
        word = *(unsigned *)(data_ov002_022cf16c + player * 0x868 + 0x30 + hi * 0x14);
        *(u16 *)(data_ov002_022cd300 + 0xa + i * 2) =
            (u16)((((word << 2) >> 24) << 1) + ((word << 18) >> 31));
    }
    /* .L_9c: flag tests + optional func_021e2d20, then cd744[bit0]==2 gate */
    if (!(((struct CD300hdr *)data_ov002_022cd300)->bit5) &&
        !(*(u16 *)(data_ov002_022cd300 + 0x4) & 4)) {
        /* fallthrough to .L_f0 */
    } else {
        int on = (*(u16 *)(data_ov002_022cd300 + 0x4) & 0x10) ? 1 : 0;
        func_ov002_021e2d20(on ^ (int)((struct CD300hdr *)data_ov002_022cd300)->bit0,
                            0x10, 1, /*r3=*/0);
    }
    /* .L_f0 */
    if (data_ov002_022cd744[((struct CD300hdr *)data_ov002_022cd300)->bit0] != 2)
        return 0;
    *(u16 *)(data_ov002_022cd300 + 0x16) |= 0x80;
    local = 0;
    return func_ov002_021b1570(0x15, -1, &local, 0x1c);
    /* TRUNCATED past the f1570 call (r2 arg + remainder absent). */
}
