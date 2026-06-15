; func_0201af80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c59ec
        .extern func_02018f80
        .extern func_02018f90
        .global func_0201af80
        .arm
func_0201af80:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_02018f80
    mov r4, r0
    bl func_02018f90
    ldr ip, _LIT0
    mov r3, #0x0
.L_1ec:
    ldr r2, [ip]
    mov r1, r2, lsl #0x18
    cmp r4, r1, lsr #0x18
    moveq r1, r2, lsl #0x14
    cmpeq r0, r1, lsr #0x1c
    moveq r1, r2, lsl #0xc
    cmpeq r5, r1, lsr #0x18
    moveq r0, ip
    ldmeqia sp!, {r3, r4, r5, pc}
    add r3, r3, #0x1
    cmp r3, #0x1
    add ip, ip, #0x4
    bcc .L_1ec
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_020c59ec
