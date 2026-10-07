typedef struct {
    char pad0[0xb0];
    int count;
} Tail;

typedef struct {
    char pad0[0x48];
    int f48;
} Ent;

extern char data_02197434[];
extern Tail data_02198434;
extern void func_02021cbc(void *e);

int func_02021bac(void) {
    char *q;
    int i;
    char *p;
    char *base = data_02197434;
    i = 0;
    if (data_02198434.count > 0) {
        p = base + 0x48 + 0x1000;
        q = base + 0x1000;
        do {
            if (*(int *)p != 0) {
                func_02021cbc(p);
            }
            i++;
            p += 0x68;
        } while (i < ((Tail *)q)->count);
    }
    return 1;
}
