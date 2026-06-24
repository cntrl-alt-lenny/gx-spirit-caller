; func_0206b1e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101ca4
        .extern data_0219ebec
        .extern func_0206a2a0
        .extern func_0206a9f4
        .extern func_020aace8
        .extern func_020aaf60
        .global func_0206b1e4
        .arm
func_0206b1e4:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r5, [r4, #0x80]
    cmp r5, #0x0
    ble .L_90
    ldr r0, _LIT0
    ldr r6, [r0]
    mov r0, r6
    bl func_020aace8
    cmp r5, r0
    bls .L_90
    ldr r0, _LIT0
    ldr r7, [r4, #0x7c]
    ldr r5, [r0]
    mov r0, r5
    bl func_020aace8
    mov r2, r0
    mov r0, r7
    mov r1, r5
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_90
    mov r0, r6
    bl func_020aace8
    mov r1, r0
    mov r0, r4
    add r1, r7, r1
    bl func_0206a2a0
    ldr r0, _LIT1
    ldr r3, [r4, #0x494]
    ldr r2, [r0]
    ldr ip, [r4, #0x488]
    mov r0, r4
    mov r1, #0x5
    blx ip
.L_90:
    ldr r0, _LIT1
    ldr r3, [r4, #0x494]
    ldr r2, [r0]
    ldr ip, [r4, #0x488]
    mov r0, r4
    mov r1, #0x4
    blx ip
    mov r0, r4
    bl func_0206a9f4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02101ca4
_LIT1: .word data_0219ebec
