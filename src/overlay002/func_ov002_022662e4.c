/* func_ov002_022662e4: scan slots 0..4 with a set 13-bit id, calling
 * func_ov002_021b4120(arg0,i,0x151e); return i on a result of 1. */
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021b4120(int arg0, int i, int arg2);

int func_ov002_022662e4(int arg0) {
    int i;
    char *cursor = data_ov002_022cf16c + (arg0 & 1) * 0x868 + 0x30;
    for (i = 0; i <= 4; i++, cursor += 0x14) {
        unsigned int id13 = ((struct Ov002Slot *)cursor)->id;
        if (id13 != 0) {
            if (func_ov002_021b4120(arg0, i, 0x151e) == 1) return i;
        }
    }
    return -1;
}
