; func_ov002_021edab4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cf08c
        .extern func_ov002_021c1e10
        .global func_ov002_021edab4
        .arm
func_ov002_021edab4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r2
    cmp r4, #0x5
    mov r5, r1
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, pc}
    ldrh r3, [r0, #0x2]
    mov r3, r3, lsl #0x1f
    cmp r5, r3, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r3, _LIT0
    ldr ip, _LIT1
    and lr, r5, #0x1
    mla ip, lr, r3, ip
    mov r3, #0x14
    mla r3, r4, r3, ip
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov002_021c1e10
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT2
    ldr r1, [r0]
    cmp r1, r5
    ldreq r0, [r0, #0x1c]
    cmpeq r0, r4
    moveq r0, #0x0
    movne r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cd314
