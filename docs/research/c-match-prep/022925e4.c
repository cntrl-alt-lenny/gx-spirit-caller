/* CAMPAIGN-PREP candidate for func_022925e4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     1-arg guard protos (avoid core.h 021ca2b8 4-arg clash); loop +0x120 :13; reload count cf16c+0xc; hold id across inner call
 *   risk:       twin of func_02292dac (shipped whole-function .s): the held b0*0x868 base reg across the loop back-edge + id-in-r9 across the inner call + predicated 'return 1' are reg-alloc walls. SECONDARY: func_021ca2b8 is called 1-arg here (only r0 set) — using core.h's 4-arg sig would emit spurious r1-r3 setup, so it is declared 1-arg locally (struct-guessed: confirm 021ca2b8's real arity at this callsite). permuter-class / .s-escape.
 *   confidence: low
 */
/* func_ov002_022925e4: mul-index scan loop, two entry guards + two inner
 * calls (cls C). guards: if func_021ca2b8(bit0)==0 return 0; if
 * func_021bd030(bit0)==0 return 0 (BOTH called with only r0 set -> 1-arg
 * prototypes here, NOT core.h's 4-arg 021ca2b8 — do not include core.h).
 * count = *(int*)(cf178 + (bit0&1)*0x868). i=0; if count!=0 do: id =
 * slot.id from cf16c + (bit0&1)*0x868 + i*4 + 0x120 (:13); if
 * func_0202e234(id)!=0 then if func_0202e6f4(id)!=0 return 1; i++; reload
 * count cf16c+0xc; while (unsigned)i < count. id held in r9 across the inner
 * call. Twin of func_02292dac (shipped .s). */
typedef unsigned short u16;
struct Ov002Slot { unsigned int id : 13; };
struct S { u16 f0; u16 bit0 : 1; u16 rest : 15; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int  func_ov002_021ca2b8(int bit0);
extern int  func_ov002_021bd030(int bit0);
extern int  func_0202e234(int id);
extern int  func_0202e6f4(int id);

int func_ov002_022925e4(struct S *self) {
    int i;
    int count;
    unsigned int id;
    if (func_ov002_021ca2b8(self->bit0) == 0)
        return 0;
    if (func_ov002_021bd030(self->bit0) == 0)
        return 0;
    count = *(int *)(data_ov002_022cf178 + (self->bit0 & 1) * 0x868);
    i = 0;
    if (count != 0) {
        do {
            id = ((struct Ov002Slot *)(data_ov002_022cf16c +
                  (self->bit0 & 1) * 0x868 + i * 4 + 0x120))->id;
            if (func_0202e234(id) != 0) {
                if (func_0202e6f4(id) != 0)
                    return 1;
            }
            i++;
            count = *(int *)(data_ov002_022cf16c +
                    (self->bit0 & 1) * 0x868 + 0xc);
        } while ((unsigned int)i < (unsigned int)count);
    }
    return 0;
}
