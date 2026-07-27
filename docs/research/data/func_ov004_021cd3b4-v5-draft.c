/* RESEARCH ARTIFACT — NOT byte-exact, NOT wired into the build.
 *
 * Best draft from cm-ov004-021cd3b4-finish (2026-07-25); see
 * docs/research/cm-ov004-021cd3b4-finish-2026-07-25.md for the full
 * writeup. Verified via `tools/verify.py --cc 2.0 --module overlay004
 * --gap build/eur/delinks/src/overlay004/func_ov004_021cd3b4.o`:
 * DIFF 188v196 (2.0) — structurally correct (every branch type/target
 * shape matches; all remaining diffs are register-choice or
 * pool-offset consequences), but two residuals remain open:
 *
 *   1. "Task-config field-write scheduling order": mwcc reorders the
 *      cmd.f0c / cmd.handle stores relative to each other regardless
 *      of source statement order or struct-vs-raw-cast access style
 *      (both tried, both produced byte-identical output to each
 *      other).
 *   2. A register-choice difference (r0 vs r2) in the word_a
 *      bit-packing block below, tried both as one combined expression
 *      and as a step-by-step per-asm-line transliteration — no
 *      change either way.
 *
 * Preserved here so a future attempt doesn't have to re-derive the
 * callee signatures (cross-checked against already-matched siblings
 * func_ov004_021cbf84.c / func_ov004_021da898.c / the shared
 * func_02006c0c+func_0201d47c+func_0201e5b8+Task_Invoke config-struct
 * idiom in func_ov008_021b2064.c / func_ov010_021b32ac.c) from
 * scratch.
 */

extern char data_ov004_0220b500[];
extern char data_021040ac[];
extern int data_02104c94;
extern char data_ov004_02209cc8[];
extern int data_02104f4c[];

extern void *func_0208e0a0(void);
extern void func_02094550(void *a, void *b, int n);
extern void func_02001d68(int arg);
extern void func_ov004_021cb63c(int a, int b, int c);
extern void OS_SPrintf(void *out, void *fmt, int a);
extern int func_02006c0c(void *a, int b, int c);
extern void func_0201d47c(void *buf);
extern void func_0201e5b8(void *buf);
extern void Task_Invoke(int task);
extern int func_0202c0c0(int a);
extern void func_ov004_021ca0a4(int a, int b, int c, int d, int e, int f);
extern void *func_02005dac(int a, int b);
extern void func_ov004_021cb778(int a, int b, int c, int d, int e);
extern void func_ov004_021cb568(int a, int b, int c, int d);
extern void func_02094504(int a, void *b, int c);

typedef struct {
    int handle;
    char _pad04[0xc - 0x4];
    int f0c;
    short f10;
    char _pad12[0x14 - 0x12];
    unsigned short flags;
} Cmd;

void func_ov004_021cd3b4(void) {
    char *b = data_ov004_0220b500;

    if (*(int *)(b + 0x8c) <= 0x100) {
        return;
    }

    if (*(int *)(b + 0x74) == 0) {
        goto l_eb4;
    }
    if (*(int *)(b + 0x94) != 0) {
        goto l_d34;
    }

    {
        char text[32];
        Cmd cmd;
        int handle;
        int raw;

        func_02094550(b + 0x5258, (char *)func_0208e0a0() + 0x200, 0x280);

        func_02001d68(*(signed char *)(data_021040ac + 0xbcd));

        func_ov004_021cb63c(2, (int)&data_02104c94, 0x80);

        raw = *(int *)(data_021040ac + 0xba8);
        OS_SPrintf(text, data_ov004_02209cc8,
                   (((raw & 0x3e0) >> 5) - 1) * 10 + (raw & 0x1f));

        handle = func_02006c0c(text, 4, 0);
        func_0201d47c(&cmd);

        cmd.f10 = -1;
        cmd.f0c = 0x4080;
        cmd.flags = (cmd.flags & ~0xf) | 9;
        cmd.handle = handle;
        cmd.flags |= 0x10;

        func_0201e5b8(&cmd);
        Task_Invoke(handle);

        func_02001d68((int)((unsigned int)(data_02104f4c[1] << 29) >> 29));

        {
            int i;
            for (i = 0; i < 2; i++) {
                func_ov004_021cb63c(i + 3, func_0202c0c0(i + 0x3bb), 0x80);
            }
        }
    }

l_d34:
    {
        int t0 = *(int *)(b + 0xa4);
        int t1 = *(int *)(b + 0x8c);
        int word_a;
        int fa4;
        int word_b_slot;
        void *obj;

        t0 = 0x81 - t0;
        t0 = t0 & 0xff;
        t1 = t1 + 0x17;
        t0 = t0 | 0x2000;
        t1 = t1 << 23;
        t0 = t0 | 0x80000000;
        t0 = t0 | ((unsigned int)t1 >> 7);
        word_a = t0;

        *(unsigned short *)&word_b_slot = 0x2881;

        obj = func_02005dac(2, 0);
        ((int *)obj)[0] = word_a;
        ((int *)obj)[1] = word_b_slot;

        fa4 = *(int *)(b + 0xa4);
        func_ov004_021cb778(0x4e, 0x81 - fa4, 2, 2, 0x80);

        {
            int fb0 = *(int *)(b + 0xb0);
            fa4 = *(int *)(b + 0xa4);
            func_ov004_021ca0a4((int)(b + 0x5f90), 2, 9, 0x63 - fa4, 3,
                                (fb0 == 1 ? 1 : 0) + 15);
        }
        {
            int fb0 = *(int *)(b + 0xb0);
            fa4 = *(int *)(b + 0xa4);
            func_ov004_021ca0a4((int)(b + 0x5f90), 2, 0x75, 0x63 - fa4, 3,
                                (fb0 == 2 ? 1 : 0) + 15);
        }

        fa4 = *(int *)(b + 0xa4);
        func_ov004_021cb778(-4, 0x68 - fa4, 3, 3, 0x80);

        fa4 = *(int *)(b + 0xa4);
        func_ov004_021cb778(0x68, 0x68 - fa4, 4, 3, 0x80);

        {
            int f90 = *(int *)(b + 0x90);
            fa4 = *(int *)(b + 0xa4);
            if (f90 == 0) {
                func_ov004_021cb568(9, 0x63 - fa4, 0x67, 0x18);
            } else if (f90 == 1) {
                fa4 = *(int *)(b + 0xa4);
                func_ov004_021cb568(0x75, 0x63 - fa4, 0x67, 0x18);
            }
        }

        {
            int f94b = *(int *)(b + 0x94);
            if (f94b < 5) {
                *(int *)(b + 0x94) = f94b + 1;
            }
        }
    }
    goto l_edc;

l_eb4:
    {
        int f94 = *(int *)(b + 0x94);
        if (f94 > 0) {
            f94 -= 1;
            *(int *)(b + 0x94) = f94;
            if (f94 == 0) {
                func_02094504(0, (char *)func_0208e0a0() + 0x200, 0x280);
            }
        }
    }

l_edc:
    *(int *)(b + 0xa4) = 0;
}
