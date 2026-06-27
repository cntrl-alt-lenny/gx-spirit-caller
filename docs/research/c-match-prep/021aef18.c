/* CAMPAIGN-PREP candidate for func_021aef18 (ov008, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitset set: row*0x34 base, signed bitno>>5 word, 1<<(pos&31); bind call results r4/r5
 *   risk:       orig open-codes signed div/mod-by-32 (lsr#31;rsb;lsl#27;ror#27 and asr#4/lsr#27/asr#5); mwcc may emit a different signed >>5 / &31 sequence. permuter-class
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov008_021aef18 (ov008, class C, MED) — built-free.
 * UNVERIFIED + ITERATION-EXPECTED. Drop into src/, ninja + objdiff, apply risk note.
 *
 * Sequence: clear bit 1 of a status word, refresh a sub-system, then SET a bit
 * in a 0x34-stride bitset table. data_021b2de4: u16@+0 (x) + u16@+2 (y) summed,
 * passed to three selector helpers. r4 = 021aedfc(sum) picks the table ROW
 * (stride 0x34 over data_021b27bc). r5 = first 021aee54(sum) is the BIT NUMBER
 * (word = r5>>5, signed). The third 021aee54(sum) result is the bit POSITION
 * within that word (n & 31, signed two's-complement). Then strh 1,[+4]; strh 0,[+0xaa].
 */
extern int  func_0202224c(int);
extern void func_02022234(int, int);
extern void func_020212cc(int);
extern int  func_ov008_021aedfc(int);
extern int  func_ov008_021aee54(int);

extern char data_ov008_021b2eac[];   /* _LIT0: +8 = a handle */
extern char data_ov008_021b2de4[];   /* _LIT1: u16@+0, u16@+2; strh@+4, +0xaa */
extern char data_ov008_021b27bc[];   /* _LIT2: bitset table base, 0x34-byte rows */

void func_ov008_021aef18(void) {
    int flags = func_0202224c(0);
    int row, bitno, pos;
    int *word;

    func_02022234(0, flags & ~0x2);
    func_020212cc(*(int *)(data_ov008_021b2eac + 0x8));

    row   = func_ov008_021aedfc(*(unsigned short *)(data_ov008_021b2de4) +
                                *(unsigned short *)(data_ov008_021b2de4 + 2));
    bitno = func_ov008_021aee54(*(unsigned short *)(data_ov008_021b2de4) +
                                *(unsigned short *)(data_ov008_021b2de4 + 2));
    pos   = func_ov008_021aee54(*(unsigned short *)(data_ov008_021b2de4) +
                                *(unsigned short *)(data_ov008_021b2de4 + 2));

    word = (int *)(data_ov008_021b27bc + row * 0x34) + (bitno >> 5);
    *word |= 1 << (pos & 0x1f);

    *(unsigned short *)(data_ov008_021b2de4 + 0x4)  = 1;
    *(unsigned short *)(data_ov008_021b2de4 + 0xaa) = 0;
}
