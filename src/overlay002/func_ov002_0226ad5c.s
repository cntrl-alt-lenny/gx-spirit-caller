; func_ov002_0226ad5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0226acf8
        .global func_ov002_0226ad5c
        .arm
func_ov002_0226ad5c:
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    mov ip, #0x0
    ldmeqia sp!, {r3, pc}
    cmp r2, #0x0
    orrne r2, ip, #0x1
    movne r2, r2, lsl #0x10
    movne ip, r2, lsr #0x10
    cmp r3, #0x0
    orrne r2, ip, #0x2
    movne r2, r2, lsl #0x10
    movne ip, r2, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r3, ip
    mov r1, #0x1
    bl func_ov002_0226acf8
    ldmia sp!, {r3, pc}
