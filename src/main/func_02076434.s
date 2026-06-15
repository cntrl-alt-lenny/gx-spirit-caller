; func_02076434 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101f18
        .extern data_02101f20
        .extern func_02077e58
        .extern func_02077ecc
        .extern func_02077f8c
        .extern func_020945f4
        .global func_02076434
        .arm
func_02076434:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x30
    mov r6, r0
    ldrb r0, [r6, #0x454]
    mov r5, r1
    add r4, r6, #0x3a4
    eors r0, r0, r2
    beq .L_208
    ldr r1, _LIT0
    mov r0, r4
    mov r2, #0x4
    bl func_02077ecc
    b .L_218
.L_208:
    ldr r1, _LIT1
    mov r0, r4
    mov r2, #0x4
    bl func_02077ecc
.L_218:
    mov r0, r4
    mov r1, r6
    mov r2, #0x30
    bl func_02077ecc
    add r0, sp, #0x0
    mov r1, #0x36
    mov r2, #0x30
    bl func_020945f4
    add r1, sp, #0x0
    mov r0, r4
    mov r2, #0x30
    bl func_02077ecc
    mov r0, r4
    mov r1, r5
    bl func_02077e58
    mov r0, r4
    bl func_02077f8c
    mov r1, r6
    mov r0, r4
    mov r2, #0x30
    bl func_02077ecc
    add r0, sp, #0x0
    mov r1, #0x5c
    mov r2, #0x30
    bl func_020945f4
    mov r0, r4
    add r1, sp, #0x0
    mov r2, #0x30
    bl func_02077ecc
    mov r0, r4
    mov r1, r5
    mov r2, #0x10
    bl func_02077ecc
    mov r0, r4
    mov r1, r5
    bl func_02077e58
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_02101f18
_LIT1: .word data_02101f20
