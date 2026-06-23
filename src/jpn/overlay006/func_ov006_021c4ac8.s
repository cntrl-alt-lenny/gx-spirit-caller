; func_ov006_021c4ac8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_0224f328
        .extern func_02001cec
        .extern func_02001d48
        .extern func_02001d78
        .extern func_02004f3c
        .extern func_0208dcb4
        .extern func_02094410
        .extern func_ov006_021b69d8
        .extern func_ov006_021b6ae0
        .global func_ov006_021c4ac8
        .arm
func_ov006_021c4ac8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov r9, r0
    bl func_0208dcb4
    mov r4, r0
    ldr r3, [r9, #0x64]
    add r5, r9, #0x9c
    add r1, r4, #0xc40
    mov r0, #0x0
    mov r2, #0x4800
    add r5, r5, r3, lsl #0x4
    bl func_02094410
    add r0, r9, #0x10
    mov r1, #0x20
    mov r2, #0x12
    bl func_02001cec
    ldr r0, [r9, #0x64]
    mov r6, #0x0
    cmp r0, #0x0
    moveq r8, #0x0
    movne r8, #0x1
    mov r7, #0x9
    mvn fp, #0x0
.L_5c:
    ldr sl, [r5, #0x4]
    ldr r0, _LIT0
    mov r1, r8
    add r2, sl, r6
    mov r3, #0x0
    bl func_ov006_021b69d8
    cmp r0, #0x0
    beq .L_d0
    ldr r0, _LIT0
    add r2, sl, r6
    mov r1, r8
    bl func_ov006_021b6ae0
    mov sl, r0
    ldrb r0, [sl]
    bl func_02001d48
    add r0, r9, #0x10
    mov r1, #0x5
    bl func_02001d78
    str r7, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    add r1, sl, #0x1
    add r0, r9, #0x10
    add r2, r4, #0xc40
    mov r3, #0x16
    bl func_02004f3c
    add r0, r9, #0x10
    mov r1, fp
    bl func_02001d78
.L_d0:
    add r6, r6, #0x1
    cmp r6, #0x6
    add r7, r7, #0x13
    blt .L_5c
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0224f328
