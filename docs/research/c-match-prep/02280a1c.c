/* CAMPAIGN-PREP candidate for func_02280a1c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :13 bitfield→lsl;lsr, mla base inline, max via if-assign, store order out2/out1
 *   risk:       orig keeps two cursors (r5 at +0x30 stepping +0x14, r6 the slot base) — mwcc may fold to one indexed addr; also out2/out1 zero-store order is fixed. struct-guessed (active :13 @0x30, f38 @0x38, buf 0x14/0x18).
 *   confidence: med
 */
extern char data_ov002_022cf16c[];
extern int func_ov002_0227b090(int a, int b, void *c);

struct Slot {
    char pad0[0x30];
    unsigned int active : 13;
    char pad34[0x38 - 0x34];
    unsigned short f38;
};

struct Res {
    char pad0[0x14];
    int f14;
    int f18;
};

void func_ov002_02280a1c(int a, int *out1, int *out2, int flag)
{
    struct Slot *slot;
    int i;
    struct Res buf;

    slot = (struct Slot *)(data_ov002_022cf16c + (a & 1) * 0x868);
    i = 0;
    *out2 = 0;
    *out1 = 0;
    for (i = 0; i < 5; i++) {
        if (slot[i].active != 0) {
            if (slot[i].f38 != 0 || flag != 0) {
                func_ov002_0227b090(a, i, &buf);
                if (*out1 <= buf.f14)
                    *out1 = buf.f14;
                if (*out2 <= buf.f18)
                    *out2 = buf.f18;
            }
        }
    }
}
