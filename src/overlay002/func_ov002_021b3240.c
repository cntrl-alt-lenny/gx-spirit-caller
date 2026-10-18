typedef unsigned short u16;
typedef unsigned int u32;

typedef struct Node {
    u16 w0;
    u16 type : 4;
    u16 rest : 12;
    u16 w4;
    u16 w6;
} Node;

extern Node data_ov002_022d0650[];
extern char data_ov002_022cf1a6[];
extern char data_ov002_022cf16c[];
extern int func_ov002_021b9ecc(int, int);

int func_ov002_021b3240(int a, int b, int c, int d) {
    u16 idx = *(u16 *)(data_ov002_022cf1a6 + (a & 1) * 0x868 + b * 0x14);
    int count = 0;
    while (idx != 0) {
        Node *n = &data_ov002_022d0650[idx];
        int w0 = n->w0;
        u32 t = n->type;
        idx = n->w6;
        if (t >= 6 && t <= 11) {
            int x = w0 & 0xff;
            int y = ((int)(u16)w0 >> 8) & 0xff;
            int r = func_ov002_021b9ecc(x, y);
            if (d == x) {
                u32 f = *(u32 *)(data_ov002_022cf16c + (x & 1) * 0x868 + y * 0x14 + 0x40);
                if (((f >> 6) & 1) == 0 && r == c) {
                    count++;
                }
            }
        }
    }
    return count;
}
