/* ov020_core.h — STARTER SKETCH of the ov020 ("Quiz") per-overlay vocabulary
 * (brief 328 wave 1, the clean-C fallback opened when the permuter/.s lane
 * could not run on the Windows box — see docs/research/brief-328-*.md).
 *
 * ov020 is the Quiz UI/graphics overlay: tilemap-fill loops, OBJ/BG setup via
 * NitroSDK, a small camera state struct, and a script-step dispatcher. Unlike
 * ov011, its accessible tier is DOMINATED by reg-alloc / scheduling / layout
 * near-misses (see §WALL) — i.e. permuter territory. The clean-C yield here is
 * the call-wrapper + simple-loop + predicate subset.
 *
 * §VERIFIED at the bottom is byte-proven (brief 328 wave 1, 7 picks, EUR
 * objdiff 100% + ninja sha1 OK). Entries above are SKETCH.
 */
#ifndef OV020_CORE_H
#define OV020_CORE_H

/* --- work-buffer getters (all take NO args; return a VRAM/work-buffer base;
 *     df0c/e1cc return int, df40/e200 return void*) ----------------------- */
extern void *func_0208df40(void);
extern void *func_0208e200(void);
extern int   func_0208df0c(void);
extern int   func_0208e1cc(void);

/* --- tile/buffer fill sinks --------------------------------------------- */
extern void func_0209448c(int val, void *dest, unsigned int size);  /* DMA-ish fill */
extern void Fill32(int v, void *dst, int size);

/* --- dominant data bases ------------------------------------------------ */
extern char data_ov020_021adf80[];   /* Quiz state struct: +0x8d8 page count,
                                       * +0x910 stage, +0x96c sprite-set,
                                       * +0xa50/+0xa94 sub-state             */
extern char data_ov020_021ade88[];   /* file-path / archive handle table     */
extern char data_ov020_021ae0a8[];   /* secondary state (+0x88c..+0x8d0)     */

/* --- shared NitroSDK / engine sinks (already named in the tree) ---------
 *   func_02006c0c(arc, mode, 0) -> handle     open archive file
 *   func_02006e1c(handle)                      free/close a handle
 *   func_0201d47c(&bgcfg) / func_0201e5b8(&bgcfg)   read / commit BG config
 *   func_02006110(&x, &y)                      read the touch/cursor point
 *   func_0207e638(set, kind) -> spr            acquire an OBJ display item
 *   func_ov020_021aa8f0(a1, a2, spr, *pair, z0, z1)   OBJ position dispatch
 */

/* =======================================================================
 * §VERIFIED — brief 328 wave 1 (7 picks, EUR objdiff fuzzy 100%, ninja sha1
 * OK). Per-pick table in docs/research/brief-328-ov020-clean-c-wave1.md.
 *
 * Shapes that yield clean C here:
 *  - single fill-call wrapper:   021ab0ac (func_0209448c), 021ab418 (Fill32)
 *  - single-call fixed-iter loop: 021aae0c (3x), 021ab06c (18x), 021ab3c8 (4x)
 *      [held loop-invariant consts land in callee-saved regs — matches]
 *  - point-in-rect predicate:    021aa7ac  (func_02006110 + && chain)
 *  - scratch-buffer path open:   021aa6cc  (stack buf + func_02006c0c)
 *
 * §WALL (permuter targets — do NOT grind in clean C; route to the Mac
 *  permuter/.s lane. Brief 330 CONFIRMED these are NOT register-reshape-able
 *  on Windows: the ov005 reshape recipe [if-assign / bind-to-temp / param-
 *  reuse] does NOT transfer — these are scheduling/allocator class, not the
 *  register-CHOICE class the recipe moves):
 *  - INLINE TILEMAP-FILL nested loops: every instruction matches but the
 *    {row,p,tile,col}->{lr,r2,r3,r12} mapping is rotated; the orig reuses a
 *    held zero (`mov r1,lr; mov ip,r1`) for the col init each outer pass — an
 *    allocator artifact. Declaration-order reorder makes it WORSE; no recipe
 *    lever matches the shape. (021aae64, 021ab364/43c [attr 0xf000/0xe000],
 *    021ab0d8)
 *  - OBJ-DISPATCH stack-arg builders (5-member family + variant): 59% — the
 *    whole TAIL matches (incl. the `sub ip,#1` -1 derivation) but mwcc HOISTS
 *    the data_ae060 pool load, fragmenting r0 so the (idx*0x28+K)<<12 pair
 *    value uses a different temp. Brief 330 tried 3 levers (handle-temp,
 *    field-temp, param-reuse-in-place) — ALL 59%, identical codegen. Genuine
 *    scheduling reorder. (021ab8f8/964/aba54/abac0/abb2c [params: add-const,
 *    pair[0], func_0207e638 kind, z0]; 021abb94 [struct-read variant])
 *  - script-step dispatcher 021ada1c: gotcha-20 block layout (predicated
 *    return-1 vs forward-branch) + post-call field-address pooling on the
 *    +0xb6c re-read.
 * ======================================================================= */

/* =======================================================================
 * §VERIFIED — brief 330 wave 2 (6 picks, EUR objdiff 100% + ninja sha1 OK).
 * The reshape pass on the §WALL yielded 0 (all scheduling/allocator class,
 * see above) — these 6 are clean-C MOP-UP that wave 1 deferred as medium,
 * not walls. Per-pick table in docs/research/brief-330-ov020-clean-c-wave2.md.
 *
 *  - BG-CONFIG BUILDER family (4): 021aab7c (seed), 021aabf0, 021aac78,
 *    021aa9e8. Open archive entry via func_02006c0c(*(adf68+off),4,0); fill a
 *    0x28-byte stack BgCfg via func_0201d47c(&cfg); set f14 (u16 priority/
 *    mosaic nibble), f18 (int char-base, & ~0x1c000 | base), optional fc/f10;
 *    commit func_0201e5b8(&cfg); free func_02006e1c(h). LEVER: the field STORE
 *    ORDER must match the orig (`f0` before the 2nd `f14` write) — a plain
 *    statement reorder flipped 93%->100%. cfg escapes (& passed to d47c) so
 *    mwcc re-reads f14 between the two writes (no volatile needed). aabf0/aac78
 *    select the archive offset by a 2-call if/else (branch-tail duplication).
 *  - 021aa67c: path/lang-byte builder; the 3-bit region selector at
 *    data_02104f4c+4 MUST be a real bitfield (`unsigned r:3`) to get orig's
 *    lsl#29;lsr#29 (a plain `& 7` folds to `and #7`; gotcha 25).
 *  - 021ab798: 2-call layout-metrics accessor (per-row params at
 *    adfa4/adfa8[a0], stride 0x10; 5th arg on the stack).
 * ======================================================================= */

#endif /* OV020_CORE_H */
