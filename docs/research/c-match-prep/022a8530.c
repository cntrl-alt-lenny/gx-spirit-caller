/* CAMPAIGN-PREP candidate for func_022a8530 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     memcpy-template + alloc + OBJ-fill (mvn=-1, nibble), store-order
 *   risk:       OBJ struct offsets guessed; strh of mvn#0 must be u16=0xFFFF; 0xc980 literal pool; func_02091554 dst/src arg order
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_022a8530 (ov002, class A).
 *   recipe:     copy template -> alloc -> OBJ-template fill -> register ->
 *               commit; nibble field via bic#0xf|orr#9; -1 via mvn -> u16
 *   risk:       OBJ struct offsets (0x0/0xc/0x10/0x14) inferred; f_10 = -1
 *               must store as u16 0xFFFF (mvn#0); the 0xc980 word stays in a
 *               literal pool; func_02091554(dst,src) arg order assumed
 *   confidence: low
 */
/* func_ov002_022a8530: func_02091554(&buf, tmpl-data); handle =
 * func_02006c0c(&buf,4,0); func_0201d47c(&oam); patch attr2-nibble to 9,
 * set handle, f_c=0xc980, f_10=-1; func_0201e5b8(&oam) registers it;
 * func_02006e1c(handle) commits. */

extern void  func_02091554(void *dst, void *src);
extern void *func_02006c0c(void *tmpl, int n, int m);
extern void  func_02006e1c(void *h);
extern void  func_0201d47c(void *oam);
extern void  func_0201e5b8(void *oam);
extern char  data_ov002_022cc364[];

typedef struct {
    void           *f_00;   /* +0x00 handle */
    char            _pad_04[0x8];
    int             f_0c;   /* +0x0c */
    unsigned short  f_10;   /* +0x10 */
    char            _pad_12[0x2];
    unsigned short  f_14;   /* +0x14 attr (low nibble = mode) */
} Oam_022a8530;

void func_ov002_022a8530(void) {
    Oam_022a8530 oam;
    char buf[0x28];
    void *h;

    func_02091554(buf, data_ov002_022cc364);
    h = func_02006c0c(buf, 4, 0);
    func_0201d47c(&oam);
    oam.f_00 = h;
    oam.f_14 = (oam.f_14 & ~0xf) | 0x9;
    oam.f_0c = 0xc980;
    oam.f_10 = (unsigned short)-1;
    func_0201e5b8(&oam);
    func_02006e1c(h);
}
