/* CAMPAIGN-PREP candidate for func_021b6f40 (ov017, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield pack 6x5+1x6 (unsigned-char reads); store-order clears; stride-0x5c & 3-entry loops
 *   risk:       struct-guessed: the orig's redundant `orr ip,ip,#0` plus the (x<<27)>>k shift form strongly imply a :5/:6 bitfield STRUCT write, not the plain OR-chain; emit the struct to match the lsl/lsr-into-orr exactly.
 *   confidence: low
 */
/* func_ov017_021b6f40 (ov017, class D): pack six 5-bit byte fields + one 6-bit
 * field from obj[0x1cc..0x1d4] into a single u32 register write at
 * data_02104f4c+0xa64. Then two loops: (a) stride-0x5c x5, flush a pending
 * sub-record via func_0201ef3c and clear its flags; (b) drain a 3-entry task
 * table (Task_InvokeLocked).
 *
 *  bit0..4=[0x1cc]&1f, 5..9=[0x1cd]&1f, 10..14=[0x1ce]&1f, 15..19=[0x1cf]&1f,
 *  20..24=(u16[0x1d0])&1f, 25..30=([0x1d4])&3f.  Fields are masked bytes; the
 *  orig builds them with (x<<27)>>k folded shifted-orr second operands. */

extern void Task_InvokeLocked(int arg);
extern unsigned char data_02104f4c[];
extern int  data_ov017_021b877c[];
extern void func_020058b4(void);
extern void func_0201ef3c(int a, void *b, void *c);

int func_ov017_021b6f40(unsigned char *obj) {
    unsigned char *rec;
    int i, j;

    *(unsigned int *)(data_02104f4c + 0xa64) =
          (obj[0x1cc] & 0x1f)
        | ((obj[0x1cd] & 0x1f) << 5)
        | ((obj[0x1ce] & 0x1f) << 10)
        | ((obj[0x1cf] & 0x1f) << 15)
        | ((*(unsigned short *)(obj + 0x1d0) & 0x1f) << 20)
        | ((*(int *)(obj + 0x1d4) & 0x3f) << 25);

    rec = obj;
    for (i = 0; i < 5; i++) {
        if (*(int *)(rec + 0x54) != 0) {
            func_0201ef3c(*(int *)rec, rec + 0x8, rec + 0x54);
            *(int *)(rec + 0x58) = 0;
            *(int *)(rec + 0x54) = 0;
        }
        rec += 0x5c;
    }

    func_020058b4();

    for (j = 0; j < 3; j++) {
        if (data_ov017_021b877c[j] != 0)
            Task_InvokeLocked(data_ov017_021b877c[j]);
    }
    return 1;
}
