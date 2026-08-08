/* data_ov011_021d2fb4 / _021d2fbe (20 bytes, 0x021d2fb4-0x021d2fc8):
 * TU-COMPOSITION carve (see docs/research/alignment-wall-tu-composition-
 * recipe.md) -- 2 adjacent 2-byte-misaligned .rodata symbols, combined
 * span 4-aligned at both ends (start%4==0, end%4==0, size 20 == 4*5),
 * carved as 2 separate named globals of the same 10-byte layout, in
 * address order, in this one TU (cm-restock-carve-4 Part 1 screen: PASS).
 *
 * WRAPPED IN A STRUCT, NOT DECLARED AS A RAW ARRAY -- a real mwcc section-
 * splitting finding, distinct from the n>2 declaration-reordering risk
 * this same wave hit elsewhere (see data_ov005_021b1a44.c and siblings).
 * A first draft declared each symbol as a bare `const unsigned char
 * name[10]` (this project's normal convention for a solo byte-array
 * TU, e.g. the sibling data_ov011_021d2fe4.c). Compiling THAT draft and
 * inspecting the .o showed mwcc emits raw top-level array-of-primitive
 * globals into their OWN separate .rodata input section each -- here,
 * TWO 10-byte sections (each individually %4==2 sized) instead of ONE
 * combined 20-byte section -- which would silently defeat the whole
 * composition (each 10-byte section independently hits the ALIGNALL(2)
 * wall at link time, exactly as if this file had never been composed at
 * all). Isolated the cause with a throwaway scratch test: reproduces
 * identically whether or not `const` is present (so it is NOT a
 * const-vs-.data distinction), and disappears completely when each
 * array is wrapped in a trivial one-field struct -- wrapped globals
 * compile into ONE shared section with declaration order preserved.
 * This is therefore purely a "top-level array-typed global" mwcc
 * quirk; every other composed file this wave uses struct types already
 * (even for its array MEMBERS, e.g. data_ov016_021b9374.c's
 * `Ov016TouchCellSm data_ov016_021b937e[3]`), which is why only this
 * pair hit it.
 *
 * Section: config/eur/arm9/overlays/ov011/delinks.txt:2 confirms
 * `.rodata start:0x021d2f90 end:0x021d3620` -- covers both symbols, so
 * BOTH are `const`.
 *
 * Both are real, independently-addressed 5-slot per-actor-slot byte-pair
 * tables (OV011_ACTOR_TABLE_COUNT = 5; docs/research/retriage/
 * OverlayEFRetriage.md, dossiers 021cb3b4.md/021cca04.md), each consumed
 * via `table[slot*2]` / `table[slot*2+1]` byte indexing -- not an
 * artificial pairing, and not the same record "type" as run 1 (flat
 * per-slot byte arrays, no shared struct needed):
 *
 *  - data_ov011_021d2fbe: CAMPAIGN-PREP draft docs/research/c-match-prep/
 *    021ca538.c (func_ov011_021ca538, brief 496, UNVERIFIED/unlanded)
 *    already declares `extern unsigned char data_ov011_021d2fbe[];` and
 *    reads `buf[i][0]=data[i*2]; buf[i][1]=data[i*2+1];` for i=0..4,
 *    copying into a local `u8 buf[5][2]` used to select a Q12
 *    rotation-matrix pair by `idx=(s8)data_4000[0x2bc]-1` before calling
 *    func_0208e334. Confirmed by relocs.txt:105 `from:0x021ca5f4
 *    kind:load to:0x021d2fbe module:overlay(11)`.
 *  - data_ov011_021d2fb4: consumed by func_ov011_021cb574 (1520-byte
 *    permanent GLOBAL_ASM cross-overlay-BL wall, brief 192/197/209 -- no
 *    mnemonic .s or .c exists or ever will). Hand-decoded directly from
 *    the raw opcode words (cross-checked against relocs.txt:316
 *    `from:0x021cbb4c kind:load to:0x021d2fb4`, the exact literal-pool
 *    slot address): `ldr r5,[pc,#0x384]` at 0x021cb7c0 loads the base
 *    pointer, part of a 5-wide consecutive literal-pool load alongside
 *    data_ov011_021d41a0 / _021d2ff8 / _021d2fe4 / func_ov011_021cc4c8
 *    (relocs.txt:312-315 -- the same cluster independently documented by
 *    the already-shipped sibling file data_ov011_021d2fe4.c). Then, per
 *    loop index r9=idx: `add r0,r5,r9,lsl#1` (0x021cb7fc) computes
 *    `&data_ov011_021d2fb4[idx*2]`; `ldrb r2,[r0,#1]` (0x021cb800) and
 *    `ldrb r1,[r5,r9,lsl#1]` (0x021cb804) read the high and low bytes of
 *    slot idx separately, passed as args to `func_ov000_021ac508(
 *    data_ov011_021d41a0, lowbyte, highbyte, ...)` (0x021cb80c) -- the
 *    identical table[idx*2]/table[idx*2+1] byte-pair shape as the proven
 *    sibling, in the same per-actor-slot loop that also walks
 *    data_ov011_021d41a0/_021d2fe4/_021d2ff8 by stride 4 and forwards a
 *    callback pointer (func_ov011_021cc4c8) to func_ov000_021ac478/
 *    _021ac530.
 */

typedef struct {
    unsigned char b[10];
} Ov011Bytes10;

const Ov011Bytes10 data_ov011_021d2fb4 = {{
    0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x03, 0x00, 0x04, 0x00,
}};

const Ov011Bytes10 data_ov011_021d2fbe = {{
    0x8e, 0x8b, 0x31, 0x8d, 0x88, 0xd6, 0xd9, 0x92, 0xa6, 0x2f,
}};
