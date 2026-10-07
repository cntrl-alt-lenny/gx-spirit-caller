/* func_02077c08: store (g, key, port) in the 4-entry cache: reuse the entry
 * matching (key, port), else the first free one, else the oldest. */
typedef struct {
    unsigned char name[0x20];
    unsigned char data[0x30];
    unsigned int stamp;
    unsigned int key;
    unsigned short port;
    unsigned char used;
    unsigned char _pad;
} Entry;
extern Entry data_021a071c[4];
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mode);
extern unsigned long long func_020930b0(void);
extern void func_02094688(void *src, void *dst, int n);

void func_02077c08(void *g, unsigned int key, unsigned int port) {
    Entry *best;
    int irq;
    unsigned int now;
    int i;
    unsigned int best_age;
    Entry *e;

    irq = OS_DisableIrq();
    now = (unsigned int)(func_020930b0() >> 16);
    best = data_021a071c;
    best_age = 0;
    i = 0;
    e = data_021a071c;
    for (; i < 4; i++, e++) {
        if (e->used != 0 && key != 0 && key == e->key && port != 0 && port == e->port) {
            best = e;
            break;
        }
        if (best_age != 0xffffffff) {
            if (e->used == 0) {
                best_age = 0xffffffff;
                best = e;
            } else {
                unsigned int age = now - e->stamp;
                if (age > best_age) {
                    best_age = age;
                    best = e;
                }
            }
        }
    }
    func_02094688((char *)g + 0x74, best, 0x20);
    func_02094688(g, best->data, 0x30);
    best->stamp = now;
    best->used = 1;
    best->key = key;
    best->port = port;
    OS_RestoreIrq(irq);
}
