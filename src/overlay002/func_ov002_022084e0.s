; func_ov002_022084e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cf178
        .extern func_ov002_021b3ecc
        .extern func_ov002_02207a70
        .global func_ov002_022084e0
        .arm
func_ov002_022084e0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldr r2, _LIT0
    ldr r3, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb ip, r0, #0x1
    and ip, ip, #0x1
    mul r2, ip, r2
    ldr r2, [r3, r2]
    mov r5, r1
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r2, _LIT2
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    ldreq r0, _LIT3
    ldreq r0, [r0, #0x24]
    cmpeq r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    mov r1, r5
    bl func_ov002_02207a70
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf178
_LIT2: .word 0x00001846
_LIT3: .word data_ov002_022cd3f4
