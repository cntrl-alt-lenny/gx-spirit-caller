/* data_ov012_021cc3d0 (20 bytes, 4-aligned): overlay-lifecycle step
 * function table (4 slots + NULL terminator) for Ov012_RunStepFn.
 * Consumer: src/overlay012/func_ov012_021cc01c.c:11,14 (already SHIPPED
 * & matched: `typedef int (*Ov012StepFn)(void); extern Ov012StepFn
 * data_ov012_021cc3d0[]; Ov012StepFn fn = data_ov012_021cc3d0[
 * data_021040ac.fb6c];`; relocs.txt from:0x021cc068 kind:load
 * to:0x021cc3d0).
 * Per-word relocs (ov012/relocs.txt:475-478):
 *   +0x00 -> func_ov012_021c9f48 (Ov012_InitGpu, map overlay012.md:17)
 *   +0x04 -> func_ov012_021ca964 (Ov012_Init, map overlay012.md:26)
 *   +0x08 -> func_ov012_021cb49c (Ov012_UpdateMain, map overlay012.md:33)
 *   +0x0c -> Ov012_BeginIntroTransition (already NAMED+MATCHED,
 *            src/overlay012/Ov012_BeginIntroTransition.c: `int
 *            Ov012_BeginIntroTransition(void) { ...; return 1; }` --
 *            confirms the Ov012StepFn=int(void) signature directly)
 *   +0x10 -> 0 (terminator, no reloc)
 * Reuses the Ov012StepFn typedef verbatim from the consumer (per this
 * project's rule to reuse an already-declared typedef); extern char +
 * cast for the not-fully-matched targets, matching the D-1 recipe.
 * Kept non-const (.data ground truth).
 */

typedef int (*Ov012StepFn)(void);

extern char func_ov012_021c9f48;
extern char func_ov012_021ca964;
extern char func_ov012_021cb49c;
extern int Ov012_BeginIntroTransition(void);

Ov012StepFn data_ov012_021cc3d0[5] = {
    (Ov012StepFn)&func_ov012_021c9f48,
    (Ov012StepFn)&func_ov012_021ca964,
    (Ov012StepFn)&func_ov012_021cb49c,
    Ov012_BeginIntroTransition,
    0,
};
