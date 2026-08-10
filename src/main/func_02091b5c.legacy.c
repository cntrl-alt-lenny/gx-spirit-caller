/* func_02091b5c: thread/task teardown under an IRQ-disabled critical
 * section. If param0 is the "current" thread (data_021a63d0's +0x4
 * field), fire func_02091be4() first. Then unconditionally run a
 * fixed teardown sequence, conditionally notifying func_02092154 if
 * param0->+0x78 is set, and finish outside the critical section with
 * func_0209198c(). */

extern int data_021a63d0;

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern void func_02091690(void);
extern void func_020916c8(void);
extern void func_0209198c(void);
extern void func_02091a0c(void *a);
extern void func_02091be4(void);
extern void OSi_CancelThreadAlarmForSleep(void *thread);
extern void func_02092074(void *thread);
extern void func_02092154(int a, void *thread);
extern void func_02092700(void *thread);

void func_02091b5c(void *param0)
{
    void *field78;
    int irq_state = OS_DisableIrq();

    if (*(void **)((char *)&data_021a63d0 + 0x4) == param0)
        func_02091be4();

    func_020916c8();
    func_02092700(param0);
    OSi_CancelThreadAlarmForSleep(param0);

    field78 = *(void **)((char *)param0 + 0x78);
    if (field78 != 0)
        func_02092154((int)field78, param0);

    func_02092074(param0);
    *(int *)((char *)param0 + 0x64) = 2;
    func_02091a0c((char *)param0 + 0x9c);
    func_02091690();

    OS_RestoreIrq(irq_state);
    func_0209198c();
}
