; func_ov002_0222cc50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021d59cc
        .extern func_ov002_02211b64
        .global func_ov002_0222cc50
        .arm
func_ov002_0222cc50:
    stmdb sp!, {r3, lr}
    ldr ip, _LIT0
    ldr r2, [ip, #0x5a8]
    cmp r2, #0x1
    beq .L_198
    bl func_ov002_02211b64
    ldmia sp!, {r3, pc}
.L_198:
    ldrh r2, [r0, #0x2]
    mov r1, #0x0
    mov r3, #0x17
    str r1, [sp]
    ldrh r1, [r0, #0x2]
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsl #0x1a
    mov r1, r1, lsr #0x1b
    and r2, r0, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r2, r1, lsl #0x10
    ldr r1, [ip, #0x5ac]
    mov r2, r2, lsr #0x10
    bl func_ov002_021d59cc
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce288
