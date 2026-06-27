/* CAMPAIGN-PREP candidate for func_02280ad8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :13 bitfield→lsl;lsr, mla base inline, ldrh-branch then max if-assign
 *   risk:       two cursors r6(+0x30,+0x14) and r7(slot,+0x14); the `ldrh [r7,#0x36]` branch picks f18-vs-f14 — mwcc must keep call before the ldrh test. struct-guessed (active :13 @0x30, f36 @0x36, buf 0x14/0x18).
 *   confidence: med
 */
extern char data_ov002_022cf16c[];
extern int func_ov002_0227b090(int a, int b, void *c);

struct Slot {
    char pad0[0x30];
    unsigned int active : 13;
    char pad34[0x36 - 0x34];
    unsigned short f36;
};

struct Res {
    char pad0[0x14];
    int f14;
    int f18;
};

int func_ov002_02280ad8(int a)
{
    struct Slot *slot;
    int i;
    int acc;
    struct Res buf;

    slot = (struct Slot *)(data_ov002_022cf16c + (a & 1) * 0x868);
    acc = 0;
    for (i = 0; i < 5; i++) {
        if (slot[i].active != 0) {
            func_ov002_0227b090(a, i, &buf);
            if (slot[i].f36 != 0) {
                if (acc <= buf.f18)
                    acc = buf.f18;
            } else {
                if (acc <= buf.f14)
                    acc = buf.f14;
            }
        }
    }
    return acc;
}
