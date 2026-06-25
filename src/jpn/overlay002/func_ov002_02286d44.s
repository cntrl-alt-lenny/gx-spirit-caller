; func_ov002_02286d44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021c83ac
        .extern func_ov002_022575f0
        .extern func_ov002_0228c754
        .extern func_ov002_0228da7c
        .global func_ov002_02286d44
        .arm
func_ov002_02286d44:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_022575f0
    ldrh r3, [r4, #0x2]
    mov r1, r0
    ldr r2, _LIT0
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0228c754
    movs r1, r0
    bmi .L_6c
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c83ac
    ldrh r3, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    rsb r3, r3, #0x1
    and r3, r3, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, r0
    movle r0, #0x1
    ldmleia sp!, {r4, pc}
.L_6c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word func_ov002_0228da7c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
