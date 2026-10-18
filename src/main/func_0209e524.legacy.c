extern void *func_0209dca8(void);
extern int func_0209dc8c(void);
extern void func_020928cc(void *addr, int len);
typedef struct { char pad[4]; unsigned char *inner; } Obj;
typedef struct { char pad[4]; unsigned short count; unsigned short stride; unsigned short other; unsigned char data[1]; } Table;
void *func_0209e524(unsigned char *table, int id) {
    Obj *obj = func_0209dca8();
    unsigned char *entries[16];
    int i;
    if (func_0209dc8c() != 0) return 0;
    if ((unsigned int)id < 1 || (unsigned int)id > 15) return 0;
    func_020928cc(obj->inner + 0x182, 2);
    if ((*(unsigned short *)(obj->inner + 0x182) & (1 << id)) == 0) return 0;
    if (*(volatile unsigned short *)(table + 4) == 0) return 0;
    entries[0] = table + 0xa;
    i = 0;
    do {
        if (id == *(unsigned short *)(entries[i] + 4)) return entries[i];
        i++;
        entries[i] = (unsigned char *)((unsigned int)entries[i - 1] + *(unsigned short *)(table + 6));
    } while (i < *(volatile unsigned short *)(table + 4));
    return 0;
}







