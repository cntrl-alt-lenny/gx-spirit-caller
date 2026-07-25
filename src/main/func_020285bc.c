/* func_020285bc -- C-34 re-audit (cm-parked-reaudit-2 batch B). Same
 * init-or-grow shape as func_02026fd8 (E-08, shipped) for the
 * data_0219a92c pool (stride 0x19c instead of 0xe0), plus an extra tail
 * block: if func_020211a4(0) is set, twiddle two NDS sound-control
 * registers 0x1000 apart (mask-and-set bits 0x10/0x200000) and kick off
 * a handful of audio-init calls. Orig has two distinct pool slots for
 * data_0219a92c, split the same way E-08's already-proven recipe splits
 * data_0219a924: the ORIGINAL symbol handles the Fill32 destination
 * address plus the later count-READ/base-WRITE, and the registered
 * ALIAS (data_0219a92c_alias, newly added to symbols.txt/BSS this
 * session, same split-BSS-entry pattern as the existing
 * data_0219a924_alias / data_0219a934_alias) handles the count-WRITE and
 * base-READ (docs/research/codegen-walls.md C-34).
 */

typedef struct {
    void *base;    /* +0x0 */
    int   count;   /* +0x4 */
} pool_0219a92c_t;

extern pool_0219a92c_t data_0219a92c;
extern pool_0219a92c_t data_0219a92c_alias;   /* SAME address -- see symbols.txt */
extern void Fill32(int value, void *dest, int size);
extern void *Task_PostLocked(int size, int align, int flags);
extern int func_020211a4(int arg0);
extern void func_0201d5c0(int a, int b);
extern void func_0201e7e0(void);
extern void func_02005bfc(int a);

int func_020285bc(int arg0)
{
    pool_0219a92c_t *a = &data_0219a92c;

    Fill32(0, a, 8);
    data_0219a92c_alias.count = arg0;
    if (data_0219a92c_alias.base == 0) {
        int size = a->count * 0x19c;
        void *h = Task_PostLocked(size, 4, 0);
        a->base = h;
        Fill32(0, h, size);
    }
    if (func_020211a4(0) != 0) {
        unsigned int *reg0 = (unsigned int *)0x4000000;
        unsigned int *reg1 = (unsigned int *)0x4001000;
        unsigned int mask = 0xffcfffef;
        *reg0 = (*reg0 & mask) | 0x10 | 0x200000;
        *reg1 = (*reg1 & mask) | 0x10 | 0x200000;
        func_0201d5c0(4, 2);
        func_0201d5c0(9, 2);
        func_0201e7e0();
        func_02005bfc(1);
        func_02005bfc(2);
    }
    return 1;
}
