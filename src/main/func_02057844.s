; func_02057844 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021000a4
        .extern data_021000ac
        .extern data_021000b0
        .extern func_020602c4
        .extern func_020ab054
        .extern Strchr
        .extern func_020ace00
        .global func_02057844
        .arm
func_02057844:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r5, r2
    mov r0, #0x0
    mov r6, r1
    str r0, [r5]
    ldr r1, [r6, #0x8]
    mov r7, r3
    cmp r1, #0x5
    addlt sp, sp, #0x14
    ldmltia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [r6]
    mov r1, #0xa
    bl Strchr
    movs r4, r0
    beq .L_f10
    ldr r1, _LIT0
    sub r0, r4, #0x5
    mov r2, #0x5
    bl func_020ab054
    cmp r0, #0x0
    addne sp, sp, #0x14
    movne r0, #0x3
    ldmneia sp!, {r4, r5, r6, r7, pc}
    mov r0, #0x0
    strb r0, [r4]
    ldr r0, [r6]
    ldr r1, _LIT1
    add r2, sp, #0x0
    mov r3, #0x10
    bl func_020602c4
    cmp r0, #0x0
    addeq sp, sp, #0x14
    moveq r0, #0x3
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    add r0, sp, #0x0
    bl func_020ace00
    str r0, [r7]
    ldr r0, [r6]
    ldr r1, _LIT2
    add r2, sp, #0x0
    mov r3, #0x10
    bl func_020602c4
    cmp r0, #0x0
    addeq sp, sp, #0x14
    moveq r0, #0x3
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    add r0, sp, #0x0
    bl func_020ace00
    ldr r2, [r6]
    add r1, r0, #0x1
    sub r2, r4, r2
    ldr r3, [r6, #0x8]
    add r2, r1, r2
    cmp r3, r2
    ble .L_f08
    ldrsb r2, [r4, r1]
    cmp r2, #0x0
    addne sp, sp, #0x14
    movne r0, #0x3
    ldmneia sp!, {r4, r5, r6, r7, pc}
    add r3, r4, #0x1
    ldr r2, [sp, #0x28]
    str r3, [r5]
    str r0, [r2]
    ldr r0, [r6]
    sub r0, r4, r0
    add r0, r1, r0
    add r0, r0, #0x1
    str r0, [r6, #0xc]
    b .L_f10
.L_f08:
    mov r0, #0xa
    strb r0, [r4]
.L_f10:
    mov r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_021000a4
_LIT1: .word data_021000ac
_LIT2: .word data_021000b0
