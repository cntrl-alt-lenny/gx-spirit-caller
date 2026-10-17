typedef struct {
    unsigned short pad;
    unsigned short side : 1;
} Obj;

typedef struct {
    int pad0[3];
    int c;
    char pad1[0x874 - 0x10];
    int d;
} Data;

extern Data data_ov002_022cf16c;
extern int func_ov002_021bbeac(int a);

int func_ov002_02296e48(Obj *arg0) {
    int idx;
    int sum;
    int a = func_ov002_021bbeac(0);
    sum = func_ov002_021bbeac(1);
    idx = (1 - arg0->side) & 1;
    sum = a + sum + data_ov002_022cf16c.c + data_ov002_022cf16c.d;
    return *(int *)((char *)&data_ov002_022cf16c + idx * 0x868) <= sum * 300;
}
