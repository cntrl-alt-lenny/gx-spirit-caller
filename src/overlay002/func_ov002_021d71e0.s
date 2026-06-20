; func_ov002_021d71e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c93f0
        .extern func_ov002_021d479c
        .extern func_ov002_02244fe4
        .global func_ov002_021d71e0
        .arm
func_ov002_021d71e0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r2
    mov r2, r1
    mov r1, #0xb
    mov r5, r0
    bl func_ov002_021c93f0
    ldr r1, [r0]
    ldr r0, [r0]
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x2
    mov r2, r1, lsr #0x1f
    mov r0, r0, lsr #0x18
    add r3, r2, r0, lsl #0x1
    cmp r4, #0x0
    moveq ip, #0x1
    and r0, r2, #0x1
    movne ip, #0x0
    orr r0, r0, #0x1a
    orr r0, r0, ip, lsl #0x6
    mov r2, r0, lsl #0x10
    and r1, r5, #0x1
    mov r3, r3, lsl #0x16
    orr r0, r1, #0x16
    orr r0, r0, r3, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r0, #0x3f
    mov r3, #0x0
    bl func_ov002_021d479c
    mov r0, #0x24
    mov r1, #0x0
    bl func_ov002_02244fe4
    ldmia sp!, {r3, r4, r5, pc}
