extern int data_ov002_022ce950[];
extern int data_ov002_022cd744[];
extern char data_ov002_022d016c[];
extern int data_ov002_022cd73c[];
struct B968 { char pad[0x300]; unsigned f0 : 1; };
extern struct B968 data_ov002_022cd968;
extern int func_ov002_0229c7f8(int);
extern int func_ov002_021b1cf0(void);

int func_ov002_021ca6f8(int idx) {
    int a = data_ov002_022ce950[0x80c / 4];
    if (a != 0 || data_ov002_022ce950[0x808 / 4] != 0) {
        return 0;
    }
    if (data_ov002_022cd744[idx] == 1) {
        if (*(int *)(data_ov002_022d016c + 0xcec) == idx
            && *(int *)(data_ov002_022d016c + 0xd14) != 0
            && *(int *)(data_ov002_022d016c + 0xd1c) == 3) {
            return 1;
        }
        return 0;
    }
    if (idx == data_ov002_022cd73c[1]) {
        if (*(int *)(data_ov002_022d016c + 0xd48) != 0
            || func_ov002_0229c7f8(0x31) != 0
            || func_ov002_0229c7f8(0x32) != 0) {
            return 1;
        }
        return 0;
    }
    if (data_ov002_022cd968.f0 == 0 && a == 0) {
        if (func_ov002_021b1cf0() != 0) {
            return 1;
        }
    }
    return 0;
}
