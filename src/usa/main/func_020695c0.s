; func_020695c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054cd8
        .extern func_02054f8c
        .extern func_020677fc
        .extern func_020696ac
        .extern func_02069e50
        .extern func_0206b1e4
        .global func_020695c0
        .arm
func_020695c0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x4b0]
    bl func_02054f8c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r4, [r6, #0x80]
    ldr r1, [r6, #0x7c]
    ldr r0, [r6, #0x4b0]
    add r1, r1, r4
    rsb r2, r4, #0x1000
    mov r3, #0x0
    bl func_02054cd8
    add r1, r0, #0x1
    cmp r1, #0x1
    bhi .L_17c
    mov r0, r6
    bl func_0206b1e4
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_17c:
    ldr r1, [r6, #0x80]
    mov r5, #0x0
    add r0, r1, r0
    str r0, [r6, #0x80]
    ldr r0, [r6]
    cmp r0, #0x2
    beq .L_1a4
    ldr r0, [r6, #0x5c8]
    cmp r0, #0x0
    ble .L_1c0
.L_1a4:
    ldr r1, [r6, #0x7c]
    ldr r2, [r6, #0x80]
    ldr r0, _LIT0
    add r1, r1, r4
    add r0, r6, r0
    sub r2, r2, r4
    bl func_020677fc
.L_1c0:
    ldr r0, [r6]
    cmp r0, #0x3
    bne .L_1d8
    mov r0, r6
    bl func_02069e50
    mov r5, r0
.L_1d8:
    cmp r5, #0x0
    movne r0, r5
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, [r6]
    cmp r0, #0x2
    bne .L_208
    ldr r0, [r6, #0x80]
    cmp r0, #0x0
    ble .L_208
    mov r0, r6
    bl func_020696ac
    ldmia sp!, {r4, r5, r6, pc}
.L_208:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x000004bc
