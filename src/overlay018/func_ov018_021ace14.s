; func_ov018_021ace14 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov018_021ad71c
        .extern func_020a991c
        .global func_ov018_021ace14
        .arm
func_ov018_021ace14:
    stmdb sp!, {r3, lr}
    bl func_020a991c
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0xb6c]
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x0
    beq .L_44
    blx r0
    cmp r0, #0x0
    beq .L_3c
    ldr r0, _LIT0
    ldr r1, [r0, #0xb6c]
    add r1, r1, #0x1
    str r1, [r0, #0xb6c]
.L_3c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_44:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_021040ac
_LIT1: .word data_ov018_021ad71c
