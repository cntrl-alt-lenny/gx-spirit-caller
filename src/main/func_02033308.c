/* func_02033308: read 2 adjacent ints (offsets 0xdfc / 0xe00) and
 * return them packed as a long-long via r0/r1.
 *
 *     ldr r2, [r0, #0xdfc]
 *     ldr r1, [r0, #0xe00]
 *     mov r0, r2
 *     bx  lr
 *
 * The mov r0, r2 (rather than ldr r0, [r0, #0xdfc] directly) is
 * forced because mwcc loaded r2 first to keep r1 free for the
 * upper-half load before clobbering r0.
 */

typedef struct {
    char         _pad[0xdfc];
    unsigned int f_dfc;
    unsigned int f_e00;
} state_dfc_t;

unsigned long long func_02033308(state_dfc_t *p) {
    return *(unsigned long long *)&p->f_dfc;
}
