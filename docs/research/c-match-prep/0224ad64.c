/* CAMPAIGN-PREP candidate for func_0224ad64 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :13 id + packed key fA*2+bit13, mod-128 ring index; C: word reloaded as orig reloads [r4,...]
 *   risk:       Ring index math (cursor<<25)>>24 then >>1 for ldrh scaling, plus orig RELOADS the record word for the key. mwcc likely reshapes the mod-128 + halfword-scale shifts and may CSE the word. Index-shaping + bind/reload, permuter-class. ce720 element type struct-guessed.
 *   confidence: low
 */
/* func_ov002_0224ad64: resolve :13 id from per-player word
 * [base+0x120+arg2*4]; require 0202e234(id) and 021ca440(self,id). Then
 * over the data_022ce720 ring (start cursor from word[ce288+0x494],
 * mod 128) search up to ring[ (cursor&0xff) ] entries for one whose
 * [+0x98] halfword equals the packed key fieldA*2+bit13 of the record
 * word; if none found, post 02253458(self,0xb,arg2). cls D: mla base +
 * packed key + ring search. */

typedef unsigned int   u32;
typedef unsigned short u16;

struct R0224ad64 { u32 id : 13; u32 : 9; u32 fA : 8; u32 : 2; };

extern char data_ov002_022cf16c[];   /* per-player base table          */
extern char data_ov002_022ce288[];   /* cursor block (word[+0x494])     */
extern u16  data_ov002_022ce720[];   /* count ring, mod-128 index       */

extern int  func_0202e234(int id);
extern int  func_ov002_021ca440(int self, int id);
extern int  func_ov002_02253458(int a, int b, int c);

void func_ov002_0224ad64(int arg0, int arg1, int arg2) {
    char *base;
    u32 word;
    int cursor;
    int limit;
    int i;
    int key;
    char *node;
    base = data_ov002_022cf16c + (arg0 & 1) * 0x868;
    word = *(u32 *)(base + 0x120 + arg2 * 4);
    if (func_0202e234((int)(((struct R0224ad64 *)&word)->id)) == 0)
        return;
    if (func_ov002_021ca440(arg0, (int)(((struct R0224ad64 *)&word)->id)) == 0)
        return;
    cursor = *(int *)(data_ov002_022ce288 + 0x494);
    limit = data_ov002_022ce720[(unsigned int)(cursor << 25) >> 24 >> 1];
    if (limit > 0) {
        word = *(u32 *)(base + 0x120 + arg2 * 4);
        key = ((struct R0224ad64 *)&word)->fA * 2 +
              (int)((u32)(word << 18) >> 31);
        i = 0;
        do {
            i++;
            node = data_ov002_022ce288 +
                   ((unsigned int)((cursor + i) << 25) >> 24) + 0x400;
            if (*(u16 *)(node + 0x98) == key)
                return;
        } while (i < limit);
    }
    func_ov002_02253458(arg0, 0xb, arg2);
}
