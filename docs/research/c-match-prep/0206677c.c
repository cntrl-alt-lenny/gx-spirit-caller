/* CAMPAIGN-PREP candidate for func_0206677c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     INIT store-order + 3 identical calls + tail-ish setter call
 *   risk:       The `sub sp,#4` with no locals may not emit from plain C; field-0x800 reload-vs-bind on decrement could flip.
 *   confidence: med
 */
/* func_0206677c: set guard field +0x800 to 1, write byte 0x5c at +0,
 * call func_020667e8(p0,p1,k) for k=0,1,2, then func_02067294(p1,&data),
 * then decrement field +0x800 back. Re-entrancy/refcount bracket. */

typedef struct {
    unsigned char b0;          /* +0x00 */
    char          _pad[0x800 - 1];
    int           f_800;       /* +0x800 */
} obj_0206677c_t;

extern unsigned char data_02101750[];
extern void func_020667e8(void *p0, obj_0206677c_t *p1, int k);
extern void func_02067294(obj_0206677c_t *p1, unsigned char *tbl);

void func_0206677c(void *p0, obj_0206677c_t *p1) {
    p1->f_800 = 1;
    p1->b0 = 0x5c;
    func_020667e8(p0, p1, 0);
    func_020667e8(p0, p1, 1);
    func_020667e8(p0, p1, 2);
    func_02067294(p1, data_02101750);
    p1->f_800 = p1->f_800 - 1;
}
