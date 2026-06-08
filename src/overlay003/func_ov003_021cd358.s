; func_ov003_021cd358 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201ef90
        .global func_ov003_021cd358
        .arm
func_ov003_021cd358:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x18
    cmp r2, #0x4
    addls pc, pc, r2, lsl #0x2
    b .L_4dc
    b .L_4dc
    b .L_4e4
    b .L_4ec
    b .L_4f4
    b .L_4fc
.L_4dc:
    mov lr, #0xc0
    b .L_500
.L_4e4:
    mov lr, #0x180
    b .L_500
.L_4ec:
    mov lr, #0x200
    b .L_500
.L_4f4:
    mov lr, #0x300
    b .L_500
.L_4fc:
    mov lr, #0x380
.L_500:
    mov ip, #0x1b8
    mul ip, r1, ip
    cmp r1, #0x0
    add r4, r2, #0x1
    movne r5, #0x1
    add r7, r0, #0x190
    add r6, r0, #0x1a4
    moveq r5, #0x2
    mov r4, r4, lsl #0x9
    stmia sp, {r4, r5}
    add r1, r0, #0x1b8
    add r8, r0, #0x320
    add r0, r8, ip
    str r3, [sp, #0x8]
    mov r8, #0x1
    add r7, r7, ip
    add r5, r0, r2, lsl #0x3
    add r6, r6, ip
    add r4, r1, ip
    mov r3, #0x48
    add r0, r7, r2, lsl #0x2
    add r1, r6, r2, lsl #0x2
    mla r2, r3, r2, r4
    str r8, [sp, #0xc]
    mov r3, #0x200
    str r3, [sp, #0x10]
    mov r3, lr, lsl #0x7
    str r5, [sp, #0x14]
    bl func_0201ef90
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
