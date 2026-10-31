typedef struct { int f0; int f4; short next; short f0a; } Node;
typedef struct { int scale; int mode; int unused[2]; void *entry; } Record;
typedef struct { unsigned int attr; unsigned short tile; } Sprite;
extern char data_ov004_0220b500[];
extern Node *func_02005dac(int which, int slot_i);
extern void func_ov004_021ca0a4(Record *self, int a, int x, int y, void *p, int index);
extern void func_ov004_021cde38(int x, int y, int tile);
void func_ov004_021ce1ec(void) {
    char *b = data_ov004_0220b500;
    if (*(int *)(b + 0x68) != 0) {
        int x;
        Sprite sprite;
        if (*(int *)(b + 0x68) < 256) *(int *)(b + 0x68) += 16;
        x = *(int *)(b + 0x68);
        if (x < 0) x = -x;
        x = 4 - (256 - x);
        func_ov004_021ca0a4((Record *)(b + 0x5ef8), 1, x, 31, (void *)1, 0);
        sprite.attr = 0xc0002022 | ((unsigned int)((x + 4) & 0x1ff) << 16);
        sprite.tile = 0x2028;
        *(Sprite *)func_02005dac(1, 0) = sprite;
        func_ov004_021cde38(x + 58, 35, 0);
        func_ov004_021cde38(x + 58, 51, 2);
    }
    if (*(int *)(b + 0x6c) != 0) {
        int x;
        Sprite sprite;
        if (*(int *)(b + 0x6c) < 256) *(int *)(b + 0x6c) += 16;
        x = *(int *)(b + 0x6c);
        if (x < 0) x = -x;
        x = 310 - x;
        func_ov004_021ca0a4((Record *)(b + 0x5ef8), 1, x, 74, (void *)1, 1);
        sprite.attr = 0xc000204d | ((unsigned int)((x + 146) & 0x1ff) << 16);
        sprite.tile = 0x2048;
        *(Sprite *)func_02005dac(1, 0) = sprite;
        func_ov004_021cde38(x + 12, 87, 1);
        func_ov004_021cde38(x + 12, 104, 3);
    }
}

