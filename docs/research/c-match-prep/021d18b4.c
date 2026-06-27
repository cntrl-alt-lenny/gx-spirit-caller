/* CAMPAIGN-PREP candidate for func_021d18b4 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed-char ldrsb table; shared row*0x72 mul + col*4; dual u16<<12 stores
 *   risk:       permuter-class: orig keeps row*0x72 (lr) and col*4 (ip) in separate regs, adds each base then indexes by ip; mwcc may fold base+off differently, reordering the two ldrh/mul. signed-char load is the key correctness lever.
 *   confidence: med
 */
/* func_ov011_021d18b4 (ov011, cls D): a 2-byte SIGNED record at table35ac
 * [arg0-1] gives (row=sb0-1, col=sb1-1). row*0x72 (mul, shared) + col*4
 * indexes parallel u16 tables 3374/3376 (adjacent shorts); each <<12 into
 * *out1/*out2. data35ac MUST be signed char (ldrsb). out1=r1, out2=r2. */

extern signed char data_ov011_021d35ac[];
extern char        data_ov011_021d3374[];
extern char        data_ov011_021d3376[];

void func_ov011_021d18b4(int a0, int *out1, int *out2) {
    int i    = a0 - 1;
    int row  = data_ov011_021d35ac[i * 2] - 1;
    int col  = data_ov011_021d35ac[i * 2 + 1] - 1;
    int base = row * 0x72;
    int off  = col * 4;
    *out1 = *(unsigned short *)(data_ov011_021d3374 + base + off) << 0xc;
    *out2 = *(unsigned short *)(data_ov011_021d3376 + base + off) << 0xc;
}
