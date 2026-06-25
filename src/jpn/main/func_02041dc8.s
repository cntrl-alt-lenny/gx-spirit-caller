; func_02041dc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02075684
        .extern func_02091680
        .extern func_02092660
        .extern func_020926d0
        .extern func_02093a0c
        .global func_02041dc8
        .arm
func_02041dc8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x1000
    ldr r0, [r0, #0x12c]
    cmp r0, #0x1
    bne .L_34
    ldr r0, _LIT0
    add r0, r4, r0
    bl func_02093a0c
    ldr r0, _LIT0
    mov r1, #0x20
    add r0, r4, r0
    bl func_02075684
.L_34:
    ldr r0, _LIT1
    add r0, r4, r0
    bl func_020926d0
    add r0, r4, #0x1000
    ldr r0, [r0, #0xc0c]
    cmp r0, #0x1
    bne .L_64
    ldr r0, _LIT1
    add r0, r4, r0
    bl func_02092660
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_64:
    ldr r0, _LIT1
    add r0, r4, r0
    bl func_02092660
    mov r0, #0xa
    bl func_02091680
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x000019d0
_LIT1: .word 0x00001bf4
