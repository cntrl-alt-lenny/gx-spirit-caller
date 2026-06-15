; func_0204ce90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498dc
        .extern func_020498f0
        .extern func_0204aaf4
        .extern func_0204cf7c
        .extern func_0204d438
        .extern func_0204f0a8
        .extern func_02050054
        .extern func_020930b0
        .global func_0204ce90
        .arm
func_0204ce90:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x208]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x204]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1a7]
    bl func_020498f0
    mov r4, r0
    bl func_020930b0
    str r0, [r4, #0x1cc]
    str r1, [r4, #0x1d0]
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_1e3c
    mov r0, #0x3
    bl func_020498dc
    mov r0, #0x0
    bl func_0204f0a8
    bl func_0204aaf4
    cmp r0, #0x0
    beq .L_1e9c
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_1e3c:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_1e74
    mov r0, #0x0
    mov r1, r0
    mov r2, r5
    bl func_0204cf7c
    bl func_0204d438
    cmp r0, #0x0
    beq .L_1e9c
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_1e74:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    bne .L_1e9c
    ldr r1, _LIT0
    mov r0, #0x6
    bl func_02050054
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_1e9c:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0xfffec5e6
