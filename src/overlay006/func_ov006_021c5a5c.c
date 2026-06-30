extern void func_02037208(int a, int b, int c, int d);

int func_ov006_021c5a5c(char *obj) {
    int flag = 0;
    int idx0 = *(int *)(obj + 0x4c);
    if (idx0 == 0) {
        char *cell = obj + idx0 * 16;
        int sum = *(int *)(cell + 0x70) + *(int *)(cell + 0x6c);
        if (sum < *(int *)(obj + 0x22c)) {
            flag = 1;
            *(int *)(obj + 0x44) = 1;
            {
                int idx0b = *(int *)(obj + 0x4c);
                char *cell2 = obj + idx0b * 16;
                int s = *(int *)(cell2 + 0x70) + *(int *)(cell2 + 0x6c);
                *(int *)(obj + 0x48) = *(int *)((obj + s * 16) + 0x7c);
            }
        }
    }
    if (flag) {
        func_02037208(0x3a, 0x3a - 0x3b, 0, 1);
    } else if (flag) {
        func_02037208(0x46, 0x46 - 0x47, 0, 1);
    } else {
        func_02037208(0x43, 0x43 - 0x44, 0, 1);
    }
    return flag;
}
