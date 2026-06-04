/* func_ov021_021aaa40: per-frame sub-state machine (+0x38) with a per-state frame
 * counter (+0x3c). State 0 waits 3 frames then builds the layout and advances;
 * state 1 steps the build until the worker finishes then advances; state 2 is
 * done (returns 1). Non-terminal states bump the frame counter and return 0.
 * (ov021_core.h) */
extern void func_ov021_021aaadc(void *);
extern void func_ov021_021aab7c(void *);
extern int  func_020215d8(int);
int func_ov021_021aaa40(void *o) {
    switch (*(int *)((char *)o + 0x38)) {
    case 0:
        if (*(int *)((char *)o + 0x3c) == 3) {
            func_ov021_021aaadc(o);
            *(int *)((char *)o + 0x38) = 1;
            *(int *)((char *)o + 0x3c) = 0;
        }
        break;
    case 1:
        func_ov021_021aab7c(o);
        if (func_020215d8(*(int *)o) == 0) {
            *(int *)o = 0;
            *(int *)((char *)o + 0x38) = 2;
            *(int *)((char *)o + 0x3c) = 0;
        }
        break;
    case 2:
        return 1;
    }
    *(int *)((char *)o + 0x3c) += 1;
    return 0;
}
