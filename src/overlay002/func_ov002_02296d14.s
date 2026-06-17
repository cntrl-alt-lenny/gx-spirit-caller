; func_ov002_02296d14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a8
        .extern func_ov002_02257ab8
        .global func_ov002_02296d14
        .arm
func_ov002_02296d14:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_02257ab8
    ldrh r2, [r4, #0x2]
    ldr r1, _LIT0
    ldr ip, _LIT1
    mov r3, r2, lsl #0x1f
    mov r3, r3, lsr #0x1f
    and lr, r3, #0x1
    mov r2, r2, lsl #0x1a
    mov r3, r2, lsr #0x1b
    mov r2, #0x14
    mul r2, r3, r2
    mla r1, lr, r1, ip
    ldr r1, [r2, r1]
    cmp r0, r1
    movcs r0, #0x1
    movcc r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a8
