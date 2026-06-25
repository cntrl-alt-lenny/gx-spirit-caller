; func_ov002_02201dc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf098
        .extern data_ov002_022cf09c
        .extern func_ov002_021ff1d8
        .global func_ov002_02201dc4
        .arm
func_ov002_02201dc4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    ldr r2, _LIT0
    ldr r3, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb ip, r1, #0x1
    and ip, ip, #0x1
    mul r2, ip, r2
    ldr r2, [r3, r2]
    cmp r2, #0x6
    movcc r0, #0x0
    ldmccia sp!, {r4, pc}
    bl func_ov002_021ff1d8
    cmp r0, #0x2
    movgt r0, #0x0
    ldmgtia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021ff1d8
    ldrh r3, [r4, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT2
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    and r3, r3, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    rsb r0, r0, #0x5
    cmp r1, r0
    movcs r0, #0x1
    movcc r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022cf09c
