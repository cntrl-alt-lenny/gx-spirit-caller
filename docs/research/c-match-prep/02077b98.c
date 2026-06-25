/* CAMPAIGN-PREP candidate for func_02077b98 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     IRQ-guarded counted scan, helper call, early break
 *   risk:       r4 reused as both arg-save and const 0x20; slot stride 0x5c via pointer-bump vs base+index; break vs fallthrough block order
 *   confidence: med
 */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern unsigned char data_021a071c;
extern int func_020a7440(void *a, void *b, int n);

struct Slot02077b98 {
    char pad5a[0x5a];
    unsigned char active;           /* +0x5a */
    char tail[0x5c - 0x5b];
};

void func_02077b98(char *arg)
{
    int irq = OS_DisableIrq();
    struct Slot02077b98 *slot = (struct Slot02077b98 *)&data_021a071c;
    char *buf = arg + 0x74;
    int i = 0;

    do {
        if (slot->active != 0) {
            if (func_020a7440(slot, buf, 0x20) == 0) {
                slot->active = 0;
                break;
            }
        }
        i++;
        slot = (struct Slot02077b98 *)((char *)slot + 0x5c);
    } while (i < 4);

    OS_RestoreIrq(irq);
}
