/* CAMPAIGN-PREP candidate for func_0229e4e8 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     alloc+OBJ-fill x2 (bic/orr nibble), store-order, reload r4
 *   risk:       OBJ struct field offsets/types guessed; halfword bic#0xf|orr#9 nibble field; the two store orders must match asm exactly
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_0229e4e8 (ov002, class A).
 *   recipe:     alloc -> OBJ-template fill -> commit, done twice; nibble
 *               field via bic#0xf|orr#9; store-order recipe; reload handle
 *   risk:       OBJ struct layout (offsets 0x0/0xc/0x10/0x14) and field
 *               types are inferred; the bic/orr nibble on the :u16 field and
 *               the exact store ordering are the likely diff sources
 *   confidence: low
 */
/* func_ov002_0229e4e8: build two sprite/OBJ entries. For each: handle =
 * func_02006c0c(tmpl,4,0); func_0201d47c(&oam) fills a template; patch its
 * attr2-nibble to 9, set handle/priority/size fields; func_0201e5b8(&oam)
 * registers it; func_02006e1c(handle) commits. */

extern void *func_02006c0c(void *tmpl, int n, int m);
extern void  func_02006e1c(void *h);
extern void  func_0201d47c(void *oam);
extern void  func_0201e5b8(void *oam);
extern char  data_ov002_022cba2c[];
extern char  data_ov002_022cba40[];

typedef struct {
    void           *f_00;   /* +0x00 handle */
    char            _pad_04[0x8];
    int             f_0c;   /* +0x0c */
    unsigned short  f_10;   /* +0x10 */
    char            _pad_12[0x2];
    unsigned short  f_14;   /* +0x14 attr (low nibble = mode) */
} Oam_0229e4e8;

void func_ov002_0229e4e8(void) {
    Oam_0229e4e8 oam;
    void *h;

    h = func_02006c0c(data_ov002_022cba2c, 4, 0);
    func_0201d47c(&oam);
    oam.f_00 = h;
    oam.f_14 = (oam.f_14 & ~0xf) | 0x9;
    oam.f_0c = 0x800;
    oam.f_10 = 0x40;
    func_0201e5b8(&oam);
    func_02006e1c(h);

    h = func_02006c0c(data_ov002_022cba40, 4, 0);
    func_0201d47c(&oam);
    oam.f_0c = 0x3600;
    oam.f_00 = h;
    oam.f_14 = (oam.f_14 & ~0xf) | 0x9;
    oam.f_10 = 0xa0;
    func_0201e5b8(&oam);
    func_02006e1c(h);
}
