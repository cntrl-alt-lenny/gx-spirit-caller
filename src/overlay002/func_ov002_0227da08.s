; func_ov002_0227da08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0250
        .extern func_ov002_0227d6f8
        .extern func_ov002_0227d8c4
        .global func_ov002_0227da08
        .arm
func_ov002_0227da08:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0xc
    ldr r3, _LIT0
    mov r4, r1, lsl #0x2
    ldrh r3, [r3, r4]
    mov r8, r2
    mov r2, #0x0
    mov r3, r3, lsl #0x13
    mov r9, r0
    mov r5, r3, lsr #0x13
    bl func_ov002_0227d8c4
    mov r6, r0
    cmp r6, #0x0
    mov r7, #0x0
    ble .L_238
    add r4, sp, #0x4
    mvn sl, #0x0
.L_1fc:
    mov r0, r9
    mov r1, r5
    mov r2, r8
    mov r3, r7
    str r4, [sp]
    bl func_ov002_0227d6f8
    cmp r0, sl
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    mov r1, r7, lsl #0x1
    add r7, r7, #0x1
    strh r0, [r4, r1]
    cmp r7, r6
    blt .L_1fc
.L_238:
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022d0250
