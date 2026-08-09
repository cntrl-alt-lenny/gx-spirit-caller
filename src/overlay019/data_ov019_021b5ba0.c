/* cm-restock-carve-4 Part 1, run 1/2: TU-composition carve of ov019's
 * 2-symbol, both-ends-4-aligned run at 0x021b5ba0-0x021b5bc8 (40 bytes),
 * screened PASS by docs/research/data/cm-restock-carve-4-2026-08-08.md
 * Part 1 (0x021b5ba0 start%4==0, 0x021b5bc8 end%4==0). Recipe:
 * docs/research/alignment-wall-tu-composition-recipe.md; style/precedent
 * model: src/overlay016/data/data_ov016_021b9000.c (same "N adjacent
 * misaligned symbols really are one dsd-split record array" shape).
 *
 * data_ov019_021b5ba0 (10 bytes) and data_ov019_021b5baa (30 bytes) are
 * BOTH real, independently-addressed symbols -- not an artificial
 * pairing. config/eur/arm9/overlays/ov019/relocs.txt:148-149 and :212-213
 * record 4 literal-pool loads of exactly these 2 addresses, from 2
 * functions:
 *
 *   - src/overlay019/func_ov019_021b3068.s: loads data_ov019_021b5ba0
 *     into r5 and passes it AS-IS (r0=r5) to func_ov019_021b2728(Rect*)
 *     (line 31->34); separately loads data_ov019_021b5baa into r4 and
 *     ALSO passes it AS-IS to func_ov019_021b2728 (line 54->71, guarded
 *     by an unrelated flag check). A 3rd site (.L_12c, line 100-115)
 *     computes `r3 = (2 - [sl+0x434])*10 + &data_ov019_021b5ba0` (mov
 *     r0,#0xa; mla r3,r2,r0,r3 -- a 10-byte stride) and passes the
 *     result as a 4th arg to func_ov019_021b3f34; since [sl+0x434]
 *     is checked against 1/2 immediately above (cmp r0,#0x2 / moveq /
 *     movne), the computed index only ever lands on 0 or 1 -- i.e.
 *     &data_ov019_021b5ba0 or &data_ov019_021b5baa itself, confirming
 *     both symbols are elements of ONE 10-byte-stride record array
 *     (dsd just split it at the 2 addresses that happen to also be
 *     referenced directly, exactly like data_ov016_021b9000's proven
 *     precedent).
 *   - src/overlay019/func_ov019_021b35dc.s: loads data_ov019_021b5ba0
 *     (.L_9b8, line 311->313) and data_ov019_021b5baa (.L_9d8, line
 *     320->322) and passes EACH directly to func_ov019_021b27a0(Rect*).
 *
 * func_ov019_021b2728.c and func_ov019_021b27a0.c (both already matched,
 * SS_VERIFIED in ov019_core.h) declare the parameter as
 * `typedef struct { unsigned short x, y; unsigned char w, h; } Rect;`
 * and dereference exactly r->x/r->y/r->w/r->h. Since both functions are
 * called with data_ov019_021b5ba0 AND data_ov019_021b5baa's own base
 * addresses directly (not just the computed index), this proves BOTH
 * symbols open with a 6-byte Rect (x:u16, y:u16, w:u8, h:u8) at their
 * own address.
 *
 * src/overlay019/func_ov019_021b3f34.s dereferences its 4th-arg record
 * pointer (r3) at +0x0 (ldrh r4,[r3], line 12), +0x2 (ldrh lr,[r3,#2],
 * line 17), +0x6 (ldrh ip,[r3,#6], line 20) and +0x8 (ldrh ip,[r3,#8],
 * line 22) -- reading them into a local 6xu16 struct (func_ov019_
 * 021b3f00.c's sibling `struct P021b3f00 { u16 f0,f2,gap4,f6,f8,gap10; }`,
 * same helper func_ov019_021b3e38) and forwarding it onward. +0x4 (the
 * Rect's own w/h bytes) is never read as a u16 here -- the same "every
 * offset except +4" shape data_ov016_021b9000.c's own record type
 * found. func_ov019_021b3f34 is called (from func_ov019_021b3068.s)
 * with r3 = data_ov019_021b5ba0 directly (line 42->44), r3 =
 * data_ov019_021b5baa directly (line 80->82), AND the computed-index
 * pointer (line 115) -- so the f6/f8 fields are directly proven for
 * BOTH symbols' own base address; field names "f6"/"f8" reuse
 * func_ov019_021b3f00.c's own established naming for the same
 * downstream struct.
 *
 * Combined record type (10 bytes): x(u16) y(u16) w(u8) h(u8) f6(u16)
 * f8(u16) -- proven for record index 0 (data_ov019_021b5ba0) and index
 * 1 (data_ov019_021b5baa's own first 10 bytes). data_ov019_021b5baa is
 * 30 bytes = 3 such records (index 1, 2, 3); ONLY index 1 has direct
 * per-field dereference proof above. Indices 2 and 3 (data_ov019_
 * 021b5baa's own local offsets +10 and +20) are never reached by any
 * traced consumer (the only computed-index access is capped to indices
 * 0/1, per the field's 1/2 comparison above) -- their bytes are real,
 * gate-extracted ROM bytes (extract/eur/arm9_overlays/ov019.bin via
 * extract_bytes.py, MATCH against build/eur/build/arm9_ov019.bin), but
 * the record-shaped typing of indices 2/3 is a structural inference
 * from the proven uniform 10-byte stride, not an individually-
 * dereferenced fact -- flagged honestly, mirroring data_ov016_021b9000.c's
 * own disclosure of its unread +4 field and out-of-scope 3rd element.
 *
 * Coincidental cross-overlay alias (screened per this wave's method):
 * `data_ov015_021b5ba0` also exists at the identical numeric address
 * 0x021b5ba0, because ov015 and ov019 share the same overlay load
 * address (both 0x021b2280, confirmed via extract_bytes.py's load_addr
 * for each module). config/eur/arm9/overlays/ov015/relocs.txt:78,83,455
 * and symbols.txt:81 show it is ov015's OWN, wholly unrelated 16-byte
 * `struct D619`/pointer table -- correctly excluded, not evidence for
 * ov019's data.
 *
 * Section: config/eur/arm9/overlays/ov019/delinks.txt:5 --
 * `.data start:0x021b5b20 end:0x021b5e20` -- both addresses fall inside
 * .data, so neither symbol may be `const`. Both-ends alignment: 0x021b5ba0
 * %4==0, 0x021b5bc8%4==0, combined span 40 bytes (a multiple of 4) --
 * PASS per cm-restock-carve-4 Part 1's screen (row "ov019:
 * 021b5ba0,021b5baa").
 *
 * Bytes: extracted via extract_bytes.py from extract/eur/arm9_overlays/
 * ov019.bin (pristine), cross-checked MATCH against build/eur/build/
 * arm9_ov019.bin.
 *
 * OPEN VERIFICATION NOTE: the proven recipe
 * (alignment-wall-tu-composition-recipe.md) tested exactly 2 SCALAR
 * globals of the same type in one TU. This file composes 1 scalar +
 * 1 THREE-ELEMENT ARRAY of the same 10-byte record type -- an untested
 * variant. Needs the standard ninja/objdiff/sha1 gate (declaration-order
 * preservation is the specific risk the recipe doc flags) before
 * shipping.
 */

typedef struct {
    unsigned short x;
    unsigned short y;
    unsigned char w;
    unsigned char h;
    unsigned short f6;
    unsigned short f8;
} Ov019TouchRect021b5ba0;

Ov019TouchRect021b5ba0 data_ov019_021b5ba0 = { 0x00e4, 0x00a5, 0x1a, 0x1a, 0x0002, 0x0000 };

Ov019TouchRect021b5ba0 data_ov019_021b5baa[3] = {
    { 0x00a4, 0x00a5, 0x28, 0x18, 0x0002, 0x0000 },
    { 0x00e8, 0x0008, 0x18, 0x14, 0x0001, 0x0000 },
    { 0x00e8, 0x0083, 0x18, 0x14, 0x0001, 0x0000 },
};
