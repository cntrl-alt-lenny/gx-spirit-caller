extern int data_ov002_022cf16c;
extern int func_ov002_021bc8c8(int arg0, int arg1, int arg2);
extern int func_ov002_021c1d28(int arg0, int arg1, int arg2);
extern int func_ov002_021c84e0(int arg0, int arg1);

int func_ov002_0224701c(int arg0) {
    int i;
    int j;
    int sum;
    unsigned char *ptr;

    sum = 0;
    for (i = 0; i < 2; i++) {
        ptr = (unsigned char *)&data_ov002_022cf16c + (i & 1) * 0x868;
        for (j = 0; j < 5; j++) {
            if (func_ov002_021bc8c8(arg0, i, j) == 0) {
                goto next;
            }
            if (func_ov002_021c1d28(i, j, 0) != 0) {
                goto next;
            }
            if (arg0 != i) {
                if (*(unsigned short *)(ptr + 0x38) == 0) {
                    goto next;
                }
            }
            sum += func_ov002_021c84e0(i, j);
        next:
            ptr += 0x14;
        }
    }
    return sum;
}
