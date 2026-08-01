extern void func_02006110(int *a, int *b);

void func_ov009_021ace60(int *self) {
    int y, x;

    func_02006110(&y, &x);

    if (y < 0x21 || y >= 0xdf || x < 0x15 || x >= 0x9d) {
        self[0xf] = 1;   /* +0x3c */
        self[0xc] = 0;   /* +0x30 */
        return;
    }

    self[0xf] = 0;       /* +0x3c */
    {
        int col = 3 - (x - 0x15) / 34;
        int row = 0;
        if (y < 0xa8) {
            row = (y - 0x21) / 45 + 1;
        }
        self[0xd] = row;   /* +0x34 */
        self[0xe] = col;   /* +0x38 */
    }
}
