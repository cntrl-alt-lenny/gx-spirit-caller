/* CAMPAIGN-PREP candidate for func_0205000c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     cmp early-return (byte guard) + 2 byte clears + tail call, RELOAD
 *   risk:       fields 0x15/0x14/0x16 u8, 0x10 word(ptr); func_020673dc takes that word; sp3 routing
 *   confidence: med
 */
/* func_0205000c -> src/main/func_0205000c.legacy_sp3.c (mwcc 1.2/sp3: push{lr}+sub sp,#4+pop{pc}) */
typedef struct {
    char _pad10[0x10];
    int           f10;   /* +0x10 */
    char _pad14[0x14 - 0x14];
    unsigned char f14;   /* +0x14 */
    unsigned char f15;   /* +0x15 */
    unsigned char f16;   /* +0x16 */
} State;
extern State *func_020498f0(void);
extern void  func_020673dc(int);

void func_0205000c(void) {
    if (func_020498f0()->f15 == 2)
        return;
    func_020498f0()->f14 = 0;
    func_020498f0()->f16 = 0;
    func_020673dc(func_020498f0()->f10);
}
