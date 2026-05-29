/* func_ov002_0223ba28: C-39g global-ptr-chase (gotcha 15).
 * Forward a1/a2 to the tail helper so r1/r2 stay live -> the
 * global->ptr->f2 chase temps land in r3/ip (orig), not r1/r2.
 * gotcha 4: source `bit0 ^ bit14` gives orig's bit14-first extract.
 */
typedef unsigned short u16;
struct Sba28 { u16 f0; u16 bit0:1; u16 b1_13:13; u16 bit14:1; u16 b15:1; };
extern char data_ov002_022ce288[];
extern int func_ov002_0223b864(int a0, int a1, int a2);
int func_ov002_0223ba28(int a0, int a1, int a2) {
    struct Sba28 *p = *(struct Sba28 **)(data_ov002_022ce288 + 0x48c);
    if (a0 == (p->bit0 ^ p->bit14)) return func_ov002_0223b864(a0, a1, a2);
    return 0;
}
