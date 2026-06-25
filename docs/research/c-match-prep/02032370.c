/* CAMPAIGN-PREP candidate for func_02032370 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: movs r7,r0 alloc-guard; preserve r4-r7 args; reload obj->f8 for final call.
 *   risk:       Final func_020945f4 reloads r2 from [handle+0x8] (the just-stored r4) rather than reusing r4 — the asm RELOADS; if mwcc reuses the r4 value one ldr vanishes. struct-guessed: count arg of the final memset is inferred. reshape-able via explicit reload.
 *   confidence: low
 */
/* func_02032370: allocate (if r0==0) via blx alloc-callback(0x18,4), zero it,
 * IRQ-bracketed store of the handle to data_0219b2b4, init via func_02032344,
 * then store r4, call obj->f10(r4,0x20)->obj->fc, then zero obj->f8 region.
 *   if (handle==0) { handle = alloc(0x18,4); if(!handle) return;
 *                    func_020945f4(handle,0,0x18); }
 *   OS_DisableIrq(); *data_0219b2b4 = handle; OS_RestoreIrq(_);
 *   func_02032344(handle, alloc, r2);
 *   handle->f8 = r4;
 *   handle->fc = handle->f10(r4, 0x20);
 *   func_020945f4(handle->f8, 0, ...);  ; r2 from handle->f8 reload
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern void func_02032344(void *obj, void *a, void *b);
extern void func_020945f4(void *p, int z, int n);
extern void *data_0219b2b4;

typedef void *(*alloc_t)(int sz, int align);
typedef void *(*init_t)(void *a, int n);

struct Obj_02032370 {
    char    _pad0[0x8];
    void   *f8;    /* +0x8 */
    void   *fc;    /* +0xc */
    init_t  f10;   /* +0x10 */
};

void *func_02032370(void *handle, alloc_t alloc, void *r2, void *r3) {
    struct Obj_02032370 *obj;
    int saved;
    if (handle == 0) {
        handle = alloc(0x18, 4);
        if (handle == 0) return 0;
        func_020945f4(handle, 0, 0x18);
    }
    saved = OS_DisableIrq();
    data_0219b2b4 = handle;
    OS_RestoreIrq(saved);
    func_02032344(handle, alloc, r2);
    obj = (struct Obj_02032370 *)handle;
    obj->f8 = r3;
    obj->fc = obj->f10(r3, 0x20);
    func_020945f4(obj->f8, 0, (int)obj->f8);
    return handle;
}
