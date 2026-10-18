typedef struct {
    unsigned short id : 13;
    unsigned short rest : 3;
} Entry;

extern char data_ov002_022d0250[];
extern int func_0202ef08(int x);

int func_ov002_02288a48(int *p)
{
    int id = ((Entry *)(data_ov002_022d0250 + (((unsigned int)p[5] << 23) >> 21)))->id;
    if (func_0202ef08(id) != 0) {
        return 1;
    }
    switch (id) {
    case 0x19bc:
        return 1;
    default:
        return 0;
    }
}
