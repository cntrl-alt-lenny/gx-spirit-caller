typedef struct {
    unsigned short pad0;
    unsigned short bit0 : 1;
    unsigned short pad1 : 5;
    unsigned short kind : 6;
    unsigned short pad2 : 4;
} Entry;

typedef struct {
    char pad[0xcec];
    int a;
    int pad2[2];
    int b;
} Glob;

extern Glob data_ov002_022d016c;
extern int data_ov002_022cd3f4[];

int func_ov002_0228881c(Entry *p)
{
    if (data_ov002_022d016c.a == p->bit0) {
        return 0;
    }
    if ((unsigned short)(p->kind + 0xffee) <= 1) {
        return data_ov002_022cd3f4[2];
    }
    return data_ov002_022d016c.b == 5;
}
