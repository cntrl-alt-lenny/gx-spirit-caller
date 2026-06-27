/* CAMPAIGN-PREP candidate for func_0224a038 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :13/[22:29]/bit13 bitfields, fA*2+bit13 packed; C: hold base across uses, decl id-first
 *   risk:       packed = fA*2 + (w<<18)>>31: orig fuses bit13 as add r3,r3,ip,lsr#31 (shifted-operand). mwcc may extract bit13 to its own reg first. reshape-able? operand fusion is scheduling, permuter-class.
 *   confidence: low
 */
/* func_ov002_0224a038: scan the per-player +0x260 record list (count at
 * base[0x10]); for each record whose w1[19:15]==10 (0202b878) and
 * w1[11:8] (0202b8a8)==arg2+1 and 021ca440(self,id) holds, if
 * 021b3fd8(self,0xb,0x12a1, fieldA*2+bit13)==0 post 02253458(self,0xd,i).
 * cls D: :13 / [22:29] / bit13 packed-field math, reg-reuse loop. */

typedef unsigned int u32;

struct R0224a038 { u32 id : 13; u32 : 9; u32 fA : 8; u32 : 2; };

extern char data_ov002_022cf16c[];   /* per-player base table             */
extern int  data_ov002_022cf17c[];   /* per-player presence (byte offset) */

extern int  func_0202b878(unsigned int id);
extern int  func_0202b8a8(unsigned int id);
extern int  func_ov002_021ca440(int self, int id);
extern int  func_ov002_021b3fd8(int self, int k, int code, int packed);
extern int  func_ov002_02253458(int a, int b, int c);

void func_ov002_0224a038(int arg0, int arg1, int arg2) {
    char *base;
    char *rec;
    int i;
    int id;
    int packed;
    if (*(int *)((char *)data_ov002_022cf17c + (arg0 & 1) * 0x868) == 0)
        return;
    base = data_ov002_022cf16c + (arg0 & 1) * 0x868;
    rec = base + 0x260;
    i = 0;
    do {
        id = ((struct R0224a038 *)rec)->id;
        if (func_0202b878(id) == 10 && func_0202b8a8(id) == arg2 + 1 &&
            func_ov002_021ca440(arg0, id) != 0) {
            packed = ((struct R0224a038 *)rec)->fA * 2 +
                     (int)((u32)(*(u32 *)rec << 18) >> 31);
            if (func_ov002_021b3fd8(arg0, 0xb, 0x12a1, packed) == 0)
                func_ov002_02253458(arg0, 0xd, i);
        }
        i++;
        rec += 4;
    } while (i < *(int *)(base + 0x10));
}
