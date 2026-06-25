; func_ov002_021de4e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021de044
        .global func_ov002_021de4e4
        .arm
func_ov002_021de4e4:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x18
    add r5, sp, #0x0
    mov lr, #0x0
    str lr, [r5]
    mov r3, r0, lsl #0x10
    add r0, r1, r0, lsl #0x4
    mov r1, #0x1
    mov r4, r1, lsl r0
    mov r0, r3, lsr #0x10
    ldrh ip, [sp, #0x2]
    mov r3, r2
    and r0, r0, #0x1
    bic r1, ip, #0x1
    orr ip, r1, r0
    mov r0, r5
    mov r1, r4
    mov r2, #0xf
    str lr, [r5, #0x4]
    str lr, [r5, #0x8]
    str lr, [r5, #0xc]
    str lr, [r5, #0x10]
    str lr, [r5, #0x14]
    strh ip, [sp, #0x2]
    bl func_ov002_021de044
    tst r4, r0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, pc}
