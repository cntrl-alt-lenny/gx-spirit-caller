typedef unsigned short u16;
typedef unsigned char u8;

typedef struct {
    u16 id;
    u8 pad[22];
} Entry;

typedef struct {
    u8 pad0[0x300];
    Entry e[16];
    int pad1;
    int count;
} Data;

extern Data data_ov002_022ce288;

int func_ov002_0220dd34(int a, int b)
{
    int i, j;
    if (b == 0) {
        return 0;
    }
    for (i = data_ov002_022ce288.count - 1; i >= 0; i--) {
        u16 v = data_ov002_022ce288.e[i].id;
        for (j = i - 1; j >= 0; j--) {
            if (v == data_ov002_022ce288.e[j].id) {
                return 0;
            }
        }
    }
    return 1;
}
