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
extern char data_ov020_021ae060[];   /* Quiz state struct: +0x8d8 page count,
                                       * +0x910 stage, +0x96c sprite-set,
                                       * +0xa50/+0xa94 sub-state             */
extern char data_ov020_021adf68[];   /* file-path / archive handle table     */
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
 *  permuter/.s lane, brief 328's actual intent):
 *  - INLINE TILEMAP-FILL nested loops: every instruction matches but the
 *    {row,p,tile,col}->{lr,r2,r3,r12} mapping is rotated; declaration-order
 *    reorder makes it WORSE. (021aae64, 021ab364, 021ab43c [364/43c siblings,
 *    attr 0xf000/0xe000]; also 021ab0d8)
 *  - OBJ-DISPATCH stack-arg builders: 59% near-miss; mwcc hoists the pool load
 *    / picks a different temp for the (idx*0x28+K)<<12 pair value; source
 *    reorder (handle temp) does not move it. (021ab8f8/964/aba54/abac0 [4 sib,
 *    params: add-const, pair[0], func_0207e638 kind, z0]; 021abb94)
 *  - script-step dispatcher 021ada1c: gotcha-20 block layout (predicated
 *    return-1 vs forward-branch) + post-call field-address pooling on the
 *    +0xb6c re-read.
 * ======================================================================= */

#endif /* OV020_CORE_H */
