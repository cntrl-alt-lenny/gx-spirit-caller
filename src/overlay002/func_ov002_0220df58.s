; func_ov002_0220df58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf17c
        .extern func_ov002_0220dd34
        .global func_ov002_0220df58
        .arm
func_ov002_0220df58:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x484]
    add r2, r2, #0x1
    cmp r2, #0x4
    movlt r0, #0x0
    ldmltia sp!, {r4, pc}
    bl func_ov002_0220dd34
    cmp r0, #0x0
    beq .L_15c
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x2
    movcs r0, #0x1
    movcc r0, #0x0
    ldmia sp!, {r4, pc}
.L_15c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf17c
