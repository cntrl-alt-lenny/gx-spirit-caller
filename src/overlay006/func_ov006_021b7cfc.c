typedef struct { unsigned short id; unsigned char count; unsigned char pad; } Entry;
extern int data_020b4768;
extern unsigned int func_0202b0e0(int id);
extern unsigned char func_0202b9ec(void);
extern int func_0202bb20(int a);
extern int func_ov006_021b843c(void *self, int idx, int mode);

int func_ov006_021b7cfc(void *self) {
    char *base = (char *)self;
    int j, count, amount, total, id, limit, i;
    Entry *entry;
    for (j = 0; j < 5; j++) {
        func_ov006_021b843c(self, j, 0);
    }
    limit = data_020b4768;
    count = 0;
    total = 0;
    i = 1;
    if (limit > 1) {
        entry = (Entry *)(base + 0x2a0);
        entry = (Entry *)((char *)entry + 0x6000);
        do {
            id = func_0202b0e0(i);
            amount = func_0202b9ec();
            if (amount > 0 || func_0202bb20(id) != 0) {
                entry->id = id;
                entry->count = amount;
                total += amount;
                entry++;
                count++;
            }
            i++;
        } while (i < limit);
    }
    *(unsigned short *)(base + 0x8160) = count;
    *(unsigned short *)(base + 0x816a) = total;
    return 1;
}


