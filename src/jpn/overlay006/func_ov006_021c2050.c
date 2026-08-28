/* func_ov006_021c2050: dense 0-7 jump-table dispatch on
 * (self->0x5c + self->0x60*4 + 1). Cases 1-4 pick a self->0x58 sub-state then
 * share a status-message tail (id 58); cases 5/6 share a second tail (id 70,
 * arms an error-record at 0x7c/0x80/0x84); case 7 has its own status-message
 * (id 58) + flag tail; case 0 and out-of-range both no-op.
 */
extern void func_020371b8(int id, int neg1, int c, int d);

int func_ov006_021c2050(void *selfv) {
    char *self = (char *)selfv;
    int a = *(int *)(self + 0x60);
    int b = *(int *)(self + 0x5c);
    int idx = b + ((a << 2) + 1);

    switch (idx) {
    case 1: *(int *)(self + 0x58) = 0; goto tailA;
    case 2: *(int *)(self + 0x58) = 1; goto tailA;
    case 3: *(int *)(self + 0x58) = 3; goto tailA;
    case 4: *(int *)(self + 0x58) = 2;
    tailA:
        func_020371b8(58, -1, 0, 1);
        *(int *)(self + 0x6c) = 1;
        return 1;

    case 5:
        func_020371b8(70, -1, 0, 1);
        *(int *)(self + 0x7c) = 7;
        *(int *)(self + 0x80) = 0xe;
        *(int *)(self + 0x84) = 0;
        goto tailB;
    case 6:
        func_020371b8(70, -1, 0, 1);
        *(int *)(self + 0x7c) = 7;
        *(int *)(self + 0x80) = 0xf;
        *(int *)(self + 0x84) = 0;
        goto tailB;

    case 7:
        func_020371b8(58, -1, 0, 1);
        *(int *)(self + 0x6c) = 0;
        *(int *)(self + 0x50) = 1;
        return 1;

    case 0:
    default:
    tailB:
        return 0;
    }
}
