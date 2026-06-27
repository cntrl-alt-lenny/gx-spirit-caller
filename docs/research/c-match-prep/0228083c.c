/* CAMPAIGN-PREP candidate for func_0228083c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     and#1 parity index, inline mul/mla (no shared-base bind); :13 id; branch dispatch; store-then-return
 *   risk:       struct-guessed: _LIT0..7 sentinel/base/stride words absent from asm (SENT0/1, ST0, table bases are placeholders); offsets 0x260/0x120/0x418/0xd44 and parity (a&1 vs (1-a)&1) must be confirmed. struct-guessed
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_0228083c (ov002, class D, MED tier) — brief 0080.
 * UNVERIFIED + ITERATION-EXPECTED. *** _LIT0.._LIT7 POOL WORDS NOT IN PROVIDED ASM ***
 * Per-player table idiom confirmed vs sibling 02281b5c (base data_cf16c, stride,
 * :13 id, 021b00d0/021c3cf0). Caller 021af9d0 calls this as (a,b). PLACEHOLDERS:
 * SENT0/SENT1 (arg1 sentinels), strides, and table bases must be filled from pool.
 *   recipe:     and#1 parity index, inline mul/mla (don't bind shared base); :13 id; branch dispatch; store result then return
 *   confidence: low
 */
/* func_ov002_0228083c (cls D) — out=b; if(b==SENT0) out=SENT0+0xb4;
 * else if(b==SENT1){ s=a&1; h=021b00d0(*(TBL2+s*ST0)); out=(*(BASE+s*ST0+h*4+0x260)):13; }
 * else { s=(1-a)&1; if(021c3cf0(1-a) && *(TBL5+s*0x868)){ h=021b00d0(that);
 *   out=(*(BASE+s*0x868+h*4+0x120)):13; } else if(*(TBL6+s*0x868)){
 *   h=021b00d0(that); p=BASE+s*0x868+0x418; e=*(p+h*4); if(0202e2c8(e:13)==0) out=(*(p+h*4)):13; } }
 * *(STATE+0xd44)=out; return out. Index math inlined so only the product CSEs. */

extern char data_ov002_022cf16c[];   /* BASE (shared, LIT3) */
extern char data_ov002_022cf178[];   /* TBL2 (LIT2)         */
extern char data_ov002_022cf17c[];   /* TBL5 (LIT5)         */
extern char data_ov002_022cf180[];   /* TBL6 (LIT6)         */
extern char data_ov002_022d016c[];   /* STATE (LIT7)        */
extern int  func_0202e2c8(int id);
extern int  func_ov002_021b00d0(int handle);
extern int  func_ov002_021c3cf0(int a);

#define OV2_SENT0 0x1d00          /* LIT0 placeholder */
#define OV2_SENT1 0x0a00          /* LIT1 placeholder */
#define OV2_ST0   (OV2_SENT0 - 0xd00) /* row stride for the SENT1 table */
#define OV2_ST1   0x868           /* LIT4 stride (confirmed via sibling 02281b5c) */

struct Ov002Id { unsigned int id : 13; };

int func_ov002_0228083c(int a, int b) {
    int out = b;
    if (b == OV2_SENT0) {
        out = OV2_SENT0 + 0xb4;
    } else if (b == OV2_SENT1) {
        int s = a & 1;
        int h = func_ov002_021b00d0(*(int *)(data_ov002_022cf178 + s * OV2_ST0));
        out = ((struct Ov002Id *)(data_ov002_022cf16c + s * OV2_ST0 + h * 4 + 0x260))->id;
    } else {
        int s = (1 - a) & 1;
        if (func_ov002_021c3cf0(1 - a) != 0
            && *(int *)(data_ov002_022cf17c + s * OV2_ST1) != 0) {
            int h = func_ov002_021b00d0(*(int *)(data_ov002_022cf17c + s * OV2_ST1));
            out = ((struct Ov002Id *)(data_ov002_022cf16c + s * OV2_ST1 + h * 4 + 0x120))->id;
        } else if (*(int *)(data_ov002_022cf180 + s * OV2_ST1) != 0) {
            char *p = data_ov002_022cf16c + s * OV2_ST1 + 0x418;
            int h = func_ov002_021b00d0(*(int *)(data_ov002_022cf180 + s * OV2_ST1));
            int e = ((struct Ov002Id *)(p + h * 4))->id;
            if (func_0202e2c8(e) == 0)
                out = ((struct Ov002Id *)(p + h * 4))->id;
        }
    }
    *(int *)(data_ov002_022d016c + 0xd44) = out;
    return out;
}
