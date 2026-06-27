/* CAMPAIGN-PREP candidate for func_02061f20 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind r4=p once; seven in-order null-guarded frees; self-free tail; field offsets literal
 *   risk:       struct-guessed padding between 0x38/0x44/0x50/0x5c/0x60/0x98/0x9c; if any offset is wrong the ldr displacement diverges. Codegen of the repeated guard is robust. struct-guessed.
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_02061f20 (main, class C) — brief 496.
 * UNVERIFIED build-free draft. MED tier: byte-match not expected first build.
 *   recipe: bind r4=self once; emit the 7 null-guarded frees in exact field order; self-free last
 */
/* func_02061f20: destructor. For each owning pointer field, free it iff non-
 * NULL: fields 0x38/0x44/0x50 via func_020453b4 (generic free), fields
 * 0x5c/0x60/0x98/0x9c via func_02054148 (list free), then free the object
 * itself via func_020453b4. Each guard is the in-place ldr;cmp;beq;bl. */

extern void func_020453b4(void *p);
extern void func_02054148(void *p);

typedef struct Obj {
    char  _pad_00[0x38];
    void *f38;  void *_pad3c[3];   /* +0x38 .. +0x44 */
    void *f44;  void *_pad48[3];   /* +0x44 .. +0x50 */
    void *f50;  void *_pad54[2];   /* +0x50 .. +0x5c */
    void *f5c;
    void *f60;  char  _pad64[0x98 - 0x64];
    void *f98;
    void *f9c;
} Obj;

void func_02061f20(Obj *p) {
    if (p->f38) func_020453b4(p->f38);
    if (p->f44) func_020453b4(p->f44);
    if (p->f50) func_020453b4(p->f50);
    if (p->f5c) func_02054148(p->f5c);
    if (p->f60) func_02054148(p->f60);
    if (p->f98) func_02054148(p->f98);
    if (p->f9c) func_02054148(p->f9c);
    func_020453b4(p);
}
