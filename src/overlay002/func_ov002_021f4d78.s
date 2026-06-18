; func_ov002_021f4d78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021f4a84
        .extern func_ov002_0226aff0
        .global func_ov002_021f4d78
        .arm
func_ov002_021f4d78:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    ldr r2, [r2, #0x5b4]
    cmp r2, #0xa
    beq .L_3c
    cmp r2, #0xb
    beq .L_6c
    bl func_ov002_021f4a84
    cmp r0, #0x1
    ldmneia sp!, {r3, pc}
    ldr r0, _LIT0
    mov r1, #0xa
    str r1, [r0, #0x5b4]
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_3c:
    ldrh r0, [r0, #0x2]
    ldr r1, _LIT1
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226aff0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, pc}
.L_6c:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x0000ffff
