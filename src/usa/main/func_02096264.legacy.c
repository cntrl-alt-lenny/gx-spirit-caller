/* func_02096264: build a 32-bit SIO command word in a stack bitfield
 * (lo5=a, bit5=c&1, hi26=b), reading the (uninitialised) word for each
 * partial assign. Then gate on SIOCNT@0x04000184: if busy bit 0x4000 set,
 * force start+busy and return -1; under IRQ-lock, if 0x2 set return -2,
 * else write the word to 0x04000188 and return 0.
 *
 * DISAGREE candidate: worklist labeled this "small dispatcher", the
 * mechanical re-derivation says "guard chain" (exactly 2 real
 * conditional exits: the 0x4000-busy early-out and the IRQ-locked
 * 0x2-busy early-out). Read directly, it is neither a generic
 * dispatcher nor an abstract guard chain -- it's an NDS SIO/IPC FIFO
 * send routine with a hardware-register guard pair.
 */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);

typedef struct {
    unsigned int f0  : 5;   /* bits 0..4  = a */
    unsigned int f5  : 1;   /* bit  5     = c */
    unsigned int f6  : 26;  /* bits 6..31 = b */
} Cmd;

int func_02096264(int a, int b, int c) {
    Cmd w;
    volatile unsigned short *cnt = (volatile unsigned short *)0x04000184;
    w.f0 = a;
    w.f5 = c;
    w.f6 = b;
    if (*cnt & 0x4000) {
        *cnt |= 0xc000;
        return -1;
    }
    {
        int irqState = OS_DisableIrq();
        if (*cnt & 0x2) {
            OS_RestoreIrq(irqState);
            return -2;
        }
        *(volatile unsigned int *)0x04000188 = *(unsigned int *)&w;
        OS_RestoreIrq(irqState);
        return 0;
    }
}
