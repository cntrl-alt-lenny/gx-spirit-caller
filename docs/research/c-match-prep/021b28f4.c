/* CAMPAIGN-PREP candidate for func_021b28f4 (ov016, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-assign guard chain; struct {u16,u16,u8,u8}; box-x first (cmp order)
 *   risk:       permuter-class: clone source 021b287c ships as raw .s (reg-alloc walled), so the sp-temp/r4 allocation across the two bl calls likely diverges; escape to .s expected. struct-guessed offsets.
 *   confidence: low
 */
/* func_ov016_021b28f4 (ov016, class C) — clone of 021b287c AABB hit-test.
 * NOTE: the clone source func_ov016_021b287c SHIPS AS RAW .s (reg-alloc
 * walled, GLOBAL_ASM endgame brief 302). So a byte-exact C match here is
 * unlikely by the same wall; this is the best-shaped attempt.
 *
 * Two helpers fill two stack words (sp+4 = cursor.x, sp+0 = cursor.y);
 * second helper returns a bool gate. Box = {u16 x; u16 y; u8 w; u8 h;}.
 */
extern void func_02006148(int *out_x, int *out_y);
extern int  func_0200617c(void);

typedef struct {
    unsigned short x;   /* +0x0 */
    unsigned short y;   /* +0x2 */
    unsigned char  w;   /* +0x4 */
    unsigned char  h;   /* +0x5 */
} Box;

int func_ov016_021b28f4(Box *box) {
    int px, py;

    func_02006148(&px, &py);
    if (func_0200617c() == 0) return 0;
    if (box->x > px) return 0;
    if (box->x + box->w <= px) return 0;
    if (box->y > py) return 0;
    if (box->y + box->h <= py) return 0;
    return 1;
}
