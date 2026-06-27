/* CAMPAIGN-PREP candidate for func_021b9368 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: mla-fused base, :2 cnt+=1, packed a*2+b, if-assign flag1 vs ternary flag2, store-order
 *   risk:       reshape-able vs permuter: flag1 must stay if-assign (movne only) and flag2 ternary (movne+moveq) — swap if mwcc inverts. struct-guessed: same Key/Rec bit layout as 021b9254; mla-vs-mul fusion of (arg0&1)*0x868 may not reproduce.
 *   confidence: low
 */
/* func_ov002_021b9368 (ov002, cls D, MED). Sibling of 021b9254 but mla-fused
 * addressing and a different store/notify set: slot+6=0, slot+8=arg3, slot+0xc=0,
 * then three 021c9b80 calls (bit0 = player!=key.b via if-assign; bit0x14 =
 * arg3==0; bit8 = arg3). Same d0250 :2 counter bump on the packed (a*2+b) key. */
typedef unsigned short u16;
typedef unsigned int   u32;

extern char data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
extern char data_ov002_022d0250[];

extern void func_ov002_0229cd5c(void *p, int x);
extern void func_ov002_021b91c4(int *dst, const int *src);
extern void func_ov002_021c9b80(int player, int idx, int bit, int set);

struct Ov002Key  { u32 : 13; u32 b : 1; u32 : 8; u32 a : 8; u32 : 2; };
struct Ov002Rec  { u16 id : 13; u16 cnt : 2; u16 hi : 1; u16 pad; };
struct Ov002Init { int id; u16 f4; u16 f6; u16 f8; int fc; };

void func_ov002_021b9368(int player, int idx, int *ptr, int arg3) {
    char *base = data_ov002_022cf16c + (player & 1) * 0x868;
    struct Ov002Init *slot = (struct Ov002Init *)(base + 0x30 + idx * 0x14);
    struct Ov002Key *k = (struct Ov002Key *)ptr;
    int cnt;
    int flag;
    func_ov002_0229cd5c(slot, 0x14);
    func_ov002_021b91c4((int *)slot, ptr);
    cnt = (*(int *)(data_ov002_022d016c + 0xce8) += 1);
    slot->f4 = (u16)cnt;
    slot->f6 = (u16)0;
    slot->f8 = (u16)arg3;
    ((struct Ov002Rec *)data_ov002_022d0250)[k->a * 2 + k->b].cnt += 1;
    slot->fc = 0;
    flag = 0;
    if (player != (int)((struct Ov002Key *)ptr)->b)
        flag = 1;
    func_ov002_021c9b80(player, idx, 0, flag);
    func_ov002_021c9b80(player, idx, 0x14, (arg3 == 0) ? 1 : 0);
    func_ov002_021c9b80(player, idx, 8, arg3);
}
