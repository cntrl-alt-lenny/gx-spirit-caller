/* func_020296b8: clear bit 6 (0x40) of halfword at offset 0x19a of *r0.
 * Same shape as func_02025fd0; different field offset and mask.
 *
 *     add  r0, r0, #0x100
 *     ldrh r1, [r0, #0x9a]
 *     bic  r1, r1, #0x40
 *     strh r1, [r0, #0x9a]
 *     bx   lr
 */

typedef struct {
    char           _pad[0x19a];
    unsigned short h_19a;
} state_h19a_t;

void func_020296b8(state_h19a_t *p) {
    p->h_19a &= ~0x40u;
}
