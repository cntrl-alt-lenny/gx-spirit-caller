/* CAMPAIGN-PREP candidate for func_021c7110 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :3 bitfield for lsl#29;lsr#29; signed /2 via w/2; 0x80 - w/2 centring; if-assign for g.
 *   risk:       struct-guessed for data_02104f4c.chan (:3 @ bit0) - confirm vs real struct; a plain &7 would emit 'and' not 'lsl;lsr'. Secondary: arg pack order to func_02005088 (sp slots 6,0xc).
 *   confidence: med
 */
/* func_ov006_021c7110 (ov006, D) - setup that reads a :3 bitfield from a global,
 * picks a glyph id by a flag, measures the string and centres it (128 - w/2),
 * with a signed /2. The lsl#29;lsr#29 pair MUST be a :3 bitfield (a plain &7
 * gives and). Returns 1. */
struct Ov006Mode4 { int pad; unsigned chan : 3; };
extern struct Ov006Mode4 data_02104f4c;
extern void func_02001d0c(void *p, int a, int b);
extern void func_02001d68(int c);
extern void func_02001d98(void *p, int a);
extern int  func_02005088(void *p, int g, void *r, int x, int e, int f);
extern int  func_02005554(int g, int a, int b);
extern int  func_0202c0c0(int id);
extern int  func_0202c44c(void);
extern int  func_0208de94(void);
extern int  func_02094504(int a, int b, int c);

int func_ov006_021c7110(char *obj) {
    int q = func_0208de94();
    int g;
    int w;
    func_02094504(0, q + 0x20, 0xc00);
    func_02001d0c(obj + 4, 0x20, 3);
    func_02001d68(data_02104f4c.chan);
    func_02001d98(obj + 4, 5);
    if (*(int *)(obj + 0x38) == 0) {
        g = func_0202c0c0(0x1cd);
    } else {
        g = func_0202c44c();
    }
    w = func_02005554(g, 12, 5);
    func_02005088(obj + 4, g, q + 0x20, 0x80 - w / 2, 6, 12);
    func_02001d98(obj + 4, -1);
    return 1;
}
