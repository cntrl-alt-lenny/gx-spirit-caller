; func_0203ef50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203ec54
        .extern func_0206ea94
        .extern func_02092fc8
        .extern func_020b3714
        .global func_0203ef50
        .arm
func_0203ef50:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0206ea94
    cmp r0, #0x0
    beq .L_38
    mov r0, r4
    bl func_0203ec54
    ldrb r0, [r4, #0xd0c]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    moveq r0, #0xf
    movne r0, #0xd
    ldmia sp!, {r4, pc}
.L_38:
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
    cmpeq r0, #0xa
    movcc r0, #0xc
    ldmccia sp!, {r4, pc}
    ldrb r1, [r4, #0xd13]
    mov r2, #0x1
    mov r0, #0xb
    add r1, r4, r1, lsl #0x2
    strb r2, [r1, #0x444]
    ldmia sp!, {r4, pc}
_LIT0: .word 0x01ff6210
