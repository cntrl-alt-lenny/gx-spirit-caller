/* func_ov011_021cc2b0: scan the 5-entry actor table (stride 0x14); return the
 * first entry for which any of three predicates holds, else 0.
 *
 *     ldr   r4, =data_ov011_021d40c0
 *     mov   r5, #0x0
 *  .loop:
 *     mov r0,r4; bl func_ov000_021ac6c8; cmp r0,#0; bne .found
 *     mov r0,r4; bl func_ov000_021ac670; cmp r0,#0; bne .found
 *     mov r0,r4; bl func_ov000_021ac680; cmp r0,#0; beq .next
 *  .found: mov r0,r4; pop
 *  .next: add r5,#1; cmp r5,#5; add r4,#0x14; blt .loop
 *     mov r0,#0; pop
 */

extern char data_ov011_021d40c0[];
extern int func_ov000_021ac6c8(void *entry);
extern int func_ov000_021ac670(void *entry);
extern int func_ov000_021ac680(void *entry);

void *func_ov011_021cc2b0(void) {
    char *entry = data_ov011_021d40c0;
    int i;
    for (i = 0; i < 5; i++) {
        if (func_ov000_021ac6c8(entry) || func_ov000_021ac670(entry) || func_ov000_021ac680(entry))
            return entry;
        entry += 0x14;
    }
    return 0;
}
