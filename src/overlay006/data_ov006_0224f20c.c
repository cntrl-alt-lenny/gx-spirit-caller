/* Ov006AudioBank -- shared audio-channel "bank" object. Confirmed via
 * func_0202adf8 (caches this object's own address into the
 * data_0219a93c "current bank" global + Fill32-zeroes all 60 bytes)
 * immediately followed by func_0202ae1c (shipped byte-exact .s,
 * dereferences that same cache to fill the just-opened bank) in every
 * one of this struct's 6 confirmed call sites, further corroborated by
 * func_0202af40/func_0202c070/func_0202c1ac (all already-matched,
 * same call chain). +0x20..+0x2b has no accessor found in any matched
 * or raw-.s code checked -- an honest gap, not a guess. Reused across
 * ov006 and ov021 (data_ov021_021ace8c runs the identical call chain,
 * confirmed via src/overlay021/Audio_Init.c). */
typedef struct {
    int   chan;        /* +0x00: written only in func_0202ae1c's chan>=0 path */
    void *h04, *h08, *h0c, *h10, *h14; /* +0x04..+0x14 */
    void *h18, *h1c;   /* +0x18, +0x1c */
    char  _unk20[0xc]; /* +0x20..+0x2b: unconfirmed, true gap */
    void *h2c, *h30, *h34, *h38; /* +0x2c..+0x38 */
} Ov006AudioBank;  /* 0x3c (60) bytes */

Ov006AudioBank data_ov006_0224f20c;
