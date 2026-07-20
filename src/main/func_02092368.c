/* func_02092368: store a constant to data_021024b0. Natural C
 * (`data_021024b0 = 0x82000001;`) compiles but with r0/r1 swapped
 * from the original's register choice (mwcc picks r1=const, r0=addr;
 * orig has r0=const, r1=addr) -- ships as asm to match exactly.
 */

extern int data_021024b0;

asm void func_02092368(void) {
    nofralloc
    ldr     r0, =0x82000001
    ldr     r1, =data_021024b0
    str     r0, [r1, #0x0]
    bx      lr
}
