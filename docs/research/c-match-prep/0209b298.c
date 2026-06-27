/* CAMPAIGN-PREP candidate for func_0209b298 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D bitfield: literal (x&m)<<8>>16 extract; range table; stores in order
 *   risk:       hi field: orig emits and#0x7f00;lsl#8;lsr#16 (not lsr#8;and); written literally to force the 3-insn form, but mwcc may peephole-fold to a shift+and. reshape-able (try :7 bitfield) else permuter-class; field_c struct-guessed.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_0209b298 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: MED tier rarely first-build-matches.
 *   recipe:     bitfield extract as ((b&0x7f00)<<8)>>16 and ((b&0xff)<<16)>>16 (force and;lsl;lsr); range dispatch 0x70-0x74 table; conditional stores in asm order; return func_0209b448(code)
 *   risk:       the field extract hi=(b>>8)&0x7f is emitted by orig as and#0x7f00;lsl#8;lsr#16 (NOT lsr#8;and) - written literally here to force it; if mwcc folds to a plain shift+and the 3-insn sequence collapses. reshape-able (literal shift form) else permuter-class; data_021a83e4.field_c is struct-guessed.
 *   confidence: low
 */
/* func_0209b298: RTC/alarm channel callback. Decodes a packed code (b): high
 * 7 bits select a sub-command, low 8 bits a value. Dispatches: 0x70-0x74 ->
 * per-index table store + ready flag; 0x60/0x62/0x67 -> individual flags;
 * then tail-calls func_0209b448 with the (mostly 0) code and returns its result. */

extern int data_021a83d0;
extern int data_021a83d4;
extern int data_021a840c[];   /* halfword array, 8-byte stride */
extern int data_021a8410[];   /* pointer array, 8-byte stride */

typedef struct {
    /* 0x00 */ int field_0;
    /* 0x04 */ int field_4;
    /* 0x08 */ int field_8;
    /* 0x0c */ int field_c;   /* struct-guessed: a pointer slot */
} Struct_021a83e4;
extern Struct_021a83e4 data_021a83e4;

extern int func_0209b448(int code);

int func_0209b298(int a, unsigned int b, int c) {
    int sub = (int)(((b & 0x7f00) << 8) >> 16);   /* high 7 bits (bits 8..14) */
    int val = (int)(((b & 0xff) << 16) >> 16);    /* low byte */
    if (c != 0)
        return func_0209b448(2);
    if (sub >= 0x70 && sub <= 0x74) {
        int idx = sub - 0x70;
        short *p = (short *)*(int *)((char *)data_021a8410 + (idx << 3));
        if (p != 0)
            *p = (short)((val << 16) >> 16);
        *(short *)((char *)data_021a840c + (idx << 3)) = 1;
        val = 0;
    } else if (sub == 0x60) {
        data_021a83d0 = 1;
    } else if (sub == 0x62) {
        data_021a83d4 = 1;
    } else if (sub == 0x67) {
        int *q = *(int **)&data_021a83e4.field_c;
        if (q != 0)
            *q = val;
        val = 0;
    }
    return func_0209b448(val);
}
