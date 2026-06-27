; func_ov002_02295ea8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0cc
        .extern func_ov002_022579d0
        .global func_ov002_02295ea8
        .arm
func_ov002_02295ea8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh lr, [r4, #0x2]
    ldr r1, _LIT0
    ldr ip, _LIT1
    mov r2, lr, lsl #0x1f
    mov r3, r2, lsr #0x1f
    and r5, r3, #0x1
    mov r2, lr, lsl #0x1a
    mov r3, r2, lsr #0x1b
    mov r2, #0x14
    mul r2, r3, r2
    mla r1, r5, r1, ip
    ldr r1, [r2, r1]
    mov r1, r1, lsr #0x15
    tst r1, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    bic r1, lr, #0x3000
    orr r1, r1, #0x1000
    strh r1, [r4, #0x2]
    ldrh r1, [r4, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_022579d0
    ldrh r1, [r4, #0x2]
    cmp r0, #0x0
    bic r0, r1, #0x3000
    orr r0, r0, #0x3000
    strh r0, [r4, #0x2]
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0cc
