/* func_02051a84: P-9 early-return — call-twice, byte-field read (sp3 prologue).
 *
 *     push  {lr}
 *     sub   sp, sp, #0x4
 *     bl    func_020498f0
 *     cmp   r0, #0x0
 *     addeq sp, sp, #0x4
 *     mvneq r0, #0x0
 *     popeq {pc}
 *     bl    func_020498f0
 *     ldrb  r0, [r0, #0x15]
 *     add   sp, sp, #0x4
 *     pop   {pc}
 */

typedef struct {
    char            _pad[0x15];
    unsigned char   f15;
} obj_02051a84_t;

extern obj_02051a84_t *func_020498f0(void);

int func_02051a84(void) {
    if (func_020498f0() == 0) return -1;
    return func_020498f0()->f15;
}
