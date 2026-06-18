; func_ov002_021e7918 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b39c4
        .global func_ov002_021e7918
        .arm
func_ov002_021e7918:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, r1
    mov r1, r2
    mov r2, #0x0
    bl func_ov002_021b39c4
    ldr r1, _LIT0
    cmp r0, r1
    beq .L_100
    ldrh r1, [r4, #0x2]
    mov r2, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r2, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    and r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r1, r1, lsl #0x10
    cmp r0, r1, lsr #0x10
    bne .L_108
.L_100:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_108:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000ffff
