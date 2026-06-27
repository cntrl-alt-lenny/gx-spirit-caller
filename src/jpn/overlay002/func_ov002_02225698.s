; func_ov002_02225698 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf09c
        .extern func_ov002_021e277c
        .global func_ov002_02225698
        .arm
func_ov002_02225698:
    stmdb sp!, {r3, lr}
    ldrh r1, [r0, #0xc]
    cmp r1, #0x1
    beq .L_1c
    cmp r1, #0x2
    beq .L_4c
    b .L_7c
.L_1c:
    ldrh r0, [r0, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    beq .L_7c
    bl func_ov002_021e277c
    b .L_7c
.L_4c:
    ldrh r0, [r0, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    beq .L_7c
    bl func_ov002_021e277c
.L_7c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
