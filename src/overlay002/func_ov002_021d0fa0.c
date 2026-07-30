struct Ov002Ce950 {
    unsigned short f_0;
    unsigned short f_2;
    unsigned short f_4;
    unsigned short f_6;
    char _pad0[0x80c - 8];
    int f_80c;
    int f_810;
};
extern struct Ov002Ce950 data_ov002_022ce950;

struct Ov002Cd73c {
    char _pad0[4];
    int f_4;
    char _pad1[0x228 - 8];
    int f_228;
};
extern struct Ov002Cd73c data_ov002_022cd73c;

struct Ov002Cf16c {
    char _pad0[0x2c];
    int f_2c;
    char _pad1[0x894 - 0x2c - 4];
    int f_894;
};
extern struct Ov002Cf16c data_ov002_022cf16c;

typedef struct {
    char _pad0[0xd00];
    int f_d00;
} Ov002D016c_t;
extern Ov002D016c_t data_ov002_022d016c;

extern char data_ov002_022cf198[]; /* row table, 0x868/player */

extern void func_ov002_0229ade0(int a, int b, int c, int d);
extern int  func_ov002_0229c7f8(int a);

void func_ov002_021d0fa0(void) {
    int bit15 = (data_ov002_022ce950.f_0 & 0x8000) ? 1 : 0;
    int turn = data_ov002_022ce950.f_2;

    if (data_ov002_022ce950.f_810 == 0) {
        int rawFlag = data_ov002_022cd73c.f_4;
        int toggled = rawFlag ^ 1;
        int idx;

        if (bit15 == toggled) {
            switch (turn) {
            case 1:
                turn = 2;
                break;
            case 2:
                turn = 1;
                break;
            }
            data_ov002_022d016c.f_d00 = turn;
            data_ov002_022cf16c.f_2c = data_ov002_022ce950.f_4;
            data_ov002_022cf16c.f_894 = data_ov002_022ce950.f_6;
        }

        {
            int tableVal;
            if (turn == 2) {
                idx = toggled & 1;
                tableVal = *(int *)(data_ov002_022cf198 + idx * 0x868);
            } else {
                idx = rawFlag & 1;
                tableVal = *(int *)(data_ov002_022cf198 + idx * 0x868);
            }
            data_ov002_022cd73c.f_228 = tableVal;
            func_ov002_0229ade0(2, turn, tableVal, 0);
        }

        data_ov002_022ce950.f_810 += 1;
        return;
    }

    if (func_ov002_0229c7f8(2) == 0) {
        data_ov002_022ce950.f_80c = 0;
    }
}
