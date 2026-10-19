typedef struct { unsigned short flags, value; char pad[0x808]; int active, state; } Event;
extern Event data_ov002_022ce950;
extern int data_ov002_022cd73c[];
typedef struct { int value; char pad[0x864]; } Player;
extern Player data_ov002_022cf16c[];
extern int func_ov002_0229ade0(int a, int b, int c, int d);
extern int func_ov002_0229c7f8(int a);
extern void func_ov002_021b0b54(int id, int value);
extern int func_ov002_021b0bdc(void *self, int arg);
void func_ov002_021d45ec(void) {
    int flag = (data_ov002_022ce950.flags & 0x8000) != 0;
    int value = data_ov002_022ce950.value;
    int old;
    switch (data_ov002_022ce950.state) {
    case 0:
        func_ov002_0229ade0(13, flag, value, 0);
        ++data_ov002_022ce950.state;
        break;
    case 1:
        if (func_ov002_0229c7f8(13) != 0) return;
        old = data_ov002_022cf16c[flag & 1].value;
        data_ov002_022cf16c[flag & 1].value = value;
        if (flag == data_ov002_022cd73c[1] && data_ov002_022cf16c[flag & 1].value < old)
            func_ov002_021b0b54(54, 1);
        func_ov002_021b0bdc((void *)19, data_ov002_022cf16c[data_ov002_022cd73c[1] & 1].value);
        func_ov002_021b0bdc((void *)20, data_ov002_022cf16c[(data_ov002_022cd73c[1] ^ 1) & 1].value - data_ov002_022cf16c[data_ov002_022cd73c[1] & 1].value);
        data_ov002_022ce950.active = 0;
        break;
    }
}

