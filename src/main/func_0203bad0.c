typedef struct {
    char           _0[0x4];
    char           f4[0xaa];
    unsigned char  slots[2];
    char           _b0[0x8];
    unsigned short count;
} obj_0203bad0_t;

extern unsigned char data_020bec1c[];
extern signed char data_0219d9a8[];
extern void *func_02088d7c(void);
extern int func_02088540(void *a, int count, unsigned char *slots);

int func_0203bad0(obj_0203bad0_t *o) {
    unsigned int c;
    int i;
    int left;
    signed char *used;
    unsigned char *p;

    o->slots[0] = o->slots[1] = 0xff;
    left = o->count;
    used = data_0219d9a8;
    for (i = left - 1; i >= 0; i--) {
        p = data_020bec1c;
        if (func_02088d7c() != 0) {
            p += 0x11;
        }
        for (;;) {
            c = *p;
            if (c == 0xff) {
                break;
            }
            if (used[c] == 0) {
                used[c] = 1;
                o->slots[i] = c;
                left--;
                break;
            }
            p++;
        }
    }
    if (left != 0) {
        if (o->slots[1] != 0xff) {
            used[o->slots[1]] = 0;
        }
        if (o->slots[0] != 0xff) {
            used[o->slots[0]] = 0;
        }
        o->slots[1] = 0xff;
        o->slots[0] = 0xff;
        return 0;
    }
    return func_02088540(o->f4, o->count, o->slots) != 0;
}
