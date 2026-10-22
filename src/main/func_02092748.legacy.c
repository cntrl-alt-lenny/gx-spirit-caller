#include <nitro/os_thread.h>
typedef struct Container {
    void *head;
    void *f04;
} Container;
/* The IRQ assembly returns the saved mask in r0. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void OSi_DequeueItem(OSThread *thread, OSMutex *mutex);
extern void func_02091a0c(Container *c);
extern OSThreadInfo data_021a63d0;

void func_02092748(OSMutex *mutex)
{
    int irq = OS_DisableIrq();
    OSThread *thread = data_021a63d0.current;
    if (mutex->thread == thread) {
        mutex->count = mutex->count - 1;
        if (mutex->count == 0) {
            OSi_DequeueItem(thread, mutex);
            mutex->thread = 0;
            func_02091a0c((Container *)mutex);
        }
    }
    OS_RestoreIrq(irq);
}
