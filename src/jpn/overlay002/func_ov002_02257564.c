/* func_ov002_02257564: guarded fp-member dispatch with a 2-D 0x868 gate
 * (16 band-callers). Fetches the current handler via func_ov002_0225737c;
 * if it has an f8 callback and the per-player/per-slot gate bit (bit 2 of
 * the cf1ac 0x868 table entry) is clear, invokes it. f1472 is raised for
 * the duration as a re-entrancy flag.
 */

struct obj { char _pad[8]; int (*f8)(int, int, int); };
struct ce288 { char _pad[1472]; int f1472; };

extern struct ce288 data_ov002_022ce1a8;
extern unsigned int data_ov002_022cf0cc[];
extern struct obj *func_ov002_0225737c(void);

int func_ov002_02257564(int arg0, int arg1, int arg2) {
    struct obj *r = func_ov002_0225737c();
    int ret = 1;
    if (r != 0 && r->f8 != 0) {
        data_ov002_022ce1a8.f1472 = 1;
        if ((*(unsigned int *)((char *)data_ov002_022cf0cc + (arg1 & 1) * 0x868 + arg2 * 20) >> 2) & 1) {
            ret = 0;
        } else {
            ret = r->f8(arg0, arg1, arg2);
        }
    }
    data_ov002_022ce1a8.f1472 = 0;
    return ret;
}
