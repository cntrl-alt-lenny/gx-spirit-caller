; func_ov004_021d5ce4 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02031c1c
        .extern func_02031d0c
        .extern func_02031d80
        .extern func_02034754
        .extern func_ov004_021d5b14
        .extern func_ov004_021d5b9c
        .extern func_ov004_021d5bdc
        .global func_ov004_021d5ce4
        .arm
func_ov004_021d5ce4:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    mov r1, #0x0
    mov r2, #0x7000000
    bl func_02031d80
    movs r4, r0
    beq .L_184
    ldr r1, _LIT0
    bl func_02034754
    ldr ip, _LIT1
    ldr r3, _LIT2
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x7000000
    str ip, [sp]
    bl func_02031c1c
    mov r6, r1
    mov r5, r0
    cmp r6, #0x0
    cmpeq r5, #0x0
    beq .L_170
    mov r0, r4
    bl func_ov004_021d5bdc
    cmp r0, #0x0
    bge .L_18c
.L_170:
    mov r0, r4
    bl func_02031d0c
    mov r5, #0x0
    mov r6, r5
    b .L_18c
.L_184:
    mov r5, #0x0
    mov r6, r5
.L_18c:
    mov r0, r5
    mov r1, r6
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word 0x00004138
_LIT1: .word func_ov004_021d5b9c
_LIT2: .word func_ov004_021d5b14
