; func_ov002_021d8038 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d46ac
        .global func_ov002_021d8038
        .arm
func_ov002_021d8038:
    stmdb sp!, {r3, lr}
    cmp r2, #0x0
    movne ip, #0x1
    moveq ip, #0x0
    cmp r0, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    ldr r1, [r1]
    orr r3, r0, #0x33
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r2, r0, r1, lsr #0x1f
    mov r0, r3, lsl #0x10
    mov r3, r2, lsl #0x10
    mov r1, ip, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r3, r3, lsr #0x10
    mov r1, #0xe
    bl func_ov002_021d46ac
    ldmia sp!, {r3, pc}
