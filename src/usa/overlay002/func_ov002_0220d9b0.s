; func_ov002_0220d9b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021b8eec
        .extern func_ov002_02206690
        .global func_ov002_0220d9b0
        .arm
func_ov002_0220d9b0:
    stmdb sp!, {r3, lr}
    ldrh r3, [r0, #0x2]
    mov r2, r3, lsl #0x12
    movs r2, r2, lsr #0x1e
    bne .L_17c
    ldr r2, _LIT0
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    ldr ip, [r2, #0xcec]
    rsb r3, r3, #0x1
    cmp ip, r3
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r2, [r2, #0xcf8]
    cmp r2, #0x2
    cmpne r2, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    bl func_ov002_02206690
    ldmia sp!, {r3, pc}
.L_17c:
    mov r0, r3, lsl #0x1f
    mov r1, r3, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b8eec
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d008c
