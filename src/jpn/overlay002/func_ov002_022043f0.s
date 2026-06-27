; func_ov002_022043f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf098
        .extern data_ov002_022cf09c
        .extern func_ov002_021ff1d8
        .global func_ov002_022043f0
        .arm
func_ov002_022043f0:
    stmdb sp!, {r3, lr}
    ldrh r1, [r0, #0x2]
    ldr r2, _LIT0
    ldr r3, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    and ip, r1, #0x1
    mul lr, ip, r2
    ldr r3, [r3, lr]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    rsb r3, r1, #0x1
    and r3, r3, #0x1
    mul ip, r3, r2
    ldr r2, _LIT2
    ldr r2, [r2, ip]
    cmp r2, #0x0
    beq .L_5c
    bl func_ov002_021ff1d8
    cmp r0, #0x0
    movgt r0, #0x1
    ldmgtia sp!, {r3, pc}
.L_5c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
_LIT2: .word data_ov002_022cf098
