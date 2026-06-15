; func_020894e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02088fe4
        .extern func_02088ff0
        .extern func_02088ffc
        .extern func_020897fc
        .extern func_02097ea4
        .extern func_02097f10
        .global func_020894e0
        .arm
func_020894e0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    mov r5, r1
    mov r1, #0x0
    mov r4, r2
    mov r2, r1
    add r0, r6, #0x34
    bl func_02097ea4
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, r6
    add r0, r6, #0x34
    mov r2, #0x30
    bl func_02097f10
    cmp r0, #0x30
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    cmp r5, #0x0
    beq .L_29c
    mov r0, #0x0
    str r0, [sp]
    ldr r1, [r6, #0x1c]
    ldr r2, _LIT0
    mov r0, r5
    mov r3, r6
    bl func_020897fc
    str r0, [r6, #0x8c]
    ldr r0, [r6, #0x8c]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, [r6, #0x18]
    add r0, r6, #0x34
    mov r2, #0x0
    bl func_02097ea4
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, [r6, #0x8c]
    ldr r2, [r6, #0x1c]
    add r0, r6, #0x34
    bl func_02097f10
    ldr r1, [r6, #0x1c]
    cmp r0, r1
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, #0x0
    str r0, [sp]
    ldr r1, [r6, #0x24]
    ldr r2, _LIT1
    mov r0, r5
    mov r3, r6
    bl func_020897fc
    str r0, [r6, #0x84]
    ldr r0, [r6, #0x84]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, [r6, #0x20]
    add r0, r6, #0x34
    mov r2, #0x0
    bl func_02097ea4
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, [r6, #0x84]
    ldr r2, [r6, #0x24]
    add r0, r6, #0x34
    bl func_02097f10
    ldr r1, [r6, #0x24]
    cmp r0, r1
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    cmp r4, #0x0
    beq .L_29c
    ldr r1, [r6, #0x14]
    cmp r1, #0x0
    beq .L_29c
    mov r4, #0x0
    ldr r2, _LIT2
    mov r0, r5
    mov r3, r6
    str r4, [sp]
    bl func_020897fc
    str r0, [r6, #0x88]
    ldr r0, [r6, #0x88]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, r4
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, [r6, #0x10]
    add r0, r6, #0x34
    mov r2, r4
    bl func_02097ea4
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, r4
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, [r6, #0x88]
    ldr r2, [r6, #0x14]
    add r0, r6, #0x34
    bl func_02097f10
    ldr r1, [r6, #0x14]
    cmp r0, r1
    addne sp, sp, #0x8
    movne r0, r4
    ldmneia sp!, {r4, r5, r6, pc}
.L_29c:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word func_02088ffc
_LIT1: .word func_02088ff0
_LIT2: .word func_02088fe4
