; func_02008f24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f3c
        .extern func_02008c10
        .extern func_02008d60
        .extern func_02011b4c
        .extern func_02011b68
        .extern func_02011b9c
        .extern func_020945f4
        .extern func_020aadf8
        .global func_02008f24
        .arm
func_02008f24:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_02008c10
    cmp r6, #0x0
    beq .L_230
    cmp r6, #0x1
    beq .L_240
    b .L_290
.L_230:
    mov r0, r5
    mov r1, r4
    bl func_02008d60
    ldmia sp!, {r4, r5, r6, pc}
.L_240:
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x124
    bl func_020945f4
    ldr r1, _LIT0
    add r0, r5, #0x1
    ldr r1, [r1, #0x14]
    mov r1, r1, lsl #0x1d
    mov r1, r1, lsr #0x1d
    strb r1, [r4]
    bl func_02011b68
    mov r1, r0
    add r0, r4, #0x1
    bl func_020aadf8
    add r0, r5, #0x1
    bl func_02011b4c
    mov r1, r0
    add r0, r4, #0x1c
    bl func_02011b9c
    ldmia sp!, {r4, r5, r6, pc}
.L_290:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02104f3c
