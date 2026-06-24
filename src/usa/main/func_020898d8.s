; func_020898d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208999c
        .extern func_02095d74
        .extern func_02095f4c
        .global func_020898d8
        .arm
func_020898d8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x20
    mov r8, r0
    add r0, sp, #0x8
    mov r7, r1
    mov r6, r2
    mov r5, r3
    ldr r4, [sp, #0x40]
    bl func_02095f4c
    ldr r1, [sp, #0x8]
    ldr r0, [sp, #0xc]
    str r1, [sp]
    str r0, [sp, #0x4]
    cmp r7, #0x0
    add r2, sp, #0x0
    addeq sp, sp, #0x20
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    add r1, sp, #0x10
    mov r0, r7
    bl func_02095d74
    cmp r0, #0x0
    beq .L_b8
    add sl, sp, #0x10
    add r9, sp, #0x0
.L_64:
    ldrb r0, [sp, #0x10]
    cmp r0, #0x1
    bne .L_a0
    ldrh r0, [sp, #0x14]
    cmp r6, r0
    bne .L_a0
    ldrh r1, [sp, #0x12]
    mov r0, r8
    mov r2, r5
    mov r3, r4
    bl func_0208999c
    cmp r0, #0x0
    addeq sp, sp, #0x20
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_a0:
    mov r0, r7
    mov r1, sl
    mov r2, r9
    bl func_02095d74
    cmp r0, #0x0
    bne .L_64
.L_b8:
    mov r0, #0x1
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
