/* CAMPAIGN-PREP candidate for func_021ac208 (ov008, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: byte-combine index via shifts; bind row base; nested-if guard chain; if-assign ok=1
 *   risk:       permuter-class: mwcc peepholes (hw<<24)>>24 to and#0xff so it can't fuse into the index add (orig keeps lsr#24 in add operand-2); brief-403 permuter-probed, no match -> shipped .s.
 *   confidence: low
 */
/* func_ov008_021ac208 — guarded dispatch keyed by a stride-52 row whose index
 * is the sum of the two bytes packed in data_ov008_021b2dc0.u16@+4. */
extern unsigned char data_02104bac[];      /* MMIO-ish; u16 read at +0x54 */
extern unsigned char data_ov008_021b2790[];/* stride-52 rows: u16@+0, int@+4 */
extern unsigned char data_ov008_021b2dc0[];
extern void func_02006164(void);
extern int  func_ov008_021aa578(int, int, int, int);
extern void func_ov008_021b1e0c(int);
extern void func_ov008_021b1e20(int, int);
extern int  func_ov008_021b1ee0(void);
extern void func_ov008_021b2028(int);

void func_ov008_021ac208(void) {
    unsigned hw = *(unsigned short *)(data_ov008_021b2dc0 + 4);
    int idx = (hw & 0xff) + ((hw << 16) >> 24);   /* byte0 + byte1 */
    unsigned char *row = data_ov008_021b2790 + idx * 52;
    int ok = 0;
    func_ov008_021b1e0c(*(int *)(row + 4));
    func_ov008_021b1e20(*(unsigned short *)row, 0);
    if (func_ov008_021b1ee0() != 0) {
        if (func_ov008_021aa578(0xe3, 0, 0x100, 0x14) != 0) {
            if (func_02006164() != 0) ok = 1;
        } else if (*(unsigned short *)(data_02104bac + 0x54) & 0x800) {
            ok = 1;
        }
    }
    func_ov008_021b2028(ok);
}
