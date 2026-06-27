/* CAMPAIGN-PREP candidate for func_021b8774 (ov016, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class-D bitfield struct (:5x5,:6) so each field reloads + and;lsr; 5-slot task loop; store-order fields; (asm truncated)
 *   risk:       struct-guessed + TRUNCATED: task-array symbol name and the entire else-branch/literal pool are unknown; bitfield extraction order is solid but field reload depends on bitfield (not cached int) -- confirm task-array symbol.
 *   confidence: low
 */
/* func_ov016_021b8774: ***ASM TRUNCATED*** (size=472; the .L_021b8860 else-branch and
 * literal pool are cut). MAIN path (visible, complete): if arg1->f44 != 0, drain a
 * 5-slot task array (Task_InvokeLocked each non-null, then zero it), UNPACK arg1->f44
 * as consecutive bitfields into arg0, then call the 5 row-group rebuilders.
 *
 * BITFIELD unpack (class D) -- orig RELOADS [r4+0x44] for EACH field, emits and(mask);lsr:
 *   f1cc=v&0x1f; f1cd=(v>>5)&0x1f; f1ce=(v>>10)&0x1f; f1cf=(v>>15)&0x1f;
 *   *(u16*)(arg0+0x1d0)=(v>>20)&0x1f; *(u32*)(arg0+0x1d4)=(v>>25)&0x3f;
 * => model f44 as a :5/:5/:5/:5/:5/:6 bitfield struct so each read re-loads + and;lsr.
 */

extern void Task_InvokeLocked(void *t);
extern void func_02091554(void *a, void *b, void *c);
extern void func_ov016_021b894c(void *p, void *tbl);
extern void func_ov016_021b8a30(void *p, void *tbl);
extern void func_ov016_021b8b10(void *p, void *tbl);
extern void func_ov016_021b8bf4(void *p, void *tbl);
extern void func_ov016_021b8cd8(void *p, void *tbl);
extern void *data_ov016_021b9410[5];   /* task array (5 slots) -- name struct-guessed */
extern char data_ov016_021b940c[];     /* rebuilder table arg (.L_021b8930) */
extern char data_ov016_021bb1a4[];
extern char data_ov016_021bb1b0[];
extern void func_02091554_dummy(void);

typedef struct {
    unsigned b0:5, b1:5, b2:5, b3:5, b4:5, b5:6;
} Packed44;

int func_ov016_021b8774(char *arg0, char *arg1) {
    if (*(int *)(arg1 + 0x44) != 0) {
        int i;
        Packed44 *pk = (Packed44 *)(arg1 + 0x44);
        for (i = 0; i < 5; i++) {
            if (data_ov016_021b9410[i] != 0) Task_InvokeLocked(data_ov016_021b9410[i]);
            data_ov016_021b9410[i] = 0;
        }
        *(unsigned char  *)(arg0 + 0x1cc) = pk->b0;
        *(unsigned char  *)(arg0 + 0x1cd) = pk->b1;
        *(unsigned char  *)(arg0 + 0x1ce) = pk->b2;
        *(unsigned char  *)(arg0 + 0x1cf) = pk->b3;
        *(unsigned short *)(arg0 + 0x1d0) = pk->b4;
        *(unsigned int   *)(arg0 + 0x1d4) = pk->b5;
        func_ov016_021b8a30(arg0, data_ov016_021b940c);
        func_ov016_021b894c(arg0, data_ov016_021b940c);
        func_ov016_021b8b10(arg0, data_ov016_021b940c);
        func_ov016_021b8bf4(arg0, data_ov016_021b940c);
        func_ov016_021b8cd8(arg0, data_ov016_021b940c);
        return 1;
    }
    /* .L_021b8860 else-branch: func_02091554 + ... -- TRUNCATED in batch */
    return 1;
}
