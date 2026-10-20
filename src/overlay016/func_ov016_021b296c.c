typedef struct {
    unsigned int a, b;
    unsigned char pad8[0x14];
    struct { unsigned int low8:8; unsigned int :24; };
    unsigned char pad20[4];
    struct { unsigned int :17; unsigned int mid4:4; unsigned int :11; };
} state_t;
extern state_t data_02102c90;
extern void func_02001d0c(state_t *p, int a, int b);
extern void func_02004f58(int a, int b, int c, int d, int e, int f);
extern int func_020054a4(int text, int size);
extern void func_02094504(int value, void *dst, unsigned int count);
extern void func_02094550(int *src, int *dst, unsigned int count);

void func_ov016_021b296c(int tile, char *buffer, int text, int size) {
    int width = size / 8;
    char *dst;
    char *second;
    int i;
    int row;
    func_02094504(0, buffer, size);
    func_02001d0c(&data_02102c90, width / 8, 2);
    func_02004f58((int)&data_02102c90, text, (int)buffer,
        (width - func_020054a4(text, 12)) / 2, 2, 12);
    dst = (char *)(0x6600000 + (tile << 7));
    func_02094504(0, dst, 0x400);
    i = 0;
    if ((width / 32) * 2 <= 0) return;
    second = buffer + (width * 8) / 2;
    row = 0;
    do {
        func_02094550((int *)(buffer + ((i / 2) * 256) / 2),
            (int *)(dst + (i * 256) / 2), 0x80);
        func_02094550((int *)(second + ((i / 2) * 256) / 2),
            (int *)(dst + ((i + 1) * 256) / 2), 0x80);
        i += 2;
        row++;
    } while (i < (width / 32) * 2);
}
