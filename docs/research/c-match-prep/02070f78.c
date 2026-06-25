/* CAMPAIGN-PREP candidate for func_02070f78 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order exact; read-back each field; cmp-eq selects sel before stores
 *   risk:       Orig interleaves the flag!=0 test as conditional strneh/ldmneia BEFORE the func_0207108c call (cmp r0,#0 hoisted above the 4 stores); if mwcc sinks the flag test below the stores the strh/ldmia ordering diverges. struct-guessed offsets 0x1c/0x20.
 *   confidence: low
 */
/* func_02070f78: guarded field-mirror writes on manager->active (+0xa4).
 * arg0=r0(flag), arg1=r1(u16 val), arg2=r2(addr/key).
 *  obj = data_021a63d0.mgr->active; if(obj==0) return.
 *  if(arg2 == 0x7f000001) arg1src = data_0219ef1c (a u32 global)
 *      -- but note: the localhost magic only swaps the value used for
 *         the +0x20/+0x1c stores; the +0x1a/+0x18 stores use arg1 (u16).
 *  Stores, in EXACT order:
 *    obj->f1a = (u16)arg1; obj->f18 = obj->f1a;
 *    obj->f20 = sel;       obj->f1c = obj->f20;
 *  Then if(flag!=0){ obj->fa = (u16)flag; return; }
 *  else obj->fa = (u16)func_0207108c();
 *
 * The cmp r2,#0x7f000001 selects sel = (arg2==0x7f000001)?
 * *data_0219ef1c : arg2.  Stores read-back each field (str then ldr)
 * to feed the next store -> keep them as separate field assignments in
 * source order, do NOT coalesce.
 */

typedef struct Obj {
    char  _pad0a[0xa];
    unsigned short fa;     /* +0xa */
    char  _pad0c[0xc];
    unsigned short f18;    /* +0x18 */
    unsigned short f1a;    /* +0x1a */
    char  _pad1c[0x0];
    int   f1c;             /* +0x1c */
    int   f20;             /* +0x20 */
} Obj;

typedef struct Mgr {
    char  _pad_a4[0xa4];
    Obj  *active;          /* +0xa4 */
} Mgr;

typedef struct Root {
    char  _pad04[0x4];
    Mgr  *mgr;             /* +0x4 */
} Root;

extern Root data_021a63d0;
extern int  data_0219ef1c;
extern int  func_0207108c(void);

void func_02070f78(int flag, int val, int key) {
    Obj *obj = data_021a63d0.mgr->active;
    int sel;

    if (obj == 0) return;

    sel = key;
    if (key == 0x7f000001) sel = data_0219ef1c;

    obj->f1a = (unsigned short)val;
    obj->f18 = obj->f1a;
    obj->f20 = sel;
    obj->f1c = obj->f20;

    if (flag != 0) {
        obj->fa = (unsigned short)flag;
        return;
    }
    obj->fa = (unsigned short)func_0207108c();
}
