extern void *func_0209c0cc(void);
extern int func_02090868(void);
/* The original calls these thunks with only r0 initialized. */
extern int func_0209bfe4();
extern int func_0209bfd4();
extern void func_020908c0(int);
extern int func_0209c7dc(int,int,int,int,int,int,int,int,int);
extern int func_02007240(void *a, void *b);
extern void func_020945f4(void *, int, unsigned int);
extern void *func_02007230(void);
extern void func_02020ff8(void);
extern int data_02104f3c[];
extern unsigned int data_020c3f48;
typedef struct {
    char pad0[12];
    unsigned int value;
    char pad10[56];
    int active;
    char pad4c[8];
} Entry;
int func_020092e0(Entry *p) {
    int ok = 0;
    int id;
    unsigned int header[2];
    unsigned int max;
    int i;
    if (func_0209c0cc()) {
        id = func_02090868();
        if (id != -3) {
            func_0209bfe4((unsigned short)id);
            data_02104f3c[1] |= !func_0209c7dc(0x8000, (int)header, 8, 0, 0, 0, 6, 1, 0);
            if (data_02104f3c[1] == 0 && header[0] == 0x59474652) {
                data_02104f3c[1] |= !func_0209c7dc(0x8008, (int)p, 0x13b0, 0, 0, 0, 6, 1, 0);
                if (header[1] == func_02007240(p, (void *)0x13b0))
                    ok = 1;
            }
            if (!ok) func_020945f4(p, 0, 0x13b0);
            func_0209bfd4(id & 0xffff);
            func_020908c0((unsigned int)id << 16 >> 16);
        }
    }
    if (func_02007230()) func_02020ff8();

    for (i = 0; i < 60; i++, p++) {
        if (p->active) {
            if (p->value > data_020c3f48) data_020c3f48 = p->value;
        }
    }
    if (data_02104f3c[1] == 0 && ok) return 1;
    return 0;
}




