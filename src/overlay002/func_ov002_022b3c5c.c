typedef struct { unsigned int attr; unsigned short tile, pad; } Sprite;
typedef struct { int head[2]; int phase; int rest[6]; int value[2]; } State;
extern int data_ov002_022cd73c[];
extern unsigned char data_ov002_022d0f7c[];
extern int func_0207f05c(void *queue, const void *sprite, int count);
void func_ov002_022b3c5c(State *self, int side) {
    int digits[5];
    Sprite digit, icon, bar;
    int y, x, value, i, cursor, n, reverse;
    x = side == (data_ov002_022cd73c[1] ^ 1) ? 0xa8 : 0x33;
    y = (4 - self->phase) * -3;
    value = self->value[side];
    if (value >= 99999) value = 99999;
    n = 0;
    do {
        digits[n++] = value % 10;
        value /= 10;
    } while (value != 0);
    cursor = x + 0x13 + n * 7 / 2;
    digit.attr = 0x2000;
    digit.tile = 0;
    for (i = 0; i < n; i++) {
        cursor -= 7;
        digit.attr = (digit.attr & 0xfe00ff00) | ((y + 1) & 0xff) | ((cursor & 0x1ff) << 16);
        digit.tile = (digit.tile & ~0x3ff) | ((0x2400 + (digits[i] << 6)) / 32);
        func_0207f05c(data_ov002_022d0f7c, &digit, 1);
    }
    icon.attr = ((x & 0x1ff) << 16) | ((y & 0xff) | 0x40002000);
    if (side == (data_ov002_022cd73c[1] ^ 1)) reverse = 1; else reverse = 0;
    icon.tile = (0x2700 + reverse * 0x180) / 32;
    func_0207f05c(data_ov002_022d0f7c, &icon, 1);
    icon.attr = (icon.attr & 0xfe00ff00) | (y & 0xff) | (((x + 15) & 0x1ff) << 16);
    func_0207f05c(data_ov002_022d0f7c, &icon, 1);
    icon.attr = (icon.attr & 0xfe00ff00) | (y & 0xff) | (((x + 21) & 0x1ff) << 16);
    icon.attr = (icon.attr & 0xc1fffcff) | 0x10000000;
    func_0207f05c(data_ov002_022d0f7c, &icon, 1);
    cursor = 0x58;
    n = self->value[side];
    if (n >= 8000) n = 8000;
    n = (n + 99) / 100;
    reverse = side == (data_ov002_022cd73c[1] ^ 1);
    bar.attr = 0x6000;
    bar.tile = (0x2680 + reverse * 0x180) / 32;
    y += reverse * 4;
    if (side == (data_ov002_022cd73c[1] ^ 1)) {
        cursor += 0x50;
        while (n > 0) {
            cursor -= 16;
            if (n < 16) cursor += 16 - n;
            bar.attr = (bar.attr & 0xfe00ff00) | (y & 0xff) | ((cursor & 0x1ff) << 16);
            func_0207f05c(data_ov002_022d0f7c, &bar, 1);
            n -= 16;
        }
    } else {
        while (n > 0) {
            if (n < 16) cursor -= 16 - n;
            bar.attr = (bar.attr & 0xfe00ff00) | (y & 0xff) | ((cursor & 0x1ff) << 16);
            func_0207f05c(data_ov002_022d0f7c, &bar, 1);
            n -= 16;
            cursor += 16;
        }
    }
}











