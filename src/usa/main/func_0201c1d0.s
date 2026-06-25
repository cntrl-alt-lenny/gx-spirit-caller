; func_0201c1d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02018a50
        .extern func_02018ca8
        .extern func_02018f4c
        .extern func_02018f5c
        .extern func_02019a24
        .global func_0201c1d0
        .arm
func_0201c1d0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r1
    mov r5, r0
    bl GetSystemWork
    mov r0, r4
    bl func_02019a24
    mov r1, #0x10000
    ldr r2, [r5, #0x18]
    rsb r1, r1, #0x0
    and r1, r2, r1
    mov r0, r0, lsl #0x10
    orr r2, r1, r0, lsr #0x10
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, #0x1
    str r2, [r5, #0x18]
    bl func_02018a50
    cmp r4, #0x2f
    movne r7, #0x0
    bne .L_5c
    mov r0, r4
    bl func_02018ca8
    mov r7, r0
.L_5c:
    bl func_02018f4c
    mov r6, r0
    bl func_02018f5c
    mov r1, r0
    mov r0, r6
    mov r2, r4
    add r3, r7, #0xa
    .word 0xeb065b7d
    str r0, [r5]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
