/* func_02041da8: thunk — pass `*(int *)(p + 0x1124)` to func_0206ef0c.
 *
 *     ldr ip, =func_0206ef0c
 *     add r0, r0, #0x1000
 *     ldr r0, [r0, #0x124]    ; offset 0x1124 split: 0x1000 + 0x124
 *     bx ip
 */

extern int func_0206ef0c(int v);

int func_02041da8(void *p) {
    return func_0206ef0c(*(int *)((char *)p + 0x1124));
}
