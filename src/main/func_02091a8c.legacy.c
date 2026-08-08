typedef struct {
    char _pad0[0x64];
    unsigned int flag_64;
    char _pad1[0x78 - 0x68];
    void *owner_78;
} item_t;

extern void **data_021a63c8;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void OSi_InsertLinkToQueue(void *queue, void *item);
extern void func_02091f88(void);

void func_02091a8c(void *q) {
    int saved = OS_DisableIrq();
    item_t *item = (item_t *)*data_021a63c8;
    if (q != 0) {
        item->owner_78 = q;
        OSi_InsertLinkToQueue(q, item);
    }
    item->flag_64 = 0;
    func_02091f88();
    OS_RestoreIrq(saved);
}
