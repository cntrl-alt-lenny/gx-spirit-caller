/* CAMPAIGN-PREP candidate for func_022877f0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     asymmetric shifts (w<<22)>>31 / (w<<18)>>28 raw (not folded); row{id:13,f8} stride 0x14; per-entry g pointers
 *   risk:       permuter-class + struct-guessed: many CSE'd shift extracts of w (orig reloads [r9] thrice and recomputes a/b each time) and several held loop pointers (r5/r6/r4/fp). Exact reload-vs-bind of w and the row mla base will drive reg-alloc divergence; bitfield positions in w are inferred from shift amounts.
 *   confidence: low
 */
/* func_ov002_022877f0 (cls D, counted loop, multi bitfield + mla): scan count = g[+0x5d4] entries.
 * Per entry i: kind=g[+0x5dc] (u8, advances g+=1); list word w=data_ce884[i] (ptr+=4).
 * w fields: a = (w<<22)>>31 (bit9 :1), b = (w<<18)>>28 (bits 4-bpattern :4). Guards:
 *   kind in {6,7,8} && a != bit0 && row[b].f38!=0 && 021c1ef0(self)!=0 && 021c8470(a, b) <= 0x7d0
 *   then id = row[b].id (13b -> u16); 021ba6cc(id)!=0 ? return 1. Loop; else return 0. */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
struct Row877f0 { u32 id:13; u8 pad[5]; u16 f8; };
struct S877f0 { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022ce288[];
extern u32 data_ov002_022ce884[];
extern char data_ov002_022cf16c[];
extern int func_ov002_021ba6cc(unsigned int id);
extern int func_ov002_021c1ef0(struct S877f0 *self);
extern int func_ov002_021c8470(int a, int b);
int func_ov002_022877f0(struct S877f0 *self) {
    int i;
    int count = *(int *)(data_ov002_022ce288 + 0x5d4);
    for (i = 0; i < count; i++) {
        u8 kind = *(u8 *)(data_ov002_022ce288 + i + 0x5dc);
        if (kind == 6 || kind == 7 || kind == 8) {
            u32 w = data_ov002_022ce884[i];
            unsigned a = (unsigned)(w << 22) >> 31;
            unsigned b = (unsigned)(w << 18) >> 28;
            if (a != self->bit0) {
                struct Row877f0 *row = (struct Row877f0 *)(data_ov002_022cf16c + (a & 1) * 0x868 + 0x30 + b * 0x14);
                if (row->f8 != 0 && func_ov002_021c1ef0(self) != 0 &&
                    func_ov002_021c8470((int)a, (int)b) <= 0x7d0) {
                    if (func_ov002_021ba6cc(row->id) != 0) return 1;
                }
            }
        }
    }
    return 0;
}
