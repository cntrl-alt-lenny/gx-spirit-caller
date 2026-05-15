/* func_020454cc: indirect-call thunk via single-global pointer (C-24 recipe).
 *
 *     push  {lr}
 *     sub   sp, sp, #0x4
 *     ldr   r3, .L_020454ec       ; r3 = &data_0219dacc
 *     mov   r2, #0x20
 *     ldr   r3, [r3, #0x0]        ; r3 = *data_0219dacc (= callback)
 *     blx   r3
 *     add   sp, sp, #0x4
 *     pop   {pc}
 */

typedef void (*fn_t)(int x, int y, int z);
extern fn_t data_0219dacc;

void func_020454cc(int arg0, int arg1) {
    data_0219dacc(arg0, arg1, 0x20);
}
