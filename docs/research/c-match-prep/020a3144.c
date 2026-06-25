/* CAMPAIGN-PREP candidate for func_020a3144 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard early-return; if/else conditional stores (moveq/movne)
 *   risk:       struct offsets guessed; mwcc may emit branch instead of cond-exec moveq/streq; final ldr-reload of base; ships .s
 *   confidence: low
 */
/* func_020a3144 — guard (field_c==2) then if/else cond-store pair, then field_c=3.
 * Leaf -> default mwcc 2.0/sp1p5 (plain .c). Ships as .s (reg-alloc walled).
 * data_021a9850: field+0xc = u8 state; field+0x4 = ptr p; field+0x8 = ptr; field+0x10 = u8.
 * p+0x4b2 = u8 flag.
 */

typedef struct {
    char _pad04[0x4];
    unsigned char *f_4;     /* +0x4 */
    void          *f_8;     /* +0x8 */
    unsigned char  f_c;     /* +0xc */
    unsigned char  f_d[3];
    unsigned char  f_10;    /* +0x10 */
} data_021a9850_t;

extern data_021a9850_t data_021a9850;

void func_020a3144(void)
{
    unsigned char *p;

    if (data_021a9850.f_c != 2)
        return;

    p = data_021a9850.f_4;
    if (p[0x4b2] == 0) {
        data_021a9850.f_10 = 9;
        data_021a9850.f_8 = p;
    } else {
        data_021a9850.f_8 = p + 0x220;
        data_021a9850.f_10 = 4;
    }
    data_021a9850.f_c = 3;
}
