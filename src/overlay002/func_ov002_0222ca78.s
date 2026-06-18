; func_ov002_0222ca78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_0225764c
        .global func_ov002_0222ca78
        .arm
func_ov002_0222ca78:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
    mov ip, r0
    ldr r0, [r3, #0x48c]
    mov r3, r1
    ldrh r1, [r0, #0x2]
    mov r1, r1, lsl #0x1f
    cmp ip, r1, lsr #0x1f
    beq .L_b78
    cmp r3, #0xb
    moveq r0, #0x800
    ldmeqia sp!, {r3, pc}
    cmp r3, #0xa
    bgt .L_b78
    mov r1, ip
    add r2, r3, r2
    bl func_ov002_0225764c
    cmp r0, #0x0
    movne r0, #0x800
    ldmneia sp!, {r3, pc}
.L_b78:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce288
