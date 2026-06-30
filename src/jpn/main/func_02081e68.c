/* CAMPAIGN-PREP candidate for func_02081e68 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     ACCESSOR u16 (ldrh) + shift left 3
 *   risk:       f30 offset guessed; ldrh zero-extend then lsl#3 is the only sensible codegen.
 *   confidence: high
 */
/* func_02081e68: return (u16 p->f30) << 3. Leaf. */

typedef struct {
    unsigned char  _pad00[0x30];
    unsigned short f30;  /* 0x30 */
} T;

int func_02081e68(T *p) {
    return p->f30 << 3;
}
