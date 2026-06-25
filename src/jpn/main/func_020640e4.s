; func_020640e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020540cc
        .extern func_02061724
        .extern func_02061aec
        .extern func_02064364
        .global func_020640e4
        .arm
func_020640e4:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldr r3, [r6, #0xc]
    mov r5, r1
    mov r4, r2
    cmp r3, #0x5
    beq .L_40
    cmp r3, #0x6
    beq .L_40
    bl func_02064364
    cmp r0, #0x0
    bne .L_a4
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_40:
    ldr r0, [r6, #0x9c]
    bl func_020540cc
    cmp r0, #0x0
    beq .L_80
    mov ip, #0x1
    mov r0, r6
    mov r2, r5
    mov r3, r4
    mov r1, #0x0
    str ip, [sp]
    bl func_02061724
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x8
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_80:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    mov r3, #0x1
    bl func_02061aec
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
.L_a4:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
