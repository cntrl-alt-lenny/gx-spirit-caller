; func_ov002_0226ada4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0226acf8
        .global func_ov002_0226ada4
        .arm
func_ov002_0226ada4:
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    mov ip, #0x0
    ldmeqia sp!, {r3, pc}
    cmp r2, #0x1
    orreq ip, ip, #0x1
    moveq ip, ip, lsl #0x10
    moveq ip, ip, lsr #0x10
    cmp r3, #0x0
    orrne r3, ip, #0x2
    movne r3, r3, lsl #0x10
    movne ip, r3, lsr #0x10
    cmp r2, #0x8
    orreq r3, ip, #0x4
    moveq r3, r3, lsl #0x10
    moveq ip, r3, lsr #0x10
    cmp r2, #0x7
    orreq r2, ip, #0x8
    moveq r2, r2, lsl #0x10
    moveq ip, r2, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r3, ip
    mov r1, #0x1
    bl func_ov002_0226acf8
    ldmia sp!, {r3, pc}
