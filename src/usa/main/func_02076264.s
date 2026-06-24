; func_02076264 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101e38
        .extern data_02101e40
        .extern func_020783b0
        .extern func_02078424
        .extern func_020784e4
        .extern func_02094500
        .global func_02076264
        .arm
func_02076264:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x28
    mov r6, r0
    ldrb r0, [r6, #0x454]
    mov r5, r1
    add r4, r6, #0x2ec
    eors r0, r0, r2
    beq .L_34
    ldr r1, _LIT0
    mov r0, r4
    mov r2, #0x4
    bl func_02078424
    b .L_44
.L_34:
    ldr r1, _LIT1
    mov r0, r4
    mov r2, #0x4
    bl func_02078424
.L_44:
    mov r0, r4
    mov r1, r6
    mov r2, #0x30
    bl func_02078424
    add r0, sp, #0x0
    mov r1, #0x36
    mov r2, #0x28
    bl func_02094500
    add r1, sp, #0x0
    mov r0, r4
    mov r2, #0x28
    bl func_02078424
    mov r0, r4
    mov r1, r5
    bl func_020783b0
    mov r0, r4
    bl func_020784e4
    mov r1, r6
    mov r0, r4
    mov r2, #0x30
    bl func_02078424
    add r0, sp, #0x0
    mov r1, #0x5c
    mov r2, #0x28
    bl func_02094500
    mov r0, r4
    add r1, sp, #0x0
    mov r2, #0x28
    bl func_02078424
    mov r0, r4
    mov r1, r5
    mov r2, #0x14
    bl func_02078424
    mov r0, r4
    mov r1, r5
    bl func_020783b0
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_02101e38
_LIT1: .word data_02101e40
