/* CAMPAIGN-PREP candidate for func_022153bc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: 3-key if-chain sets kind/sub; sel=(sub&1)*0x868; bind list base; bind/store ce288[0x5ac]
 *   risk:       permuter-class + TRUNCATED: 10-reg frame, loop ptr-advance/exit not in asm; reg-alloc of sl/r9/r5 across 021b3fd8 plus the missing loop body bytes mean only the dispatch + 0x80 branch are confidently shaped.
 *   confidence: low
 */
/* func_ov002_022153bc (ov002, cls D): pick (sel,kind) from h0 matching one of
 * three keys, then phase dispatch. 0x80: store cf178[sel*0x868] into
 * ce288[0x5ac] and call 021e104c. 0x7f: walk a cf-record list of length
 * cf178[sel] - ce288[0x5ac], counting matches via 021b3fd8.
 * WARNING: source asm TRUNCATED mid-loop at 'cmp r7,r0'; the loop increment,
 * exit, accumulate-return, and the default (.L_15c) are reconstructed by
 * intent only. */

extern unsigned char data_ov002_022ce288[];   /* [0x5a8]=phase, [0x5ac]=cursor */
extern unsigned char data_ov002_022cf16c[];   /* _LIT6 list base */
extern unsigned char data_ov002_022cf178[];   /* _LIT5 count/limit table, stride 0x868 */
extern int  func_ov002_021b3fd8(int kind, int b, void *c, int packed);
extern int  func_ov002_021e104c(int kind);
extern int  func_ov002_0226ad5c(void);

extern const unsigned short data_ov002_KEY0;
extern const unsigned short data_ov002_KEY1;
extern const unsigned short data_ov002_KEY2;
extern unsigned char data_ov002_LIT7[];

typedef struct Obj {
    unsigned short h0;          /* 0x00 */
    unsigned short h2;          /* 0x02 */
    unsigned short pad4;        /* 0x04 */
    unsigned short pad6;
    unsigned short h8;          /* 0x08 */
} Obj;

int func_ov002_022153bc(void *obj) {
    Obj *o = (Obj *)obj;
    int kind = 0;
    int sub  = 0;
    int phase, sel, i, matches;
    unsigned char *rec;

    if (o->h0 == data_ov002_KEY0) {
        sub = o->h8 & 1;
        kind = 3;
    } else if (o->h0 == data_ov002_KEY1) {
        sub = (o->h2 << 31) >> 31;
        kind = 2;
    } else if (o->h0 == data_ov002_KEY2) {
        sub = (o->h2 << 31) >> 31;
        kind = 2;
    }

    phase = *(int *)(data_ov002_022ce288 + 0x5a8);
    sel = (sub & 1) * 0x868;

    if (phase == 0x80) {
        *(int *)(data_ov002_022ce288 + 0x5ac) =
            *(int *)(data_ov002_022cf178 + sel);
        func_ov002_021e104c(sub);
        return 0x7f;
    }
    if (phase != 0x7f)
        return 0;

    matches = 0;
    rec = data_ov002_022cf16c + sel;
    {
        unsigned int limit = *(unsigned int *)(data_ov002_022cf178 + sel);
        if (limit != 0) {
            for (i = 0; i < *(int *)(rec + 0xc); i++) {
                unsigned int w = *(unsigned int *)(rec + 0x120);
                int packed = (((w >> 6) & 0xff) << 1) + ((w >> 13) & 1);
                if (func_ov002_021b3fd8(sub, 0xb, data_ov002_LIT7, packed) != 0)
                    matches++;
            }
        }
    }
    return matches;   /* TRUNCATED: exact tail/return reconstructed */
}
