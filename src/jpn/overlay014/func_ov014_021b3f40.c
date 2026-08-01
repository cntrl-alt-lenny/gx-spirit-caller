extern void func_0201e910(int a, int b, void *coords, int d, int e, int f, int g, int h, int i, int j, int k, int l);

int func_ov014_021b3f40(char *self)
{
    int coords[2];

    coords[0] = 0x80000;
    coords[1] = 0x60000;

    if (*(int *)(self + 0x58) != 0) {
        *(int *)(self + 0x58) = 0;
    } else {
        func_0201e910(1, *(int *)(*(char **)(self + 0xc) + 0x2c), coords, 0, 0, 0, 0, 0, 0, 0, 0, 0);
        func_0201e910(1, *(int *)(*(char **)(self + 0xc) + 0x2c) + 8, coords, 0, 0, 0, 0, 3, 0, 0, 0, 0);
        func_0201e910(1, *(int *)(*(char **)(self + 0x20) + 0x2c), coords, 0, 0, 0, 0, 1, 0x6000, 0x200, 0, 0);
        func_0201e910(1, *(int *)(*(char **)(self + 0x34) + 0x2c), coords, 0, 0, 0, 0, 2, 0xa000, 0x400, 0, 0);
        func_0201e910(1, *(int *)(*(char **)(self + 0x48) + 0x2c), coords, 0, 0, 0, 0, 1, 0x12000, 0x600, 0, 0);
    }

    return 1;
}
