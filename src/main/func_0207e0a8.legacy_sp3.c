/* func_0207e0a8: refresh the five 0x18-byte slots at data_02102120: slot i
 * is enabled (f8 = 1) while i < count (count + 1 when count > 1), and its
 * range is (0, 0x10000) when fc is set, else (0, 0x20000). */
typedef struct {
    int f0;
    int f4;
    int f8;
    int fc;
    int f10;
    int f14;
} Slot;
extern unsigned short data_021a08e0;
extern Slot data_02102120[5];

void func_0207e0a8(void) {
    int count;
    int i;
    Slot *s;

    count = data_021a08e0;
    s = data_02102120;
    if ((unsigned int)count > 1) {
        count++;
    }
    for (i = 0; i < 5; i++) {
        if (i < count) {
            s->f8 = 1;
        } else {
            s->f8 = 0;
        }
        if (s->fc != 0) {
            s->f0 = 0;
            s->f4 = 0x10000;
        } else {
            s->f0 = 0;
            s->f4 = 0x20000;
        }
        s++;
    }
}
