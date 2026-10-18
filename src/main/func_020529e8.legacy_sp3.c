extern void *func_0205236c(int idx);
extern int func_02052b34(void *a0, int a1);
extern void func_02052768(char *a0, int a1, int a2);
extern void func_0205230c(void *self, int a, int b, int c);
extern int func_02051f1c(void *self);
extern char *data_0219e3ec;

typedef struct {
    int data;
    int pad4[2];
    volatile int done;
    int pad10;
    int size;
    int pad18;
    unsigned char active;
} Slot;

int func_020529e8(int kind, int id, int data, int size) {
    Slot *slot;
    char header[8];
    int count;
    int total;
    void (*cb)(int, int);
    slot = func_0205236c(id);
    if (func_02052b34((void *)id, kind) == 0) return 0;
    slot->active = 1;
    slot->data = data;
    slot->done = 0;
    slot->size = size;
    func_02052768(header, kind, size);
    func_0205230c((void *)id, (int)header, 8, 1);
    count = *(unsigned short *)(data_0219e3ec + 0x610);
    if (size <= count) count = size;
    if (count > func_02051f1c((void *)id)) return 1;
    func_0205230c((void *)id, data, count, 1);
    slot->done += count;
    total = slot->size;
    if (slot->done == total) {
        slot->active = 0;
        slot->data = 0;
        slot->done = 0;
        slot->size = 0;
        cb = *(void (**)(int, int))(data_0219e3ec + 0x600);
        if (cb != 0 && kind == 1) cb(total, id);
    }
    return 1;
}

