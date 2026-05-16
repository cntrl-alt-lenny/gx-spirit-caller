/* func_020a6a60: optional callback dispatch from global struct + post-clear
 * (C-24 recipe: pool-dedup of single struct global, 3 references).
 *
 *     push  {r4, lr}
 *     ldr   r1, .L_020a6b9c       ; r1 = &data_021a9e50 (pool slot 1)
 *     mov   r4, r0
 *     ldr   r0, [r1, #0xc]        ; r0 = data.flag
 *     cmp   r0, #0x0
 *     bne   .L_020a6b90           ; if (flag) skip the callback path
 *     bl    func_020b41bc
 *     ldr   r0, .L_020a6b9c       ; r0 = &data_021a9e50 (SAME slot — dedup)
 *     ldr   r0, [r0, #0x4]        ; r0 = data.fn
 *     cmp   r0, #0x0
 *     beq   .L_020a6b90
 *     blx   r0                    ; data.fn()
 *     ldr   r0, .L_020a6b9c       ; r0 = &data_021a9e50 (SAME slot — dedup)
 *     mov   r1, #0x0
 *     str   r1, [r0, #0x4]        ; data.fn = NULL
 * .L_020a6b90:
 *     mov   r0, r4
 *     bl    func_020a6aac
 *     pop   {r4, pc}
 * .L_020a6b9c: .word data_021a9e50
 */

typedef void (*fn_020a6b54_t)(void);
typedef struct {
    int             _f0;
    fn_020a6b54_t   fn;          /* +0x4 */
    int             _f8;
    int             flag;        /* +0xc */
} ctx_020a6b54_t;

extern ctx_020a6b54_t data_021a9e50;
extern void func_020b41bc(void);
extern void func_020a6aac(void *p);

void func_020a6a60(void *arg) {
    if (data_021a9e50.flag == 0) {
        func_020b41bc();
        if (data_021a9e50.fn != 0) {
            data_021a9e50.fn();
            data_021a9e50.fn = 0;
        }
    }
    func_020a6aac(arg);
}
