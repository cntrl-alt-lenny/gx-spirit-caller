/* func_0207a1dc: dispatches on a->state (u16) via a 5-entry jump
 * table (0-4). Case 0 further dispatches on
 * func_0209e91c(func_0207a458, 0)'s result (2/3/8/other). Cases 1
 * and 3 share one simple block; cases 2, 4, and out-of-range (>4,
 * via the addls fallthrough) all share another (S-2: default/last-
 * numbered cases grouped at the end of the switch to match the jump
 * table's actual body layout, same convention as func_0200111c.c).
 *
 * legacy (sp2p3) routing: every exit is a separate pop{lr}+bx lr
 * (2-step, Style A) in the .s, not a fused pop{regs,pc} -- see
 * docs/research/style-a-epilogue.md.
 */

typedef struct {
    char pad_00[0x2];
    unsigned short state;
} Obj_0207a1dc_t;

extern void *data_021a088c;
extern int func_0207a458(void);
extern int func_0207b038(int mode);
extern int func_0207af28(void);
extern int func_0207b13c(int a, void *b, int c, int d);
extern int func_0209e91c(void *fn, int x);

int func_0207a1dc(Obj_0207a1dc_t *a) {
    switch (a->state) {
    case 0: {
        int result;

        if (*(int *) ((char *) data_021a088c + 0x2000 + 0x260) == 0xc) {
            func_0207b038(0xa);
            return func_0207af28();
        }

        result = func_0209e91c((void *) func_0207a458, 0);

        if (result == 2) {
            return result;
        }
        if (result == 3) {
            goto case0_mode_a;
        }
        if (result != 8) {
            goto case0_other;
        }

        func_0207b038(0xc);
        return func_0207b13c(1, (char *) data_021a088c + 0x2140, 0, 0x8b4);

    case0_mode_a:
        func_0207b038(0xa);
        return func_0207af28();

    case0_other:
        func_0207b038(0xb);
        return func_0207b13c(7, (char *) data_021a088c + 0x2140, 0, 0x8c0);
    }

    case 1:
    case 3:
        func_0207b038(0xa);
        return func_0207af28();

    default:
    case 2:
    case 4:
        func_0207b038(0xb);
        return func_0207b13c(7, (char *) data_021a088c + 0x2140, 0, 0x8d3);
    }
}
