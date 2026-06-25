/* CAMPAIGN-PREP candidate for func_021f980c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield bit0/bit14 eor; per-player (flag&1)*0x868 stride; if/else-if state dispatch; do-while loop
 *   risk:       loop-bound mismatch: orig pre-checks cf178 count (bls) but back-edge reloads row->limit; mwcc may merge/hoist differently. permuter-class scheduling near-miss.
 *   confidence: low
 */
/* func_ov002_021f980c (ov002, cls C): per-player slot scan + 3-way state
 * dispatch. Reads self->f2 -> parity flag (bit14 ^ bit0); guard 021ff3bc;
 * per-player byte stride (flag&1)*0x868 into cf178 (count) and cf16c (row);
 * scan slots i<row->limit calling 022536e8(flag, self->f0, i); on hit forward
 * to 021f4a84. Then dispatch on ce288.f1460 (state 0/1/else). */

typedef unsigned short u16;

struct Self21f980c { u16 f0; u16 b0 : 1; u16 : 13; u16 b14 : 1; };
struct Row21f980c  { char _a[0xc]; int limit; };
struct Ce21f980c   { char _a[0x5b4]; int f1460; };

extern struct Ce21f980c data_ov002_022ce288;
extern char data_ov002_022cf16c[];   /* per-player row table (0x868 stride) */
extern char data_ov002_022cf178[];   /* per-player count table */

extern int  func_ov002_021ff3bc(struct Self21f980c *self);
extern int  func_ov002_022536e8(int flag, int kind, int i);
extern int  func_ov002_021f4a84(struct Self21f980c *self, int arg1);
extern void func_ov002_021ae400(int a, int b);
extern int  func_ov002_0226b094(int a, int b);

int func_ov002_021f980c(struct Self21f980c *self, int arg1) {
    int flag = self->b14 ^ self->b0;
    int i;
    if (func_ov002_021ff3bc(self) == 0) return -1;
    if (*(unsigned int *)(data_ov002_022cf178 + (flag & 1) * 0x868) != 0) {
        struct Row21f980c *row =
            (struct Row21f980c *)(data_ov002_022cf16c + (flag & 1) * 0x868);
        i = 0;
        do {
            if (func_ov002_022536e8(flag, self->f0, i) != 0)
                return func_ov002_021f4a84(self, arg1);
        } while ((unsigned int)++i < (unsigned int)row->limit);
    }
    if (data_ov002_022ce288.f1460 == 0) {
        func_ov002_021ae400(flag, 0x122);
        data_ov002_022ce288.f1460++;
        return 0;
    }
    if (data_ov002_022ce288.f1460 == 1) {
        func_ov002_0226b094(1 - flag, 0x10d6);
        return -1;
    }
    return -1;
}
