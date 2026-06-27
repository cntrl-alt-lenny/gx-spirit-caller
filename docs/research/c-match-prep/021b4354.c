/* CAMPAIGN-PREP candidate for func_021b4354 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: head-idx load, list-walk, blx callback, next-before-call
 *   risk:       orig holds cb(r8)/arg2(r7) callee-saved across the loop and reads next(r5) BEFORE blx; if mwcc reloads next after the call the ldrh moves past blx (reshape-able: load next before cb()).
 *   confidence: med
 */
/* func_ov002_021b4354: walk an 8-byte-record list at data_ov002_022d0650
 * whose head index is a u16 at node+0xa (next at +6); for each record call
 * cb(record, arg2) via function pointer; return the first record for which
 * cb!=0, else 0. */
typedef unsigned short u16;
extern char data_ov002_022d0650[];

typedef int (*Cb4354)(void *rec, int arg2);
struct Rec4354 { u16 _pad0[3]; u16 next; };

void *func_ov002_021b4354(void *node, Cb4354 cb, int arg2) {
    unsigned int idx = *(u16 *)((char *)node + 0xa);
    char *rec;
    if (idx == 0)
        return 0;
    do {
        rec = (char *)data_ov002_022d0650 + idx * 8;
        idx = ((struct Rec4354 *)rec)->next;
        if (cb(rec, arg2) != 0)
            return rec;
    } while (idx != 0);
    return 0;
}
