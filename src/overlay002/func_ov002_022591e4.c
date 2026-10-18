extern struct { char _pad0[4]; int f4; } data_ov002_022cd73c;
extern struct { char _pad0[0xd04]; int fd04; } data_ov002_022d016c;
extern int func_ov002_021c9a08();

int func_ov002_022591e4(int a, int b)
{
    if (func_ov002_021c9a08() != 0) {
        switch (b) {
        case 13:
            if (data_ov002_022d016c.fd04 == 3) {
                return 2;
            }
            break;
        case 12:
            if (data_ov002_022d016c.fd04 == 3) {
                return 2;
            }
            if (a == data_ov002_022cd73c.f4) {
                return 2;
            }
            break;
        case 14:
        case 15:
            return 2;
        }
    }
    return 0;
}
