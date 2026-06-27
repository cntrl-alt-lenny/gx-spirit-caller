/* CAMPAIGN-PREP candidate for func_0224db94 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     manual shift-decode to mirror exact lsl/lsr; mla base via +0x120; reload word
 *   risk:       reshape-able: the packed decode is written as explicit shifts to force lsl#2/lsr#24/lsl#18; if mwcc fuses differently, express via :6/:1 bitfields. Also struct-guessed offset 0x120.
 *   confidence: med
 */
// func_ov002_0224db94: packed-field decode + predicate calls, class D
// entry decode: ((bits[29:24])<<1) | bit13  -> bitfield struct
extern int func_0202e234(int id);
extern int func_ov002_021b9128(int id, int arg);
extern int func_ov002_021ca5bc(int code);
extern void func_ov002_02253458(int who, int kind, int idx);

typedef struct {
    unsigned int id   : 19; // [18:0]
    unsigned int b13  : 1;  // bit 13? no: packed below
    unsigned int mid  : 5;  // [23:19]
    unsigned int hi6  : 6;  // [29:24]
    unsigned int top  : 2;  // [31:30]
} Ov002Entry2;

typedef struct {
    unsigned char pad0[0x120];
    Ov002Entry2 entries[1]; // +0x120
} Ov002Scan2;

extern int data_ov002_022cf16c; // struct base word (player 0)

void func_ov002_0224db94(int who, int unused, int idx) {
    Ov002Scan2 *s;
    unsigned int word, code;
    unsigned int id;
    s = (Ov002Scan2 *)((char *)&data_ov002_022cf16c + (who & 1) * 0x868 + 0x120);
    s = (Ov002Scan2 *)((char *)s - 0x120); // keep base; entries at +0x120
    word = ((unsigned int *)((char *)s + 0x120))[idx];
    id = (word << 13) >> 13;                 // [18:0]
    if (!func_0202e234(id)) return;
    if (!func_ov002_021b9128(id, 1)) return;
    code = (((word << 2) >> 24) << 1) + ((word << 18) >> 31); // (hi6<<1)|bit13
    if (!func_ov002_021ca5bc(code)) return;
    func_ov002_02253458(who, 0xb, idx);
}
