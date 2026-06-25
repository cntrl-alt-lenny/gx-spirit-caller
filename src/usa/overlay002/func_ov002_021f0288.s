; func_ov002_021f0288 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c4
        .extern func_ov002_021b9dec
        .global func_ov002_021f0288
        .arm
func_ov002_021f0288:
    stmdb sp!, {r4, lr}
    ldr r3, _LIT0
    mov ip, #0x14
    ldr lr, _LIT1
    and r4, r1, #0x1
    mul ip, r2, ip
    mla r3, r4, r3, lr
    ldrh r3, [ip, r3]
    mov r4, r0
    cmp r3, #0x0
    beq .L_64c
    mov r0, r1
    mov r1, r2
    bl func_ov002_021b9dec
    ldrh r1, [r4]
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_64c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c4
