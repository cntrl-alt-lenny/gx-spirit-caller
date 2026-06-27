/* CAMPAIGN-PREP candidate for func_02231a3c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     variable-shift byte-select (key*8); bitfield decode; bind g; if-assign state ladder
 *   risk:       reshape-able+struct-guessed: the c5a8 state ladder (0x7e/7f/80) ordering and which global holds 5ac/cec are inferred; eor-key vs flag liveness may reorder cmp. confirm globals.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_02231a3c (ov002, class D) - brief 494.
 * UNVERIFIED build-free draft. key = c_cec ^ c_5ac; byte-select (obj->f14 >>
 * (key*8)) & 0xff; canonical f2/f4 bitfield decode + parallel parity*0x868 table;
 * c5a8 state machine (0x7e/0x7f/0x80). eor-key drives a c16c[(key&1)*0x868] guard.
 */
typedef unsigned short u16;

extern char data_ov002_022ce288[];
extern char data_ov002_022cf16c[];   /* record table, +0x30      */
extern char data_ov002_022cf178[];   /* guard table (key&1 idx)  */
extern char data_ov002_022cf1a4[];   /* guard table (parity/slot)*/
extern char data_ov002_022d016c[];   /* base for c_5ac/c_cec     */
extern void func_ov002_0226aef0(int key, int b, int c);

int func_ov002_02231a3c(char *obj) {
    char *g = data_ov002_022ce288;
    int key = *(int *)(g + 0xcec) ^ *(int *)(data_ov002_022d016c + 0x5ac);
    u16 f2 = *(u16 *)(obj + 2);
    u16 f4 = *(u16 *)(obj + 4);
    int byte = (*(int *)(obj + 0x14) >> (key * 8)) & 0xff;
    int parity = (f2 << 0x1f) >> 0x1f;
    int slot = (f2 << 0x1a) >> 0x1b;
    int rec = *(int *)(data_ov002_022cf16c + parity * 0x868 + 0x30 + slot * 0x14);
    int A = (f4 << 0x11) >> 0x17;
    int B = ((rec << 2) >> 0x18) * 2 + ((rec << 0x12) >> 0x1f);
    int flag = (byte != 0);
    int state;

    if (A != B)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + parity * 0x868 + slot * 0x14) == 0)
        return 0;
    state = *(int *)(data_ov002_022d016c + 0x5a8);
    if (state == 0x7e) {
        int c = *(int *)(data_ov002_022d016c + 0x5ac) + 1;
        *(int *)(data_ov002_022d016c + 0x5ac) = c;
        return c < 2 ? 0x7f : 0;
    }
    if (state == 0x80)
        *(int *)(data_ov002_022d016c + 0x5ac) = 0;
    else if (state != 0x7f)
        return 0;
    if (flag) {
        if (*(int *)(data_ov002_022cf178 + (key & 1) * 0x868) != 0)
            func_ov002_0226aef0(key, 0, 0);
    }
    return 0x7e;
}
