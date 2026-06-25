/* CAMPAIGN-PREP candidate for func_020318b8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted table-init loop + fixed pre/post calls
 *   risk:       duplicate data_0219adb8 literal-pool entry (one raw word) likely won't reproduce; field/arg counts guessed
 *   confidence: low
 */
/* func_020318b8: init a 0xC-entry table. For each entry call an
 * init helper twice (base and base+0x30), then store one byte from a
 * source table into +0x60; stride 0x64. A pre-call sets things up and
 * a post-call finalizes, then a flag at data_0219adb8+0x4 is set.
 *
 *     ldr r0,=data_0219adb8; ldr r1,=0x4f4; ldr r5,=data_0219adcc
 *     bl func_02034754; ldr r6,=data_020fe45c; mov r4,#0
 *  loop: mov r0,r5; bl func_020318a4; add r0,r5,#0x30; bl func_020318a4
 *     ldrb r0,[r6],#1; add r4,r4,#1; cmp r4,#0xC; str r0,[r5,#0x60]
 *     add r5,r5,#0x64; blt loop
 *     ldr r0,=data_0219b27c; bl func_020318a4
 *     ldr r0,=data_0219adb8; mov r1,#1; str r1,[r0,#0x4]
 *
 * NOTE: the original ships a SECOND, raw `.word 0x0219adb8` pool entry
 * for the final store base (patcher-trim bypass). Clean C references
 * the symbol once for the call and once for the store; whether mwcc
 * emits one shared or two pool words is the main matching risk.
 */

typedef struct {
    char _pad_00[0x60];
    int  slot;          /* +0x60 -> byte from source table */
    char _pad_64[0x00];
} TableEntry;            /* stride 0x64 */

typedef struct {
    char _pad_00[0x04];
    int  ready;         /* +0x04 */
} Mgr_020318b8;

extern Mgr_020318b8 data_0219adb8;
extern TableEntry   data_0219adcc;   /* loop base */
extern const unsigned char data_020fe45c[];
extern TableEntry   data_0219b27c;
extern void func_02034754(void *a, int b);
extern void func_020318a4(void *p);

void func_020318b8(void) {
    TableEntry *e = &data_0219adcc;
    const unsigned char *src = data_020fe45c;
    int i;

    func_02034754(&data_0219adb8, 0x4f4);

    for (i = 0; i < 0xC; i++) {
        func_020318a4(e);
        func_020318a4((char *)e + 0x30);
        e->slot = *src++;
        e++;
    }

    func_020318a4(&data_0219b27c);
    data_0219adb8.ready = 1;
}
