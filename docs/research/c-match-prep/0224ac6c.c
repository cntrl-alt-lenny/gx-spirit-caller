/* CAMPAIGN-PREP candidate for func_0224ac6c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: multi-bit (b16/b15/fE/:9) word tests, mla base; C: dual cursors, count reloaded via r4 alias
 *   risk:       orig keeps the count base in r4 (alias of r7=ce288) and reloads [r4,#0x5d4] each iter; mwcc may bind the count once or pick a different alias reg. bind/reload + 5-way guard inline-vs-branch. permuter-class; bit boundaries struct-guessed.
 *   confidence: low
 */
/* func_ov002_0224ac6c: dual-cursor scan over data_022ce288 (byte stride,
 * gate byte[+0x5dc]==0x16, count word[+0x5d4]) paralleling data_022ce884
 * (word stride); for each whose word has bit16 & bit15 set and field
 * [22:18]==0xe, resolve id=021b99b4(self, word[8:0]); require 0202e234
 * on per-player word [base+0x418+id*4] and 021c33e4(self,self,id), then
 * post 02253458(self,0xe,id). cls D: multi-bitfield word tests + mla. */

typedef unsigned int u32;

struct C0224ac6c { u32 lo9 : 9; u32 : 4; u32 fE : 4; u32 : 1; u32 b15 : 1;
                   u32 b16 : 1; u32 : 12; };
struct W0224ac6c { u32 id : 13; u32 : 19; };

extern char data_ov002_022ce288[];   /* gate/count block (byte[+0x5dc], word[+0x5d4]) */
extern char data_ov002_022cf16c[];   /* per-player base table                         */
extern char data_ov002_022ce884[];   /* parallel word table, 4-byte stride            */

extern int  func_0202e234(int id);
extern int  func_ov002_021b99b4(int self, unsigned int f9);
extern int  func_ov002_021c33e4(int a, int b, int id);
extern int  func_ov002_02253458(int a, int b, int c);

void func_ov002_0224ac6c(int arg0) {
    char *base;
    char *gate;
    char *rec;
    int i;
    int id;
    if (*(int *)(data_ov002_022ce288 + 0x5d4) == 0)
        return;
    base = data_ov002_022cf16c + (arg0 & 1) * 0x868;
    gate = data_ov002_022ce288;
    rec = data_ov002_022ce884;
    i = 0;
    do {
        if (*(unsigned char *)(gate + 0x5dc) == 0x16 &&
            ((struct C0224ac6c *)rec)->b16 &&
            ((struct C0224ac6c *)rec)->b15 &&
            ((struct C0224ac6c *)rec)->fE == 0xe) {
            id = func_ov002_021b99b4(arg0, ((struct C0224ac6c *)rec)->lo9);
            if (id >= 0 &&
                func_0202e234(((struct W0224ac6c *)(base + 0x418 + id * 4))->id) != 0 &&
                func_ov002_021c33e4(arg0, arg0, id) != 0) {
                func_ov002_02253458(arg0, 0xe, id);
            }
        }
        i++;
        gate += 1;
        rec += 4;
    } while (i < *(int *)(data_ov002_022ce288 + 0x5d4));
}
