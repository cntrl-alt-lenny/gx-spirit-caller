/* CAMPAIGN-PREP candidate for func_021d50fc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Ov002Slot :13 bitfield; 1-arg0 via rsb; (u8) byte-pack payloads
 *   risk:       reshape-able: counter test `>=0xa` may emit bls-to-pack with inverted arm-inlining vs orig `bcc .L_2c8`; flip to `if(c<0xa){pack}else{...}` (dispatch-order-inversion lever) if polarity diverges.
 *   confidence: med
 */
/* func_ov002_021d50fc: mla-indexed slot guard chain with multiple callbacks
 * (cls C). Resolve player (arg0&1) row arg1 slot; if its :13 id is 0, bail.
 * Find the partner via 021c10e8; if it equals self, bail. Read a tag via
 * 021bc6c4; optionally negate on a 021b8fcc/021bd030 result; then either
 * notify 021de480 or, after a +0xd40 retry counter, post a packed event to
 * 021d7054. */
#include "ov002_core.h"

extern char data_ov002_022cf16c[];   /* row table (_LIT1), 0x868/player */
extern char data_ov002_022d016c[];   /* +0xd40 retry counter block (_LIT2) */

extern int  func_ov002_021c1954(int self);
extern int  func_ov002_021c10e8(int self, int row, int c);
extern int  func_ov002_021bc6c4(int a);
extern int  func_ov002_021b8fcc(int self, int row);
extern int  func_ov002_021bd030(int a);
extern int  func_ov002_021de480(int self, int row, int c, int d);
extern int  func_ov002_021d7054(int packedA, int packedB);

int func_ov002_021d50fc(int arg0, int arg1) {
    int partner;
    int tag;
    if (func_ov002_021c1954(arg0) != 0)
        return 0;
    if (((struct Ov002Slot *)(data_ov002_022cf16c + (arg0 & 1) * 0x868 +
                              arg1 * 0x14 + 0x30))->id == 0)
        return 0;
    partner = func_ov002_021c10e8(arg0, arg1, 0);
    if (partner == arg0)
        return 0;
    tag = func_ov002_021bc6c4(partner);
    if (func_ov002_021b8fcc(arg0, arg1) != 0) {
        if (func_ov002_021bd030(1 - arg0) < 0)
            tag = -1;
    }
    if (tag == -1) {
        func_ov002_021de480(arg0, arg1, 1, 0);
    } else if ((*(int *)(data_ov002_022d016c + 0xd40) += 1) >= 0xa) {
        *(int *)(data_ov002_022d016c + 0xd40) = 0;
        func_ov002_021de480(arg0, arg1, 0, 0);
    } else {
        func_ov002_021d7054((u16)((u8)arg0 | ((u8)arg1 << 8)),
                            (u16)((u8)partner | ((u8)tag << 8)));
    }
    return 1;
}
