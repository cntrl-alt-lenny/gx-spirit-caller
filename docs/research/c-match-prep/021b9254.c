/* CAMPAIGN-PREP candidate for func_021b9254 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :2 bitfield-inc (cnt+=1), packed a*2+b index, store-order +4/+6/+8, ternary flag
 *   risk:       struct-guessed: Key field bit-positions (a:8@22, b:1@13) and d0250 Rec layout inferred from shifts; if a/b widths/offsets wrong the lsl/lsr decode diverges. Also reg-alloc heavy (8 callee regs) so a mul/add scheduling slip is permuter-class.
 *   confidence: low
 */
/* func_ov002_021b9254 (ov002, cls D, MED). Build slot record for player(arg0&1)
 * row arg1: zero-init via 0229cd5c, copy *ptr via 021b91c4, stamp a global
 * counter (d016c+0xce8, pre-inc) into +4 and arg3/arg4 into +6/+8. Then bump a
 * :2 counter in the d0250 record indexed by the packed (a*2+b) key, set bit21 of
 * the cf1ac flag word, and notify 021c9b80 twice. */
typedef unsigned short u16;
typedef unsigned int   u32;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1ac[];
extern char data_ov002_022d016c[];
extern char data_ov002_022d0250[];

extern void func_ov002_0229cd5c(void *p, int x);
extern void func_ov002_021b91c4(int *dst, const int *src);
extern void func_ov002_021c9b80(int player, int idx, int bit, int set);

struct Ov002Key  { u32 : 13; u32 b : 1; u32 : 8; u32 a : 8; u32 : 2; };
struct Ov002Rec  { u16 id : 13; u16 cnt : 2; u16 hi : 1; u16 pad; };
struct Ov002Init { int id; u16 f4; u16 f6; u16 f8; };

void func_ov002_021b9254(int player, int idx, int *ptr, int arg3, int arg4) {
    char *base = data_ov002_022cf16c + (player & 1) * 0x868;
    struct Ov002Init *slot = (struct Ov002Init *)(base + 0x30 + idx * 0x14);
    struct Ov002Key *k = (struct Ov002Key *)ptr;
    int cnt;
    func_ov002_0229cd5c(slot, 0x14);
    func_ov002_021b91c4((int *)slot, ptr);
    cnt = (*(int *)(data_ov002_022d016c + 0xce8) += 1);
    slot->f4 = (u16)cnt;
    slot->f6 = (u16)arg3;
    slot->f8 = (u16)arg4;
    ((struct Ov002Rec *)data_ov002_022d0250)[k->a * 2 + k->b].cnt += 1;
    *(int *)(data_ov002_022cf1ac + (player & 1) * 0x868 + idx * 0x14) |= 0x200000;
    func_ov002_021c9b80(player, idx, 8, arg4);
    func_ov002_021c9b80(player, idx, 0,
                        (player != (int)((struct Ov002Key *)ptr)->b) ? 1 : 0);
}
