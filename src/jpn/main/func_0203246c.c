/* func_0203246c: IRQ-bracketed circular-buffer advance. Reads the
 * current entry's halfword length at offset +2, aligns the slot
 * size to 4 bytes and adds a 4-byte header, advances head; if
 * the new head reaches/passes the buffer size, wraps to 0.
 * Returns void. Style B epilogue.
 *
 *     stmdb sp!, {r4, lr}
 *     movs  r4, r0
 *     ldmeqia sp!, {r4, pc}              ; null guard
 *     bl    OS_DisableIrq
 *     ldr   r3, [r4, #0x0]                ; head
 *     ldr   r1, [r4, #0x4]                ; tail
 *     cmp   r3, r1
 *     beq   .L_02032514                    ; empty: skip
 *     ldr   r2, [r4, #0xc]                ; buf
 *     ldr   r1, [r4, #0x8]                ; size
 *     add   r2, r2, r3
 *     ldrh  r2, [r2, #0x2]                ; entry length (u16)
 *     add   r2, r2, #0x3
 *     bic   r2, r2, #0x3                  ; align(4)
 *     add   r2, r2, #0x4                  ; + 4-byte header
 *     add   r2, r3, r2                    ; new head
 *     cmp   r2, r1
 *     moveq r2, #0x0
 *     beq   .L_02032510
 *     movhi r2, #0x0
 *  .L_02032510:
 *     str   r2, [r4, #0x0]
 *  .L_02032514:
 *     bl    OS_RestoreIrq
 *     ldmia sp!, {r4, pc}
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);

typedef struct {
    unsigned int   head;
    unsigned int   tail;
    unsigned int   size;
    unsigned char *buf;
} ring_t;

void func_0203246c(ring_t *r) {
    int saved;
    unsigned int new_head;
    unsigned short entry_len;
    if (r == 0) return;
    saved = OS_DisableIrq();
    if (r->head != r->tail) {
        unsigned int slot_size;
        entry_len = *(unsigned short *)(r->buf + r->head + 2);
        slot_size = ((entry_len + 3) & ~3u) + 4;
        new_head = r->head + slot_size;
        /* Asm splits == and > into two predicated stores
         * (`moveq + beq + movhi`) rather than one `movhs`. */
        if (new_head == r->size) {
            new_head = 0;
        } else if (new_head > r->size) {
            new_head = 0;
        }
        r->head = new_head;
    }
    OS_RestoreIrq(saved);
}
