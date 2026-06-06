; func_ov002_021d5ab4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b34f4
        .extern func_ov002_021d479c
        .global func_ov002_021d5ab4
        .arm
func_ov002_021d5ab4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r2
    mov r2, r5, lsl #0x10
    mov r2, r2, lsr #0x10
    mov ip, r2, asr #0x8
    mov r4, r3
    and r2, r5, #0xff
    and r3, ip, #0xff
    mov r7, r0
    mov r6, r1
    bl func_ov002_021b34f4
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r7, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    mov r3, r4, lsl #0x10
    and r0, r6, #0xff
    orr r2, r1, #0x37
    orr r1, r0, #0xa00
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d479c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
