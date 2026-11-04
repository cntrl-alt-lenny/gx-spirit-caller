typedef struct Entry {
    int unk0;
    int next;
    int unk8;
    int locked;
    unsigned int requirement;
    int unk14;
    int unk18;
} Entry;
typedef struct Resource {
    int unk0;
    unsigned int count;
    int unk8;
    Entry entries[1];
} Resource;
extern int data_020c3f48[];
extern unsigned char data_02104f4c[];
extern unsigned int data_021067b4[];
extern Resource *func_02006c0c(int, int, int);
extern void Copy32(void *src, void *dst, int size);
extern void Task_Invoke(void *p);
extern int func_0202bc84(int a0, int a1);
extern unsigned int func_0200974c(void);
void func_0200a488(int *out1, int *out2) {
    Resource *resource;
    Entry *base;
    Entry *entry;
    int i;
    int word;
    int ready;
    int req;
    int next;
    resource = func_02006c0c(data_020c3f48[3], 4, 0);
    base = resource->entries;
    Copy32(data_021067b4, out1, 0x20);
    if (out2 != 0) {
        Copy32((void *)((unsigned int)data_02104f4c + 0x1888), out2, 0x20);
    }
    entry = base + 1;
    for (i = 1; i <= resource->count; i++) {
        word = i >> 5;
        req = (unsigned short)entry->requirement;
        ready = 0;
        if (*(unsigned int *)((unsigned int)data_02104f4c + word * 4 + 0x1868) & (1 << (i & 31))) {
            entry++;
            continue;
        }
        if (*(int *)((char *)out1 + word * 4) & (1 << (i & 31))) {
            entry++;
            continue;
        }
        if (entry->locked == 0) {
            if (req >= 0xfa0) {
                if (func_0202bc84(req, 0) != 0) ready = 1;
            } else {
                switch (req) {
                case 0: ready = 1; break;
                case 1: if (*(unsigned int *)(data_02104f4c + 0x928) >= 7) ready = 1; break;
                case 2: if (*(unsigned int *)(data_02104f4c + 0x928) >= 24) ready = 1; break;
                case 3: if (func_0200974c() == 1) ready = 1; break;
                case 4: if (*(unsigned int *)(data_02104f4c + 0x928) >= 40) ready = 1; break;
                default: ready = 1; break;
                }
            }
        }
        if (ready == 1) {
            next = entry->next;
            *(int *)((char *)out1 + word * 4) |= 1 << (i & 31);
            *(int *)((char *)out2 + word * 4) &= ~(1 << (i & 31));
            while (next != 0) {
                word = next >> 5;
                *(int *)((char *)out1 + word * 4) |= 1 << (next & 31);
                *(int *)((char *)out2 + word * 4) &= ~(1 << (next & 31));
                next = base[next].next;
            }
        }
        entry++;
    }
    Task_Invoke(resource);
}














