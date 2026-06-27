/* CAMPAIGN-PREP candidate for func_0202c528 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: ASCII->int via mul/mla chain, Fill32 stack struct, signed-byte loads; truncated tail
 *   risk:       ASM IS TRUNCATED (no epilogue/return shown) — the whole flag-pack tail (cmp 0x61/0x66/0x62, lsl#6/#4/#1 inserts, ldrb [r1+4]) is missing, so a byte-match is impossible from this input. struct-guessed AND incomplete-source; needs the full .s.
 *   confidence: low
 */
// func_0202c528 — parse an ASCII date/flags record, fill a stack struct, validate, pack flag bitfields.
// NOTE: the supplied asm is TRUNCATED (ends mid-body at 'mov r4,#0x0' with no epilogue),
// so only the visible prefix is reconstructed; tail (use of r5=[r1+4], final pack/return) is unknown.
extern void Fill32(void *dst, int val, int len);
extern int func_020059b0(void *p, int a, int b, int c);
extern int func_0202c518(void);
extern unsigned char data_020c7b40[];   // _LIT0 payload (struct id / tag word)
extern int *data_0219a93c;              // _LIT2 -> ptr -> int

struct DateRec {
    char _pad9;        // not read here in shown order
    signed char b9;    // [0x9]
    signed char b10;   // [0xa]
    signed char b11;   // [0xb]
    signed char b12;   // [0xc]
    signed char _d;    // [0xd]
    signed char b14;   // [0xe]
    signed char b15;   // [0xf]
    signed char b16;   // [0x10]
    signed char b17;   // [0x11]
};

extern struct { int _x[3]; int *p; } data_0219ad48;  // _LIT1, [+8] -> int*

int func_0202c528(struct DateRec *rec)
{
    unsigned short buf;          // [sp+4], strh r5
    int year = (rec->b10 - '0') * 100
             + (rec->b9  - '0') * 1000
             + (rec->b11 - '0') * 10
             + (rec->b12 - '0');
    int v;
    Fill32((char *)&buf, 0, 12);
    buf = (unsigned short)year;
    /* str r0,[sp] = data_020c7b40 tag; func_020059b0(&buf, lo16(*data_0219a93c), 12 ...) */
    v = func_020059b0(&buf, (int)(unsigned short)(*data_0219a93c), 12, *data_0219ad48.p);
    if (v < 0) {
        return 0;
    }
    /* TRUNCATED: flag-bitfield packing for rec->b14..b17 follows; not reconstructable. */
    return v;
}
