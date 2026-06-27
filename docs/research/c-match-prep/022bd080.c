/* CAMPAIGN-PREP candidate for func_022bd080 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: switch s[0xc60]; halfword -> :1 bitfield (lsl#31;lsr#31); cmpne-chain; 16x8 kind-0x38 scan.
 *   risk:       struct-guessed: the bitfield source is ldrh [s+0xc68] then `lsl#31;lsr#31` — a :1 bitfield reproduces lsl/lsr but mwcc may instead emit `and #1`; offsets 0xc68/0x924 (=0xc00+0x68, 0x124+0x800) are inferred. The cmpne-chain order must hold.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_022bd080 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. State machine on s[0xc60] (jump-table 0..4).
 * State 2 packs a halfword field into a :1 bitfield arg (lsl#31;lsr#31 = (x&1) but
 * via the bitfield idiom). State 3 has a 3-way cmpne chain + a 16x8 table scan for
 * kind==0x38. Cross-checked vs src/overlay002/func_ov002_022bd080.s. */
extern char data_ov002_022ccfec[];
extern char data_ov002_022d1af8[];
extern char data_ov002_022d28fc[];
extern void func_02037208(int, int, int, int);
extern void func_020a978c(int, int);
extern void func_ov002_022bdb88(int, int, int, int, int);

struct Bf022bd080 { unsigned int bit : 1; };

int func_ov002_022bd080(int *s) {
    int i;
    int *e;
    int found;
    int c64;
    switch (s[0xc60 / 4]) {
    case 1:
        *(int *)(data_ov002_022d1af8 + 4) = 0;
        s[0xc60 / 4] = 1;
        s[0xc64 / 4] = 0;
        break;
    case 2:
        if (s[0xc64 / 4] < 0xf)
            break;
        {
            unsigned short h = *(unsigned short *)((char *)s + 0xc68);
            struct Bf022bd080 bf;
            bf.bit = h;
            func_ov002_022bdb88((int)data_ov002_022d28fc, 0x38, bf.bit, 0, 0);
        }
        func_020a978c((int)s + 0x924, (int)data_ov002_022ccfec);
        s[0xc60 / 4] = 2;
        s[0xc64 / 4] = 0;
        break;
    case 3:
        c64 = s[0xc64 / 4];
        if (c64 == 0xa || c64 == 0x19 || c64 == 0x28)
            func_02037208(0x33, -1, 0, 1);
        e = (int *)data_ov002_022d28fc;
        found = 0;
        for (i = 0; i < 0x10; i++) {
            if (e[0] != 0 && e[1] == 0x38) { found = 1; break; }
            e += 2;
        }
        if (!found) {
            s[0xc60 / 4] = 3;
            s[0xc64 / 4] = 0;
        }
        break;
    case 4:
        if (s[0xc64 / 4] < 0xf)
            break;
        s[0xc60 / 4] = 4;
        s[0xc64 / 4] = 0;
        break;
    case 5:
        *(int *)(data_ov002_022d1af8 + 4) = 1;
        s[0xcc8 / 4] = 0xc;
        s[0xc54 / 4] = 0;
        return 0;
    default:
        break;
    }
    s[0xc64 / 4]++;
    return 1;
}
