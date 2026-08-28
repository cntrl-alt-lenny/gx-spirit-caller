/* func_02091a74: thread/task teardown under an IRQ-disabled critical
 * section. If param0 is the "current" thread (data_021a62f0's +0x4
 * field), fire func_02091afc() first. Then unconditionally run a
 * fixed teardown sequence, conditionally notifying func_0209206c if
 * param0->+0x78 is set, and finish outside the critical section with
 * func_020918a4(). */

extern int data_021a62f0;

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern void func_020915a8(void);
extern void func_020915e0(void);
extern void func_020918a4(void);
extern void func_02091924(void *a);
extern void func_02091afc(void);
extern void OSi_CancelThreadAlarmForSleep(void *thread);
extern void func_02091f8c(void *thread);
extern void func_0209206c(int a, void *thread);
extern void func_02092618(void *thread);

void func_02091a74(void *param0)
{
    void *field78;
    int irq_state = OS_DisableIrq();

    if (*(void **)((char *)&data_021a62f0 + 0x4) == param0)
        func_02091afc();

    func_020915e0();
    func_02092618(param0);
    OSi_CancelThreadAlarmForSleep(param0);

    field78 = *(void **)((char *)param0 + 0x78);
    if (field78 != 0)
        func_0209206c((int)field78, param0);

    func_02091f8c(param0);
    *(int *)((char *)param0 + 0x64) = 2;
    func_02091924((char *)param0 + 0x9c);
    func_020915a8();

    OS_RestoreIrq(irq_state);
    func_020918a4();
}
