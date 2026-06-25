/* CAMPAIGN-PREP candidate for func_021b7fbc (ov016, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     stride-0x5c record loop; store-order _58 then _54; MMIO read-mask-or pack at tail
 *   risk:       reshape-able: r5=0 reused for both _58 and _54 stores (mov r5,r6 holds zero); if mwcc emits two mov-0 instead of reusing, 1 instr diverges (reshape: single `int z=0;` reused). r7 record-base advances by 0x5c via pointer add — matches. struct-guessed offsets.
 *   confidence: med
 */
/* func_ov016_021b7fbc (ov016, class C) — teardown: call f020058b4, then
 * for each of 5 records (stride 0x5c) if rec->_54 != 0 run f0201ef3c
 * (rec->_0, &rec->_8, &rec->_54) and clear _58/_54; also if task slot
 * non-null Task_InvokeLocked it. Finally pack a value into MMIO 0x0400000c.
 */
extern void *data_ov016_021bb1b0[5];
extern void func_020058b4(void);
extern void func_0201ef3c(int a0, void *p8, void *p54);
extern void Task_InvokeLocked(void *task);

typedef struct {
    int _0;               /* +0x0 */
    unsigned char _pad4[0x4];
    int _8;               /* +0x8 (address taken) */
    unsigned char _padc[0x48];
    int _54;              /* +0x54 */
    int _58;              /* +0x58 */
} Rec;

void func_ov016_021b7fbc(Rec *rec) {
    int i;

    func_020058b4();

    for (i = 0; i < 5; i++) {
        if (rec->_54 != 0) {
            func_0201ef3c(rec->_0, &rec->_8, &rec->_54);
            rec->_58 = 0;
            rec->_54 = 0;
        }
        if (data_ov016_021bb1b0[i] != 0) {
            Task_InvokeLocked(data_ov016_021bb1b0[i]);
        }
        rec = (Rec *)((char *)rec + 0x5c);
    }

    *(volatile unsigned short *)0x0400000c =
        (unsigned short)(((*(volatile unsigned short *)0x0400000c & 0x43) | 0x304) | 0x4000);
}
