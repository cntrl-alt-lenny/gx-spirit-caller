typedef struct {
    int w[8];
} Rec_0200bff4;


int func_0200bff4(char *t, int key, int val, Rec_0200bff4 *src) {
    int i = 0;
    char *p = t;
    char *q;
    int id;

    for (; i < 8; i++, p += 0x24) {
        id = *(int *)(p + 0xdc);
        if (id < 0 || key == id) {
            break;
        }
    }
    if (i == 8) {
        return 0;
    }
    q = t + 0xbc + i * 0x24;
    *(Rec_0200bff4 *)q = *src;
    *(int *)(q + 0x18) = val;
    *(int *)(t + i * 0x24 + 0xdc) = key;
    return 1;
}
