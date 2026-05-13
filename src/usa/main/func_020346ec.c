/* func_020346ec: if `func_02034134()` returns non-null, sets *result->f_30 = 1.
 *
 *     bl func_02034134
 *     cmp r0, #0
 *     movne r1, #1
 *     strne r1, [r0, #0x30]
 */

extern void *func_02034134(void);
void func_020346ec(void) {
    void *p = func_02034134();
    if (p != 0) {
        *(int *)((char *)p + 0x30) = 1;
    }
}
