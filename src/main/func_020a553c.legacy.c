typedef struct {
    int start;
    unsigned int size;
    unsigned char *data;
    unsigned int active;
} Entry;
extern int OS_DisableIrq(void); /* Assembly primitive returns the previous IRQ mask in r0. */
extern void OS_RestoreIrq(int unused0);
extern void func_02094688(const void *src, void *dst, unsigned int size);

int func_020a553c(char *ctx, int address, void *dst, unsigned int size) {
    int result = 0;
    int saved;
    Entry *entry;
    Entry *end;
    saved = OS_DisableIrq();
    entry = (Entry *)(ctx + 0x30);
    end = (Entry *)(ctx + 0x70);
    for (; entry < end; entry++) {
        if (entry->active >= 2) {
            int offset = address - entry->start;
            if (offset >= 0 && offset + size <= entry->size) {
                func_02094688(entry->data + offset, dst, size);
                *(int *)ctx = 0;
                result = 1;
                break;
            }
        }
    }
    OS_RestoreIrq(saved);
    return result;
}
