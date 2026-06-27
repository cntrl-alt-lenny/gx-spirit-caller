/* CAMPAIGN-PREP candidate for func_0222fdb4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     `1 - player` for rsb#1; d0250e :13 bitfield at stride 4 (lsl#2); per-player cf178 base (other*0x868)
 *   risk:       orig keeps `and r3,#1` after `rsb r0,r0,#1` (mov r4=self saved to r4 too); mwcc proves `1-(bitfield)` is 0/1 and DROPS the `&1`, and may not hold self in r4 across both arms -> reshape-able (force and via wider temp) / struct-guessed d0250 stride
 *   confidence: low
 */
typedef unsigned short u16;
struct ce288 { char _a[0x5a8]; int f5a8; };
struct d0e6c { char _a[0xb0]; u16 fb0; };
struct self_t { u16 f0; u16 player : 1; };
struct d0250e { u16 id : 13; u16 : 3; u16 _hi; };
extern struct ce288 data_ov002_022ce288;
extern struct d0e6c data_ov002_022d0e6c;
extern char  data_ov002_022cf178[];
extern struct d0250e data_ov002_022d0250[];
extern int  func_0202b8a8(int x);
extern int  func_0202e234(int x);
extern int  func_ov002_021ca5bc(int x);
extern int  func_ov002_021df818(void *self, int a, int b);
extern int  func_ov002_0226af38(int a, int b, int c);
int func_ov002_0222fdb4(struct self_t *self) {
    int state = data_ov002_022ce288.f5a8;
    int player, id, n;
    if (state == 0x7f) {
        if (func_ov002_021ca5bc(data_ov002_022d0e6c.fb0) == 0) return 0;
        id = data_ov002_022d0250[data_ov002_022d0e6c.fb0].id;
        if (func_0202e234(id) == 0) return 0;
        n = func_0202b8a8(id);
        player = self->player;
        func_ov002_021df818(self, 1 - player, n * 0x64);
        return 0;
    }
    if (state != 0x80) return 0;
    player = self->player;
    if (*(int *)(data_ov002_022cf178 + ((1 - player) & 1) * 0x868) == 0) return 0;
    func_ov002_0226af38(1 - player, 1, 1);
    return 0x7f;
}
