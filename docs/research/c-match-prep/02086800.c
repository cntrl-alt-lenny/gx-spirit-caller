/* CAMPAIGN-PREP candidate for func_02086800 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     INIT STORE-ORDER + rsb/mul(operand-order)/lsl
 *   risk:       mul operand order (neg-first at 0x30, base-first at 0x34) and the lr/ip temp reg-alloc may flip; 0x10 must store last; offsets guessed.
 *   confidence: med
 */
/* func_02086800: transform init. dst ints at 0/4/0x10/0x14/0x30/0x34;
 * src has int@0x24, u16@0x2c, int@0x28, u16@0x2e. Stores in asm order. */
extern void func_02086800_dummy(void);

void func_02086800(char *dst, char *src) {
    *(int *)(dst + 0x00) = 0x1000;
    *(int *)(dst + 0x14) = 0x1000;
    *(int *)(dst + 0x04) = 0;
    *(int *)(dst + 0x30) = (-*(int *)(src + 0x24) * *(unsigned short *)(src + 0x2c)) << 4;
    *(int *)(dst + 0x34) = (*(int *)(src + 0x28) * *(unsigned short *)(src + 0x2e)) << 4;
    *(int *)(dst + 0x10) = 0;
}
