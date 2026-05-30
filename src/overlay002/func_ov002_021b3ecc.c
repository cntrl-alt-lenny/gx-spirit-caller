/* func_ov002_021b3ecc: 2-D C-39f 0x868-table lookup + predicate (13
 * band-callers). Reads the u16 at data_ov002_022cf1a6[(arg0&1)*0x868 +
 * arg1*20], runs it through func_ov002_021b3c10 with arg2, and normalises the
 * result to 0/1. The (arg0 & 1) index carries the explicit & 1 (gotcha 14).
 */

extern int func_ov002_021b3c10(int a, int b);
extern unsigned short data_ov002_022cf1a6[];

int func_ov002_021b3ecc(int arg0, int arg1, int arg2) {
    unsigned short v = *(unsigned short *)((char *)data_ov002_022cf1a6 +
                                           (arg0 & 1) * 0x868 + arg1 * 20);
    return func_ov002_021b3c10(v, arg2) != 0;
}
