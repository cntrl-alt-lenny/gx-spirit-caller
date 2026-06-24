; func_020885b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a5124
        .extern data_021a5128
        .extern data_021a512c
        .extern data_021a51c0
        .extern func_02092484
        .extern func_020927e4
        .global func_020885b8
        .arm
func_020885b8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    ldr r4, [r7, #0x18]
    ldr r0, [r7, #0x1c]
    ldr r1, _LIT0
    mul r0, r4, r0
    ldr r3, [r7, #0xc]
    ldr r2, [r7, #0x10]
    ldr r1, [r1]
    add r6, r3, r0
    cmp r1, #0x0
    add r5, r2, r0
    beq .L_90
    ldr r2, _LIT1
    mov r1, #0x14
    ldr r2, [r2]
    ldr r3, _LIT2
    mul r1, r2, r1
    str r7, [r3, r1]
    add r1, r3, r1
    str r4, [r1, #0x4]
    str r0, [r1, #0x8]
    str r6, [r1, #0xc]
    ldr r0, _LIT3
    mov r2, #0x0
    str r5, [r1, #0x10]
    bl func_02092484
    ldr r0, _LIT1
    ldr r1, [r0]
    add r1, r1, #0x1
    str r1, [r0]
    cmp r1, #0x8
    movge r1, #0x0
    strge r1, [r0]
    b .L_c8
.L_90:
    mov r0, r6
    mov r1, r4
    bl func_020927e4
    mov r0, r5
    mov r1, r4
    bl func_020927e4
    ldr r1, [r7, #0x38]
    mov r0, r6
    str r1, [sp]
    ldr r3, [r7, #0x8]
    ldr r6, [r7, #0x34]
    mov r1, r5
    mov r2, r4
    blx r6
.L_c8:
    ldr r0, [r7, #0x1c]
    add r0, r0, #0x1
    str r0, [r7, #0x1c]
    ldr r1, [r7, #0x1c]
    ldr r0, [r7, #0x30]
    cmp r1, r0
    movge r0, #0x0
    strge r0, [r7, #0x1c]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_021a5124
_LIT1: .word data_021a5128
_LIT2: .word data_021a51c0
_LIT3: .word data_021a512c
