; func_ov002_0221b5e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021e267c
        .global func_ov002_0221b5e4
        .arm
func_ov002_0221b5e4:
    stmdb sp!, {r3, lr}
    mov r3, r0
    ldrh r1, [r3, #0x2]
    ldr r0, _LIT0
    mov r1, r1, lsl #0x1f
    mov r2, r1, lsr #0x1f
    ldr r1, [r0, #0xcec]
    rsb r0, r2, #0x1
    cmp r1, r0
    moveq r1, #0x1
    movne r1, #0x0
    add r1, r1, #0x1
    and r1, r1, #0xff
    mov r1, r1, lsl #0x4
    orr r1, r1, #0x1
    mov r2, r1, lsl #0x10
    ldrh r1, [r3]
    mov r2, r2, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021e267c
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d008c
