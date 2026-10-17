/* func_02077db0: look up the cache entry (used, no key, no port) whose name
 * equals g's name at 0x74 and copy its data into g; f30 reports a hit. */
typedef struct {
    unsigned char name[0x20];
    unsigned char data[0x30];
    unsigned int stamp;
    unsigned int key;
    unsigned short port;
    unsigned char used;
    unsigned char _pad;
} Entry;
typedef struct {
    unsigned char _pad_00[0x30];
    unsigned char f30;
} Ctx;
extern Entry data_021a071c[4];
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mode);
extern void func_02094688(void *src, void *dst, int n);
extern int func_020a7440(void *a, void *b, int n);

void func_02077db0(Ctx *g) {
    int i;
    int irq;
    Entry *e;

    irq = OS_DisableIrq();
    i = 0;
    e = data_021a071c;
    g->f30 = 0;
    for (; i < 4; i++, e++) {
        if (e->used != 0 && e->key == 0 && e->port == 0 &&
            func_020a7440(e, (char *)g + 0x74, 0x20) == 0) {
            func_02094688(e->data, g, 0x30);
            g->f30 = 1;
            break;
        }
    }
    OS_RestoreIrq(irq);
}
