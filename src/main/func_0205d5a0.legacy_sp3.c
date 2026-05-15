/* func_0205d5a0: indirect-call via callback table (3 fields from arg1).
 *
 *     push  {lr}
 *     sub   sp, sp, #0x4
 *     mov   ip, r0
 *     ldr   r0, [r1, #0x0]
 *     ldr   r2, [r1, #0x8]
 *     ldr   r3, [r1, #0x4]
 *     mov   r1, ip
 *     blx   r3
 *     add   sp, sp, #0x4
 *     pop   {pc}
 */

typedef struct {
    int  arg0;
    void (*fn)(int a, int b, int c);
    int  arg2;
} cb_table_0205d5a0_t;

void func_0205d5a0(int x, cb_table_0205d5a0_t *tbl) {
    tbl->fn(tbl->arg0, x, tbl->arg2);
}
