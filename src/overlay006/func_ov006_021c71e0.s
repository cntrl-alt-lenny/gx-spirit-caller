; func_ov006_021c71e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02005088
        .extern func_0202c46c
        .extern func_0208ddec
        .extern func_02094504
        .global func_ov006_021c71e0
        .arm
func_ov006_021c71e0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r5, r0
    mov r4, r1
    bl func_0208ddec
    add r6, r0, #0x420
    ldr r2, _LIT0
    add r1, r6, #0x1000
    mov r0, #0x0
    bl func_02094504
    ldr r0, [r5, #0x38]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, #0x13
    mov r2, r1
    add r0, r5, #0x4
    bl func_02001d0c
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    cmp r4, #0x0
    ldrne r1, [r5, #0x44]
    cmpne r1, #0x0
    ldrnesb r0, [r1]
    cmpne r0, #0x0
    bne .L_26c
    ldr r0, [r5, #0x38]
    bl func_0202c46c
    mov r1, r0
.L_26c:
    mov r0, #0x4
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    add r0, r5, #0x4
    add r2, r6, #0x1000
    mov r3, #0x6
    bl func_02005088
    ldr r0, [r5, #0x2c]
    cmp r4, #0x0
    str r0, [r5, #0x44]
    movne r1, #0x1
    bne .L_2b8
    ldr r0, [r5, #0x44]
    mov r1, #0x0
    cmp r0, #0x0
    ldrnesb r0, [r0]
    cmpne r0, #0x0
    movne r1, #0x1
.L_2b8:
    str r1, [r5, #0x40]
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00002d20
_LIT1: .word data_02104f4c
