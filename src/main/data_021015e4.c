/* data_021015e4 (272 bytes): retyped from an opaque byte array into a
 * single typed struct instance (NOT an array) as part of
 * cm-data-inference-3 (deferred there for careful per-field treatment)
 * / cm-data-inference-4.
 *
 * This is the static/default instance of a manager object (message /
 * dialog subsystem, main-RAM address range 0x02066xxx-0x02068xxx).
 * data_021015e0 (src/main/data/data_021015e0.c) holds `void *` pointing
 * at this object; a constructor (func_02067684, still .s) either
 * heap-allocates a fresh 0x110-byte copy or, when called with a null
 * handle, falls back to using THIS static object directly
 * (`movs r5,r0; ldreq r5,_LIT0` where _LIT0 = data_021015e4). A
 * destructor (func_02067354) tears the same object back down and
 * treats `handle == -1` as "already inactive" -- exactly this
 * object's own literal value for that field.
 *
 * Field layout derived entirely from fixed-offset consumer access
 * (real .s call sites, not the array-stride method used for the rest
 * of this campaign, since this is a single instance). Every consumer
 * cited below is a real, already-committed file under src/main/.
 *
 * 10 function-pointer fields were found (more than the 6 originally
 * estimated in cm-data-inference-3's summary) -- each individually
 * confirmed by its own `ldr rX,[[obj],#OFF]` immediately followed by
 * `blx rX` in a real committed .s file, with the base register traced
 * back through its caller to confirm it is this object:
 *   +0x88/+0x8c/+0x90/+0x94/+0x98  func_020667e8.s, func_02066ae8.s
 *   +0x9c                          func_0206627c.s, func_02067438.s
 *   +0xa0/+0xa4                    func_02066650.s
 *   +0xa8                          func_02066d44.s (gated by func_0206627c.s)
 *   +0xd4                          func_0206627c.s
 * All 10 are NULL in this particular (static default) instance --
 * the callback registration itself happens only through the runtime
 * constructor's parameters (func_02067684.s stores ctor args a8..a13
 * straight into +0x88..+0x9c), which this static object never runs
 * through. Every byte past the first 4 is 0 in the original literal;
 * only the sentinel `handle = -1` is non-zero.
 *
 * Byte content is an exact reinterpretation of the same bytes
 * previously shipped as `unsigned char data_021015e4[272]` --
 * mechanically parsed out of the previous literal and round-trip
 * verified via objdump, never hand-transcribed.
 */
