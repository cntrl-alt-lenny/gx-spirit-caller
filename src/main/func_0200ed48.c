typedef struct {
    char pad[0x60];
    unsigned int on : 1;
    unsigned int rest : 31;
    char pad2[0x220];
} Obj_0200ed48;

typedef struct {
    char pad[0xc];
    int count;
    int pad10;
    Obj_0200ed48 *objs;
} List_0200ed48;

extern List_0200ed48 data_02186ae8;
extern void Fill32(int val, void *dst, int size);

Obj_0200ed48 *func_0200ed48(void) {
    int i = 0;
    Obj_0200ed48 *o;
    int n = data_02186ae8.count;
    Obj_0200ed48 *objs;

    if (n > 0) {
        objs = data_02186ae8.objs;
        o = objs;
        do {
            if (o->on == 0) {
                Fill32(0, &objs[i], 0x284);
                return &data_02186ae8.objs[i];
            }
            i++;
            o++;
        } while (i < n);
    }
    return 0;
}
