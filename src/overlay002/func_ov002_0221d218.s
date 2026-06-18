; func_ov002_0221d218 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_02217888
        .extern func_ov002_022205f8
        .global func_ov002_0221d218
        .arm
func_ov002_0221d218:
    stmdb sp!, {r3, lr}
    ldrh r2, [r0, #0x4]
    mov r2, r2, lsl #0x1d
    movs r2, r2, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldrh r2, [r0, #0xa]
    cmp r2, #0x1
    beq .L_170
    cmp r2, #0x2
    beq .L_178
    b .L_1a4
.L_170:
    bl func_ov002_02217888
    ldmia sp!, {r3, pc}
.L_178:
    ldr r2, _LIT0
    ldr r2, [r2, #0xd0]
    tst r2, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    mov r2, r2, lsr #0x1
    tst r2, #0x1
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov002_022205f8
    ldmia sp!, {r3, pc}
.L_1a4:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d016c
