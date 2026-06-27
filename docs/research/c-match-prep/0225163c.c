/* CAMPAIGN-PREP candidate for func_0225163c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     node f2lo :4 bitfield (lsl28/lsr28); (unsigned short)p>>8&0xff keeps the and; head from cf1a6 +arg2*20
 *   risk:       Compiled+disasm: body matches orig nearly insn-for-insn; the (unsigned short)p cast recovers orig's and #0xff. Sole diff: player in r7 vs orig r9 (register rotation). permuter-class but very close.
 *   confidence: med
 */
/* func_ov002_0225163c: walk the cf1a6-headed d0650 node list; for each node
 * with f2lo<6 and f0==arg1 whose func_021b947c mid-byte is 0xe, post kind-0xe. */
struct Ov002Node { unsigned short f0; unsigned short f2lo : 4; unsigned short f4; unsigned short next; };
extern int func_ov002_021b947c(int a);
extern int func_ov002_021c33e4(int player, int a, int b);
extern int func_ov002_02253458(int a, int b, int c);
extern char data_ov002_022cf1a6[];
extern struct Ov002Node data_ov002_022d0650[];
void func_ov002_0225163c(int player, int arg1, int arg2) {
    unsigned short cur =
        *(unsigned short *)(data_ov002_022cf1a6 + (player & 1) * 0x868 + arg2 * 20);
    while (cur != 0) {
        struct Ov002Node *n = &data_ov002_022d0650[cur];
        cur = n->next;
        if (n->f2lo < 6 && n->f0 == arg1) {
            int p = func_ov002_021b947c(n->f4);
            if ((((unsigned short)p >> 8) & 0xff) == 0xe) {
                int lo = p & 0xff;
                unsigned int hi = (unsigned int)p >> 16;
                if (func_ov002_021c33e4(player, lo, hi))
                    func_ov002_02253458(lo, 0xe, hi);
            }
        }
    }
}
