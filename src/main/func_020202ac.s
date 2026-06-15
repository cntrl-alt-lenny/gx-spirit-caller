; func_020202ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c67b8
        .extern data_02191f40
        .extern data_02193320
        .extern func_0201f0f4
        .extern func_02020358
        .extern func_02092904
        .extern func_0209f2a8
        .global func_020202ac
        .arm
func_020202ac:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    ldr r3, _LIT0
    mov r6, r0
    mov r5, r1
    ldr r1, [r3, #0x3c]
    ldr r0, _LIT1
    mov r4, r2
    bl func_02092904
    ldr r0, _LIT2
    mov ip, #0xe
    str r0, [sp]
    ldr r0, _LIT3
    mov r1, r4
    mov r2, r6
    mov r3, r5
    str ip, [sp, #0x4]
    mov ip, #0x2
    str ip, [sp, #0x8]
    bl func_0209f2a8
    cmp r0, #0x2
    beq .L_8c
    ldr r1, _LIT0
    ldr r1, [r1, #0x38]
    cmp r1, #0x0
    beq .L_80
    bl func_0201f0f4
    ldr r2, _LIT0
    mov r1, r0
    ldr r2, [r2, #0x38]
    ldr r0, _LIT4
    blx r2
.L_80:
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_8c:
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_02191f40
_LIT1: .word data_02193320
_LIT2: .word 0x0000ffff
_LIT3: .word func_02020358
_LIT4: .word data_020c67b8
