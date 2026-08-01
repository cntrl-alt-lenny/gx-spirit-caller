/* func_ov008_021ac350: if data_ov008_021b2ca0_alias's +4 field's low byte is
 * 0, call func_ov008_021ac27c(i,i) for i=0..6; else derive a base
 * index and count from the byte and call func_ov008_021ac27c(base,
 * base%8) count times, incrementing base each time.
 */

extern unsigned short data_ov008_021b2ca0_alias[];
extern void func_ov008_021ac27c(int a, int b);

void func_ov008_021ac350(void) {
    unsigned int byte = (unsigned int)(data_ov008_021b2ca0_alias[2] << 24) >> 24;
    int i;
    unsigned short count;
    unsigned short base;

    if (byte == 0) {
        for (i = 0; i < 7; i++) {
            func_ov008_021ac27c(i, i);
        }
        return;
    }

    {
        int rawCount;
        base = (unsigned short)(byte - 1);
        rawCount = 0x1a - base;
        if (rawCount > 8) rawCount = 8;
        count = (unsigned short)rawCount;
    }

    for (i = 0; i < count; i++) {
        unsigned short mod = (unsigned short)(base % 8);
        func_ov008_021ac27c(base, mod);
        base = (unsigned short)(base + 1);
    }
}
