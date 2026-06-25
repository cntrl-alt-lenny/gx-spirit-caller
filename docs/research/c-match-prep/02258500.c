/* CAMPAIGN-PREP candidate for func_02258500 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-chain on state; Slot.id:13 + bit13 bitfields; asymmetric (x<<2)>>24 raw; accumulator-first add
 *   risk:       case-2 bitfield compose is struct-guessed AND order-sensitive: orig reads *p1,*p2 before *p3 and folds bit13 via ip,lsr#31; mwcc read-scheduling and the :1/:13 layout may diverge. struct-guessed + permuter-class.
 *   confidence: low
 */
/* func_ov002_02258500 (ov002, class C/D) — 3-state machine on d016c+0xd68.
 * 0: helper(a,0x114), state++; 1: helper2(a,6,0xFFFE,c), state++;
 * 2: pull three records, compose bitfields, fire 02259ee8, clear +0xd50.
 */
extern char data_ov002_022d016c[];
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern void *func_ov002_021afb74(void);
extern void func_ov002_02259ee8(int a, int b, int c, int d);

struct Ov002Id13 { unsigned int id : 13; };
struct Ov002Bit13 { unsigned int : 13; unsigned int b13 : 1; };

void func_ov002_02258500(int a, int b, int c) {
    int st = *(int *)(data_ov002_022d016c + 0xD68);
    if (st == 0) {
        func_ov002_021ae400(b, 0x114);
        *(int *)(data_ov002_022d016c + 0xD68) =
            *(int *)(data_ov002_022d016c + 0xD68) + 1;
        return;
    }
    if (st == 1) {
        func_ov002_021af9d0(b, 6, 0xFFFE, c);
        *(int *)(data_ov002_022d016c + 0xD68) =
            *(int *)(data_ov002_022d016c + 0xD68) + 1;
        return;
    }
    if (st == 2) {
        struct Ov002Id13 *p1 = (struct Ov002Id13 *)func_ov002_021afb74();
        struct Ov002Bit13 *p2 = (struct Ov002Bit13 *)func_ov002_021afb74();
        int *p3 = (int *)func_ov002_021afb74();
        func_ov002_02259ee8(b, c, p1->id,
            (((unsigned int)(*p3 << 2) >> 24) << 1) + p2->b13);
        *(int *)(data_ov002_022d016c + 0xD50) = 0;
    }
}