typedef struct {
    int handle;             /* +0x00  -1 = inactive; ctor arg a2 (func_02067684.s);
                             * compared/passed as a resource handle by
                             * func_02067354.s (destructor), func_02067438.s,
                             * func_02067560.s */
    char name[0x40];        /* +0x04  ctor strcpy from arg a4 via func_020aadf8.s;
                             * appended by func_02066010.s's debug dump (`add r1,sl,#0x4`) */
    char field_44[0x40];    /* +0x44  ctor strcpy from stack arg a5; base pointer used by
                             * func_02066e00.s / func_02066ee0.s string-append helpers;
                             * bounded by the +0x84 rng[] field starting immediately after */
    signed char rng[4];     /* +0x84  ctor fills via func_020a991c()%N loop (4 iterations);
                             * read with ldrsb (signed) by func_0206627c.s's control-code
                             * dispatch */
    void *cb88;             /* +0x88  callback; ctor arg a8; blx'd in func_020667e8.s /
                             * func_02066ae8.s as (code, dst, userData) */
    void *cb8c;             /* +0x8c  callback; ctor arg a9; blx'd "mode 1" path as
                             * (code, count, dst, userData) */
    void *cb90;             /* +0x90  callback; ctor arg a10; blx'd "mode 2" path, same
                             * shape as cb8c */
    void *cb94;             /* +0x94  callback; ctor arg a11; blx'd unconditionally as
                             * (count, localBuf, userData) */
    void *cb98;             /* +0x98  callback; ctor arg a12; blx'd for mode 1/2 as
                             * (mode, userData) -> int */
    void *cb9c;             /* +0x9c  callback; ctor arg a13; blx'd in func_0206627c.s
                             * (control-code 0x5c) and func_02067438.s as (int, ptr, ptr) */
    void *cba0;             /* +0xa0  callback; blx'd in func_02066650.s prefix-match path
                             * as (u32 packedWord, userData) */
    void *cba4;             /* +0xa4  callback; blx'd in func_02066650.s fallback path as
                             * (ptr, count, userData) */
    void *cba8;             /* +0xa8  callback; blx'd in func_02066d44.s when the
                             * +0x104/+0x108 cache key changes; func_0206627c.s gates the
                             * whole func_02066d44 call on this field being non-NULL first */
    int timestamp1;         /* +0xac  func_02055330() tick snapshot; baseline for
                             * func_020673dc.c's elapsed-time check */
    int timestamp2;         /* +0xb0  second tick snapshot; baseline for
                             * func_02067438.s's elapsed-time checks */
    int flag_b4;            /* +0xb4  set/cleared by func_020673dc.c / func_02066010.s */
    int counter_b8;         /* +0xb8  ctor inits to 1; incremented in func_02067438.s */
    int field_bc;           /* +0xbc  ctor arg a6; guard checked by func_02067354.s
                             * (destructor) and func_02067608.c */
    int field_c0;           /* +0xc0  ctor arg a3; printed by func_02066010.s debug dump */
    int handle2;            /* +0xc4  second handle-like field; guards a func_0205531c
                             * release call in func_02067354.s and an early-out in
                             * func_02067560.s */
    int field_c8;           /* +0xc8  ctor arg a7; truthiness picks which literal string
                             * func_02066010.s's debug dump appends */
    unsigned char field_cc[8]; /* +0xcc  small record written through a &obj+0xcc pointer
                             * argument by func_02067154.s (byte/byte/u16/u32 sub-writes) */
    void *cbd4;             /* +0xd4  callback; blx'd in func_0206627c.s (control-code
                             * 0x3b) with the caller's own (a2, a3, a4) forwarded */
    int slotTable[10];      /* +0xd8  ctor fills all 10 entries with -1 (`mvn r1,#0` in a
                             * 10-iteration loop, hard loop bound matches exactly) */
    int field_100;          /* +0x100 ctor zeroes; address used as the base register for
                             * the +0x108 halfword access elsewhere (`add r0,obj,#0x100;
                             * ldrh r1,[r0,#0x8]`) */
    int cacheKey;           /* +0x104 paired with cacheKeyHi as an on-change cache key
                             * (func_02066d44.s, func_02066010.s) */
    unsigned short cacheKeyHi; /* +0x108 halfword half of the same cache key (strh/ldrh
                             * evidence: func_02067684.s ctor, func_02066d44.s,
                             * func_02066010.s all use `[obj+0x100, #0x8]` halfword ops) */
    unsigned char _pad_10a[2]; /* +0x10a mwcc alignment padding: no consumer ever touches
                             * this offset (grepped clean across the whole module); needed
                             * to align userData to a 4-byte boundary */
    void *userData;         /* +0x10c ctor arg a14 (LAST field, ends the struct exactly at
                             * 0x110 = 272); passed as the trailing "userData" argument to
                             * every cbXX callback above */
} Mgr021015e4;

Mgr021015e4 data_021015e4 = {
    -1, /* handle */
    {
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    }, /* name */
    {
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    }, /* field_44 */
    {
        0x00, 0x00, 0x00, 0x00,
    }, /* rng */
    0, /* cb88 */
    0, /* cb8c */
    0, /* cb90 */
    0, /* cb94 */
    0, /* cb98 */
    0, /* cb9c */
    0, /* cba0 */
    0, /* cba4 */
    0, /* cba8 */
    0, /* timestamp1 */
    0, /* timestamp2 */
    0, /* flag_b4 */
    0, /* counter_b8 */
    0, /* field_bc */
    0, /* field_c0 */
    0, /* handle2 */
    0, /* field_c8 */
    {
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    }, /* field_cc */
    0, /* cbd4 */
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, /* slotTable */
    0, /* field_100 */
    0, /* cacheKey */
    0, /* cacheKeyHi */
    {
        0x00, 0x00,
    }, /* _pad_10a */
    0, /* userData */
};
