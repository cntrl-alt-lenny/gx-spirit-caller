; func_ov002_021d7a54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d46ac
        .extern func_ov002_02244efc
        .global func_ov002_021d7a54
        .arm
func_ov002_021d7a54:
    stmdb sp!, {r3, r4, r5, lr}
    mov r3, #0x0
    add r4, sp, #0x0
    str r3, [r4]
    ldr lr, [r1]
    sub ip, r3, #0x200
    mov r4, lr, lsl #0x2
    mov r4, r4, lsr #0x18
    mov r5, lr, lsl #0x12
    mov r4, r4, lsl #0x1
    add r4, r4, r5, lsr #0x1f
    ldr lr, _LIT0
    and r5, ip, #0x0
    and r4, r4, lr
    orr r4, r5, r4
    and ip, r2, #0x1
    cmp ip, #0x0
    movgt r3, #0x1
    eor r3, r0, r3
    bic r4, r4, #0x200
    mov lr, r0, lsl #0x1f
    orr r4, r4, lr, lsr #0x16
    bic lr, r4, #0x400
    str lr, [sp]
    ldr ip, [sp]
    cmp r0, #0x0
    movne r0, #0x8000
    bic ip, ip, #0x800
    mov r3, r3, lsl #0x1f
    orr r3, ip, r3, lsr #0x14
    bic r3, r3, #0xf000
    orr r3, r3, #0xf000
    str r3, [sp]
    moveq r0, #0x0
    ldr r1, [r1]
    orr ip, r0, #0x33
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r3, r0, r1, lsr #0x1f
    mov r0, ip, lsl #0x10
    mov r1, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r3, r3, lsr #0x10
    mov r1, #0xb
    bl func_ov002_021d46ac
    ldr r1, [sp]
    mov r0, #0x1e
    bl func_ov002_02244efc
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000001ff
