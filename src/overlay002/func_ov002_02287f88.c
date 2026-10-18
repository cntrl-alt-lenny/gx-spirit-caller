typedef struct {
    unsigned short bit0 : 1;
    unsigned short pad : 15;
} hw_t;

typedef struct {
    unsigned int f30 : 13;
    unsigned int f30pad : 19;
    unsigned int f34;
    unsigned short f38;
    char pad2[0x14 - 0xa];
} Slot;

typedef struct {
    char pad[0xcec];
    int fcec;
    char pad2[8];
    int fcf8;
} Duel;

typedef struct {
    char hdr[0x30];
    Slot slots[5];
    char pad[0x868 - 0x30 - 5 * 0x14];
} Row;

extern Row data_ov002_022cf16c[];
extern Duel data_ov002_022d016c;

extern int func_0202f9e8(int a);
extern int func_ov002_021bd948(int a, int b);
extern int func_ov002_021c8470(int a, int b);

int func_ov002_02287f88(void *a) {
    int i;
    for (i = 0; i <= 4; i++) {
        if (func_0202f9e8(data_ov002_022cf16c[((hw_t *)((char *)a + 2))->bit0 & 1].slots[i].f30) != 0
            && data_ov002_022cf16c[((hw_t *)((char *)a + 2))->bit0 & 1].slots[i].f38 != 0) {
            if (data_ov002_022d016c.fcec == ((hw_t *)((char *)a + 2))->bit0 && (unsigned)data_ov002_022d016c.fcf8 <= 2) {
                if (func_ov002_021bd948(((hw_t *)((char *)a + 2))->bit0, i) != 0) {
                    return 1;
                }
            }
            if (func_ov002_021c8470(((hw_t *)((char *)a + 2))->bit0, i) <= 1000) {
                return 1;
            }
        }
    }
    return 0;
}
