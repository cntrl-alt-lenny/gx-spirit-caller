typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { u32 id:13; u32 rest:19; u32 pad; u16 value; char tail[10]; } Slot;
typedef struct { char pad[0x30]; Slot slots[5]; char tail[0x7d4]; } Side;
extern Side data_ov002_022cf16c[];
extern struct { char pad[0xd44]; int result; char gap[0x54]; int state; } data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern struct { char pad[0xb0]; u16 result; } data_ov002_022d0e6c;
extern int func_ov002_021ae5f0(int x, int y);
extern int func_ov002_021c8940();
extern int func_ov002_02281d78(int a, int b);
int func_ov002_0226cd68(int a, int b) {
    int mask;
    int i, j;
    if (data_ov002_022d016c.state == 0) {
        mask = -1;
        if (b == 0x161c) {
            mask = 0;
            for (i = 0; i < 2; i++) {
                for (j = 0; j <= 4; j++) {
                    if (data_ov002_022cf16c[i & 1].slots[j].id != 0 && data_ov002_022cf16c[i & 1].slots[j].value != 0)
                        mask |= 1 << func_ov002_021c8940(i, j);
                }
            }
        }
        if (data_ov002_022cd744[a] == 1)
            data_ov002_022d016c.result = func_ov002_02281d78(a, b);
        else
            func_ov002_021ae5f0(0xf1, mask);
        data_ov002_022d016c.state++;
        return 0;
    }
    data_ov002_022d0e6c.result = data_ov002_022d016c.result;
    return 1;
}

