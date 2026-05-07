/* func_02025fd0: clear bit 10 (0x400) of halfword at offset 0x16a of *r0.
 *
 *     add  r0, r0, #0x100
 *     ldrh r1, [r0, #0x6a]
 *     bic  r1, r1, #0x400
 *     strh r1, [r0, #0x6a]
 *     bx   lr
 *
 * mwcc splits the offset 0x16a into `add #0x100` + `[r0, #0x6a]`
 * because halfword `ldrh`/`strh` have only 8-bit immediate offset
 * encoding (max ±0xff).
 */

typedef struct {
    char           _pad[0x16a];
    unsigned short h_16a;
} state_h16a_t;

void func_02025fd0(state_h16a_t *p) {
    p->h_16a &= ~0x400u;
}
