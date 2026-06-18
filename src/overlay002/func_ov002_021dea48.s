; func_ov002_021dea48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021de134
        .global func_ov002_021dea48
        .arm
func_ov002_021dea48:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x18
    add lr, sp, #0x0
    mov ip, #0x0
    str ip, [lr]
    eor r2, r0, r2
    add r1, r1, r0, lsl #0x4
    mov r0, r2, lsl #0x10
    mov r2, #0x1
    mov r4, r2, lsl r1
    ldrh r5, [sp, #0x2]
    mov r0, r0, lsr #0x10
    strh r3, [sp]
    bic r1, r5, #0x1
    and r0, r0, #0x1
    orr r5, r1, r0
    mov r0, lr
    mov r1, r4
    mov r3, ip
    mov r2, #0xd
    str ip, [lr, #0x4]
    str ip, [lr, #0x8]
    str ip, [lr, #0xc]
    str ip, [lr, #0x10]
    str ip, [lr, #0x14]
    strh r5, [sp, #0x2]
    bl func_ov002_021de134
    tst r4, r0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, pc}
