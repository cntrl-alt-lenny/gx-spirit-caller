; func_0208a404 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02088f3c
        .extern func_02089240
        .extern func_0208a198
        .extern func_0208af18
        .global func_0208a404
        .arm
func_0208a404:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r6, r1
    mov r7, r0
    mov r0, r6
    mov r5, r2
    bl func_02089240
    cmp r0, #0x0
    addeq sp, sp, #0x14
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [r0]
    bl func_02088f3c
    movs r4, r0
    addeq sp, sp, #0x14
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    mov r1, r5
    bl func_0208af18
    cmp r0, #0x0
    addeq sp, sp, #0x14
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    str r0, [sp]
    str r4, [sp, #0x4]
    str r6, [sp, #0x8]
    str r5, [sp, #0xc]
    ldrb r1, [r0, #0x9]
    ldrh r2, [r0, #0x4]
    ldrb r3, [r0, #0x8]
    mov r0, r7
    bl func_0208a198
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
