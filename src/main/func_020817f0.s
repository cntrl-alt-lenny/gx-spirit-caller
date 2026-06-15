; func_020817f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020807fc
        .global func_020817f0
        .arm
func_020817f0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov sl, r0
    ldr r6, [sl, #0x8]
    ldr r5, [sl, #0x4]
    ldr r4, [sp, #0x30]
    add r0, sp, #0x8
    str r4, [sp, #0x8]
    ldr r4, [r5, #0x4]
    mov r9, r1
    mov r8, r2
    mov r7, r3
    blx r4
    cmp r0, #0x0
    beq .L_3d4
    add fp, sp, #0x8
.L_398:
    cmp r0, #0xa
    beq .L_3d4
    str r7, [sp]
    str r0, [sp, #0x4]
    ldr r0, [sl]
    mov r1, r5
    mov r2, r9
    mov r3, r8
    bl func_020807fc
    add r1, r9, r0
    mov r0, fp
    add r9, r1, r6
    blx r4
    cmp r0, #0x0
    bne .L_398
.L_3d4:
    ldr r1, [sp, #0x34]
    cmp r1, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r0, #0xa
    ldreq r1, [sp, #0x8]
    ldr r0, [sp, #0x34]
    movne r1, #0x0
    str r1, [r0]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
