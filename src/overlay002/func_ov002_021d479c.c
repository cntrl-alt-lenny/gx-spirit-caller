extern int data_ov002_022cd73c[];
extern void func_ov002_0229cd40(void *entry);

typedef struct {
    unsigned short f0;
    unsigned short f1;
    unsigned short f2;
    unsigned short f3;
} EntryT;

typedef struct {
    char header[8];
    EntryT entries[256];
    unsigned int count;
} RingT;

extern RingT data_ov002_022ce950;

void func_ov002_021d479c(unsigned short a0, unsigned short a1, unsigned short a2, unsigned short a3) {
    if (*(int *)((char *)data_ov002_022cd73c + 0x8) == 3) {
        return;
    }

    if (data_ov002_022ce950.count >= 0x100) {
        return;
    }

    data_ov002_022ce950.entries[data_ov002_022ce950.count].f0 = a0;
    data_ov002_022ce950.entries[data_ov002_022ce950.count].f1 = a1;
    data_ov002_022ce950.entries[data_ov002_022ce950.count].f2 = a2;
    data_ov002_022ce950.entries[data_ov002_022ce950.count].f3 = a3;

    func_ov002_0229cd40(&data_ov002_022ce950.entries[data_ov002_022ce950.count]);

    data_ov002_022ce950.count += 1;
}
