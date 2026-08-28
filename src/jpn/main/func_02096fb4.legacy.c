/* func_02096fb4: set dev->+0x1c bit 0x200, dispatch through
 * dev->+0x50(dev, param1, param0->+0x4, param2). Result 0/1 clears the
 * bit back; result 6 spins func_020919a4(dev+0xc) under IRQ-disable
 * while the bit stays set, then returns dev->+0x24->+0x14. Any other
 * result (or the 0/1 case) just returns the raw dispatch result.
 * Always accumulates param0->+0x4 += param2 before returning. */

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern void func_020919a4(void *a);

int func_02096fb4(void *param0, int param1, int param2)
{
    void *dev = *(void **)param0;
    int result;

    *(int *)((char *)dev + 0x1c) |= 0x200;

    {
        int (*fn)(void *, int, int, int) = *(void **)((char *)dev + 0x50);
        result = fn(dev, param1, *(int *)((char *)param0 + 0x4), param2);
    }

    switch (result) {
    case 0:
    case 1:
        *(int *)((char *)dev + 0x1c) &= ~0x200;
        break;

    case 6: {
        int irq_state = OS_DisableIrq();

        if ((*(int *)((char *)dev + 0x1c) & 0x200) != 0) {
            do {
                func_020919a4((char *)dev + 0xc);
            } while ((*(int *)((char *)dev + 0x1c) & 0x200) != 0);
        }

        OS_RestoreIrq(irq_state);
        result = *(int *)((char *)(*(void **)((char *)dev + 0x24)) + 0x14);
        break;
    }
    }

    *(int *)((char *)param0 + 0x4) += param2;

    return result;
}
