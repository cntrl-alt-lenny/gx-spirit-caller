/* CAMPAIGN-PREP candidate for func_0200a364 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     BITFIELD :8 (lsl;lsr) + BIND-once base + counted loop
 *   risk:       struct layout/stride guessed; bitfield storage-unit must stay u16 to keep ldrh + 32-bit shift pair
 *   confidence: med
 */
/* func_0200a364 — counted scan over 0x50 entries, stride 6, clear a flag bit.
   ldrh + (h<<24>>24) test => :8 unsigned bitfield in a u16 unit (shift pair, not 'and').
   f4 &= ~1 on a plain u16 => ldrh; bic #1; strh. */

extern unsigned short data_02106730;

struct Ent {
    unsigned short act : 8;   /* 0x0 low byte (lsl#24; lsr#24) */
    unsigned short      : 8;
    unsigned short _pad;      /* 0x2 */
    unsigned short f4;        /* 0x4 */
};

void func_0200a364(void)
{
    struct Ent *e = (struct Ent *)&data_02106730;
    int i = 0;
    do {
        if (e->act)
            e->f4 &= ~1;
        i++;
        e++;
    } while (i < 0x50);
}
