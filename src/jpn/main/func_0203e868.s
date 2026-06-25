; func_0203e868 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bed88
        .extern data_020bed90
        .extern func_0203e384
        .extern func_0203e4f0
        .extern func_02092fc8
        .extern func_020b3714
        .global func_0203e868
        .arm
func_0203e868:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02092fc8
    ldr r3, [r4, #0xcb0]
    ldr r2, [r4, #0xcb4]
    subs r3, r0, r3
    sbc r0, r1, r2
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3714
    cmp r1, #0x0
    cmpeq r0, #0x12c
    bcc .L_90
    add r0, r4, #0xd00
    ldrsb r1, [r0, #0x11]
    add r1, r1, #0x2
    strb r1, [r4, #0xd11]
    ldrsb r0, [r0, #0x11]
    cmp r0, #0xd
    blt .L_6c
    mov r0, r4
    mov r1, #0x3
    bl func_0203e4f0
    ldmia sp!, {r4, pc}
.L_6c:
    bl func_02092fc8
    str r0, [r4, #0xcb0]
    str r1, [r4, #0xcb4]
    add r0, r4, #0xd00
    ldrsb r2, [r0, #0x11]
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r3, #0x200000
    bl func_0203e384
.L_90:
    mov r0, #0x3
    ldmia sp!, {r4, pc}
_LIT0: .word 0x000082ea
_LIT1: .word data_020bed88
_LIT2: .word data_020bed90
