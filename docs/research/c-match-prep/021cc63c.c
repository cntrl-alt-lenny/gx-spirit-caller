/* CAMPAIGN-PREP candidate for func_021cc63c (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     S bound once (r4); :3 bitfield => lsl#29;lsr#29; state read once (reused arm2 / reloaded arm3 post-call); loop k*0x20 not strength-reduced
 *   risk:       reshape-able: the :3 bitfield must emit lsl#29;lsr#29 (a plain &7 would give `and`); secondary — the many conditional-return ldmne guard-chains and S+0xb0=-1 (sub-from-0 reuse vs mvn) ordering. struct-guessed offsets.
 *   confidence: low
 */
/* func_ov004_021cc63c: void state update on the global struct S@0220b500.
 * Zero S+0x9c/0xa0, set S+0xb0=-1. Return if S[0x8c]<=0x100. Else seed
 * S+0xb8=5, S+0xc0=(:3 bitfield of byte 02104f4c+0xa3c), S+0xbc=
 * *(02104f4c+0xa64); func_020aadf8(S+0xc1, 02105989); zero S+k*0x20+0xb8
 * for k=1..4; S+0xa4=0. Dispatch on state=S[0x54]: 2 -> advance/spawn,
 * 3 -> tick/retreat. */
extern char data_02104f4c[];
extern char data_02105989[];
extern char data_ov004_0220b500[];
extern int  func_0201cfa0(void);
extern void func_020aadf8(void *dst, void *src);
extern int  func_ov004_021cc2f0(void);
extern int  func_ov004_021cc3c0(void);
extern void func_ov004_021cc49c(void);

struct Ov004Bits3 { unsigned char f : 3; };

void func_ov004_021cc63c(void) {
    char *S = data_ov004_0220b500;
    int state;
    *(int *)(S + 0x9c) = 0;
    *(int *)(S + 0xa0) = 0;
    *(int *)(S + 0xb0) = -1;
    if (*(int *)(S + 0x8c) <= 0x100)
        return;
    *(int *)(S + 0xb8) = 5;
    *(unsigned char *)(S + 0xc0) =
        ((struct Ov004Bits3 *)(data_02104f4c + 0xa3c))->f;
    *(int *)(S + 0xbc) = *(int *)(data_02104f4c + 0xa64);
    func_020aadf8(S + 0xc1, data_02105989);
    {
        int k;
        for (k = 1; k < 5; k++)
            *(int *)(S + k * 0x20 + 0xb8) = 0;
    }
    state = *(int *)(S + 0x54);
    *(int *)(S + 0xa4) = 0;
    if (state == 2) {
        if (*(int *)(S + 0x74) != 0) {
            *(int *)(S + 0x54) = state + 1;
            return;
        }
        if (*(int *)(S + 0x8c) != 0x200)
            return;
        *(int *)(S + 0x9c) = func_ov004_021cc2f0();
        *(int *)(S + 0xa0) = func_ov004_021cc3c0();
    } else if (state == 3) {
        if (func_0201cfa0() != 0) {
            if (*(int *)(S + 0x8c) == 0x200 && *(int *)(S + 0x94) == 5)
                func_ov004_021cc49c();
        } else {
            *(int *)(S + 0x74) = 0;
            *(int *)(S + 0x54) = state - 1;
        }
    }
}
