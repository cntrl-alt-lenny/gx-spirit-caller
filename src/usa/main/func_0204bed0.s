; func_0204bed0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020490ac
        .extern func_0204987c
        .extern func_0204aa80
        .extern func_0204c0ac
        .extern func_0204cf08
        .extern func_0204f034
        .extern func_0204f34c
        .global func_0204bed0
        .arm
func_0204bed0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    movs r4, r0
    bne .L_1c
    bl func_0204c0ac
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_1c:
    bl func_0204f34c
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    beq .L_40
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    bne .L_9c
.L_40:
    bl func_0204987c
    ldr r0, [r0, #0x204]
    cmp r0, #0x0
    moveq r6, #0x1
    movne r6, #0x0
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    ldr r0, [r0, #0x204]
    bl func_020490ac
    mov r4, r0
    bl func_0204987c
    str r4, [sp]
    ldr r1, [r0, #0x460]
    mov r0, #0x0
    str r1, [sp, #0x4]
    ldr ip, [r5, #0x45c]
    mov r2, r6
    mov r1, #0x1
    mov r3, r0
    blx ip
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_9c:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_d0
    cmp r4, #0x1
    addne sp, sp, #0x8
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, #0x0
    bl func_0204f034
    bl func_0204aa80
    add sp, sp, #0x8
    cmp r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_d0:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    addne sp, sp, #0x8
    ldmneia sp!, {r4, r5, r6, pc}
    cmp r4, #0x1
    addne sp, sp, #0x8
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, #0x0
    mov r1, r0
    mov r2, r0
    bl func_0204cf08
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
