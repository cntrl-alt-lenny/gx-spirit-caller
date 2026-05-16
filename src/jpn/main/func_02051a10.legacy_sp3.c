/* func_02051a10: P-9 early-return — call-twice, byte-field read (sp3 prologue).
 *
 *     push  {lr}
 *     sub   sp, sp, #0x4
 *     bl    func_0204987c
 *     cmp   r0, #0x0
 *     addeq sp, sp, #0x4
 *     mvneq r0, #0x0
 *     popeq {pc}
 *     bl    func_0204987c
 *     ldrb  r0, [r0, #0x15]
 *     add   sp, sp, #0x4
 *     pop   {pc}
 */

typedef struct {
    char            _pad[0x15];
    unsigned char   f15;
} obj_02051a84_t;

extern obj_02051a84_t *func_0204987c(void);

int func_02051a10(void) {
    if (func_0204987c() == 0) return -1;
    return func_0204987c()->f15;
}
