/* data_ov017_021b80c8 (12 bytes, 4-aligned): one "Box" record -- reuses the
 * EXACT Box{f0,f2,f4,f6,f8,fa} type already shipped in the matched
 * src/overlay017/func_ov017_021b4090.c (its 4th param is `Box *src`).
 *
 * f0/f2 are confirmed Rect x/y and f4 the packed Rect{w,h} byte pair (w=h=
 * 0x1a=26) by the sibling hit-test consumer src/overlay017/
 * func_ov017_021b2ce4.c (`r->x`, `r->y`, `r->w`, `r->h` on the same pointer;
 * see docs/research/types/Rect.md, offsets 0/2/4/5). f6/f8 are read and
 * forwarded verbatim by func_ov017_021b4090.c (`local.f6=src->f6;
 * local.f8=src->f8;`) -- same offsets as ov016's cellW/cellH (see
 * data_ov016_021b9014 above), though this consumer doesn't interpret them
 * further. fa (offset 10) is unread by any confirmed reader, matching
 * docs/research/types/HitRect.md's documented trailing `attr` slot at the
 * same offset.
 * Consumer: src/overlay017/func_ov017_021b312c.s:32 (`ldr r5, _LIT1`) --
 * hit-test via func_ov017_021b2ce4, then `mov r3,r5;
 * bl func_ov017_021b4090` (Box* forward, mode 0xe).
 * (config/eur/arm9/overlays/ov017/relocs.txt:161,
 *   from:0x021b33bc kind:load to:0x021b80c8 module:overlay(17)).
 * Pre-existing writeup: docs/research/retriage/Ov017Ov019Retriage.md,
 * 0x021B312C section ("data_ov017_021b80c8 ... confirmed Rect struct").
 * Section: .data start:0x021b8020 end:0x021b8520 -- inside, so NOT const.
 */
typedef struct {
    unsigned short f0, f2, f4, f6, f8, fa;
} Box;

Box data_ov017_021b80c8 = { 228, 165, 0x1a1a /* w=h=0x1a packed LE */, 2, 1, 0 };
