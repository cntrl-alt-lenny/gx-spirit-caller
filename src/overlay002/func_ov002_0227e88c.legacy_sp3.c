typedef struct { unsigned int id : 13; unsigned int rest : 19; } Ent;
typedef struct { int pad[3]; unsigned int count; } Tbl;
extern Tbl data_ov002_022cdc78;
extern Ent data_ov002_022cdc88[];

extern int func_ov002_0227e76c(int a);
extern int func_ov002_02281994(int a, int b);
extern int func_0202b9b0(int a);

int func_ov002_0227e88c(int arg)
{
    Ent *p;
    unsigned int i;
    unsigned int id;
    i = 0;
    if (i < data_ov002_022cdc78.count) {
        p = data_ov002_022cdc88;
        do {
            if (func_ov002_0227e76c(i) == 0) {
                id = p->id;
                if (func_ov002_02281994(arg, id) == 0) {
                    if (func_0202b9b0(id) <= 1) return i;
                }
            }
            i++;
            p++;
        } while (i < data_ov002_022cdc78.count);
    }
    return -1;
}
