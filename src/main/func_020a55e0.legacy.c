typedef struct {
    int a, b, c, active;
} Entry;
extern int OS_DisableIrq(void); /* The assembly primitive returns the old IRQ mask in r0. */
extern void OS_RestoreIrq(int unused0);
extern void func_02093bfc(void);

void func_020a55e0(char *ctx, int a, int b, int c, int active) {
    int saved;
    Entry *entry;
    Entry *end;
    saved = OS_DisableIrq();
    entry = (Entry *)(ctx + 0x30);
    end = (Entry *)(ctx + 0x70);
    for (;;) {
        if (entry >= end) func_02093bfc();
        if (entry->active == 0) {
            entry->a = a;
            entry->b = b;
            entry->c = c;
            entry->active = active;
            break;
        }
        entry++;
    }
    OS_RestoreIrq(saved);
}
