/* CAMPAIGN-PREP candidate for func_0224a120 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: rsb=1-arg0 partner, :13/bit14 bitfields; C: hold base, decl other/base/i/id in use order
 *   risk:       Mid-chain: orig has .L_258 (skip) vs .L_248 (do-sink) split; the `0203058c==0 || bit14` short-circuit must pick beq .L_248/.L_258 polarity. reshape-able via &&/|| polarity, but inline-vs-branch residue possible (permuter-class).
 *   confidence: low
 */
/* func_ov002_0224a120: partner-player (1-arg0) scan of the +0x418 record
 * list (count at base[0x14]); for each record whose :13 id passes
 * 0202e234 and 021ca3f0(self,id), then either 0203058c(id)==0 with bit14
 * of the word set, post 02253458(1-arg0,0xe,i). cls D: rsb partner +
 * :13 / bit14 bitfields, guard chain. */

typedef unsigned int u32;

struct R0224a120 { u32 id : 13; u32 : 4; u32 b14 : 1; u32 : 14; };

extern char data_ov002_022cf16c[];   /* per-player base table             */
extern int  data_ov002_022cf180[];   /* per-player presence (byte offset) */

extern int  func_0202e234(int id);
extern int  func_ov002_021ca3f0(int self, int id);
extern int  func_0203058c(int id);
extern int  func_ov002_02253458(int a, int b, int c);

void func_ov002_0224a120(int arg0) {
    int other;
    char *base;
    char *rec;
    int i;
    int id;
    other = 1 - arg0;
    if (*(int *)((char *)data_ov002_022cf180 + (other & 1) * 0x868) == 0)
        return;
    base = data_ov002_022cf16c + (other & 1) * 0x868;
    rec = base + 0x18 + 0x400;
    i = 0;
    do {
        id = ((struct R0224a120 *)rec)->id;
        if (func_0202e234(id) != 0 && func_ov002_021ca3f0(arg0, id) != 0) {
            if (func_0203058c(id) == 0 || ((struct R0224a120 *)rec)->b14) {
                func_ov002_02253458(other, 0xe, i);
            }
        }
        i++;
        rec += 4;
    } while (i < *(int *)(base + 0x14));
}
